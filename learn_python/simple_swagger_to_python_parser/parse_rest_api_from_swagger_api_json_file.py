import json
import os
import shutil

URL = 'urls'
JSON = 'json'
CALL = 'call'

PROJECT_SDC = 'sdc'
PROJECT_NCSO = 'ncso'

def main():
    project_name = PROJECT_NCSO
    shutil.copy('./api.json.'+project_name,'./api.json')
    json_data=open('./api.json').read()
    data = json.loads(json_data)
    definitions = data['definitions']
    if os.path.exists('./api'):
        shutil.rmtree('./api',)
    os.makedirs('./api')
    py_init_file= open('./api/__init__.py', 'a')
    py_init_file.close()
    os.makedirs('./api/calls')
    py_init_file= open('./api/calls/__init__.py', 'a')
    py_init_file.close()
    os.makedirs('./api/swagger_model')
    py_init_file= open('./api/swagger_model/__init__.py', 'a')
    py_init_file.close()
    os.makedirs('./api/swagger_model/urls')
    py_init_file= open('./api/swagger_model/urls/__init__.py', 'a')
    py_init_file.close()
    os.makedirs('./api/swagger_model/json_bodies')
    py_init_file= open('./api/swagger_model/json_bodies/__init__.py', 'a')
    py_init_file.close()


    create_api_metadata_file(data)

    base_path = get_value_from_json_by_path(data, 'basePath')

    paths = get_value_from_json_by_path(data, 'paths')
    for path in paths:
        there_is_a_json_file = False
        for method in ['post', 'get', 'put', 'delete']:
            method_path = 'paths~'+path+'~'+method
            try:
                method_dict = get_value_from_json_by_path(data, method_path, '~')
            except:
                continue

            tag = get_value_from_json_by_path(method_dict, 'tags')
            urls_class_file = get_class_file_by_tag(tag[0], URL)
            url_requires_replacement_dict = add_to_class_file(urls_class_file, method_dict, method, path, URL)

            # calls_class_file = get_class_file_by_tag(tag[0], CALL)
            # add_to_class_file(calls_class_file, method_dict, method, path, CALL, tag=tag[0])

            if method in ['post', 'put']:
                there_is_a_json_file = True
                jsons_class_file = get_class_file_by_tag(tag[0], JSON)
                json_body_requires_replacement_dict = generate_json_body_files(definitions, method_dict, method, path, tag, jsons_class_file)
            else:
                json_body_requires_replacement_dict = False

            calls_class_file = get_class_file_by_tag(tag[0], CALL)
            add_to_class_file(calls_class_file, method_dict, method, path, CALL,
                              url_requires_replacement_dict=url_requires_replacement_dict,
                              json_body_requires_replacement_dict=json_body_requires_replacement_dict,
                              tag=tag[0])
            if not there_is_a_json_file:
                print(tag)


    if os.path.exists('./api_'+project_name):
        shutil.rmtree('./api_'+project_name)
    shutil.copytree('./api','./api_'+project_name)

def generate_json_body_files(definitions, method_dict, method, path, tag, class_file):
    json_body_filename = generate_api_function_json_body_filename(method_dict, method, path)
    json_body = extract_json_body_from_method_dict(definitions, method_dict)
    rest_family = tag[0].lower().replace(' - ','_').replace('-','_').replace(' ','_')
    json_body_file = open('./api/swagger_model/json_bodies/'+rest_family+'/'+json_body_filename, 'w')
    json_body_file.write(json.dumps(json_body, file, indent=4))
    json_body_file.close()


    requires_replacement_dict = add_to_class_file(class_file, method_dict, method, json.dumps(json_body, indent=4), JSON)
    class_file.close()
    return requires_replacement_dict


def extract_json_body_from_method_dict(definitions, method_dict):
    json_body = {}
    for parameter in method_dict['parameters']:
        if parameter['in'] == 'body':
            if '$ref' in parameter['schema'].keys():
                json_body = extract_json_body_from_ref(definitions, parameter['schema']['$ref'])
            else:
                pass
            break
        else:
            pass


    return json_body


def extract_json_body_from_ref(definitions, ref_name):
    json_body = {}
    ref_name = ref_name.rsplit('/',1)[-1]
    if 'properties' in definitions[ref_name].keys():
        properties_dict = definitions[ref_name]['properties']
        for property in properties_dict.keys():
            if '$ref' in properties_dict[property].keys():
                json_body[property] = extract_json_body_from_ref(definitions, properties_dict[property]['$ref'])
            else:
                json_body[property] = properties_dict[property]['type']

    return json_body


def create_api_metadata_file(data):
    metadata_file = open('./api/swagger_model/api_sdc.metadata', 'a')
    metadata_file.write('# API Information:' + '\n')
    metadata_file.write('#-----------------' + '\n')
    metadata_file.write('# swagger version: ' + get_value_from_json_by_path(data, 'swagger') + '\n')
    metadata_file.write('# description: ' + get_value_from_json_by_path(data, 'info.description') + '\n')
    metadata_file.write('# version: ' + get_value_from_json_by_path(data, 'info.version') + '\n')


#TODO: change name of content_path_or_json variable
def add_to_class_file(class_file, method_dict, method, content_path_or_json, class_type,
                      url_requires_replacement_dict=True,
                      json_body_requires_replacement_dict=True,
                      tag=''):

            doc_string = ''
            doc_string = doc_string + '# -----------------------------------------------------------------'+ '\n'

            summary = get_value_from_json_by_path(method_dict,'summary').replace('.','').replace('(','').replace(')','').replace('-','_').replace("'",'')
            doc_string = doc_string + '# Summary: ' + summary + '\n'

            description = get_value_from_json_by_path(method_dict,'description')
            description = get_value_from_json_by_path(method_dict,'description').replace('\n','\n#    ')
            doc_string = doc_string + '# Description: ' + description + '\n'

            operatiod_id = get_value_from_json_by_path(method_dict,'operationId')
            doc_string = doc_string + '# OperationID: ' + operatiod_id + '\n'
            doc_string = doc_string + '# -----------------------------------------------------------------'+ '\n\n'

            requires_replacement_dict = True

            if class_type == URL:
                class_file.write(doc_string)
                code_line = generate_api_url_method_code_line(method, summary, content_path_or_json)
                class_file.write('    ' + code_line + '\n')
                if (code_line.find('{') == -1):
                    requires_replacement_dict = False

                class_file.write('# -----------------------------------------------------------------'+ '\n\n')
            elif class_type == CALL:
                add_api_call_method_code(method, summary, content_path_or_json, class_file, tag, description, operatiod_id,
                                         url_requires_replacement_dict,
                                         json_body_requires_replacement_dict)
                class_file.write('\n\n')
            else:
                class_file.write(doc_string)
                code_line = generate_api_json_method_code_line(method, summary, content_path_or_json)
                class_file.write('    ' + code_line + '\n')
                if code_line == '{}':
                    requires_replacement_dict = False
                class_file.write('# -----------------------------------------------------------------'+ '\n\n')


            return requires_replacement_dict


def get_class_file_by_tag(tag, class_type):
    class_name = tag.replace(' ','').replace('-','')
    tag = tag.lower().replace(' - ','_').replace('-','_').replace(' ','_')

    if class_type == URL:
        class_filename = './api/swagger_model/urls/'+tag+'.py'
    elif class_type == CALL:
        class_filename = './api/calls/'+tag+'.py'
    else:
        class_filename = './api/swagger_model/json_bodies/'+tag+'.py'


    if not os.path.exists(class_filename):
        class_file = open(class_filename, 'a')

        if class_type == URL:
            class_file.write('from general.core.simple_swagger_parser_rest_api.pattern_url import PatternUrl' + '\n')
            class_file.write('from products.asdc.setup_asdc import SetupASDC' + '\n\n')
            class_file.write('class '+ class_name +'Url(object):' + '\n\n')

            os.makedirs('./api/swagger_model/json_bodies/'+tag)
        elif class_type == CALL:
            class_file.write('from ..swagger_model.urls.'+tag+' import ' + class_name + 'Url\n')
            class_file.write('from ..swagger_model.json_bodies.'+tag+' import ' + class_name + 'Json\n')
            class_file.write('from general.core.simple_swagger_parser_connectivity_layer.http_request import HttpRequest\n\n')
            class_file.write('class '+ class_name +'Calls(object):' + '\n\n')
        else:
            class_file.write('from general.core.simple_swagger_parser_rest_api.pattern_json import PatternJson' + '\n\n')
            class_file.write('class '+ class_name +'Json(object):' + '\n\n')

    else:
        class_file = open(class_filename, 'a')



    return class_file


def generate_api_function_json_body_filename(method_dict, method, path):
    summary = method_dict['summary'].replace('.','').replace('(','').replace(')','').replace('-','_').replace("'",'')
    json_body_filename = method + '_'
    json_body_filename = json_body_filename + summary.lower().replace(' ','_').replace('\'s','_s') + '.json'

    return json_body_filename


def generate_api_url_method_code_line(method, summary, path):
    code_line = method + '_'
    code_line = code_line + summary.lower().replace(' ','_') + ' = '
    code_line = code_line + 'PatternUrl(str(SetupASDC.rest_api_url()) + \'' + path + '\')'

    code_line = code_line.replace(method+'_'+method, method)

    return code_line


def add_api_call_method_code(method, summary, path, class_file, tag, description, operatiod_id,
                             url_requires_replacement_dict=True,
                             json_body_requires_replacement_dict=True):

        description = description.replace('#    ','        ')
        doc_string = '        """\n'
        doc_string = doc_string + '        Summary: ' + summary + '\n\n'
        doc_string = doc_string + '        Description: ' + description + '\n\n'
        doc_string = doc_string + '        OperationID: ' + operatiod_id + '\n'
        doc_string = doc_string + '        """\n'

        if url_requires_replacement_dict:
            url_replacement_dict = ', url_replacement_dict'
        else:
            url_replacement_dict = ''

        if json_body_requires_replacement_dict:
            json_body_replacement_dict = ', json_body_replacement_dict'
        else:
            json_body_replacement_dict = ''

        class_name = tag.replace(' ','').replace('-','')
        method_name = method + '_' + summary.lower().replace(' ','_').replace('-','').replace('.','').replace('\'','')
        method_name = method_name.replace('get_get_','get_')\
            .replace('delete_delete_','delete_')\
            .replace('put_put_','put_')\
            .replace('post_post_','post_')
        class_file.write('    @classmethod\n')

        if method in ['post', 'put']:
            class_file.write('    def ' + method_name + '(self' + url_replacement_dict + json_body_replacement_dict + '):\n')
        else:
            class_file.write('    def ' + method_name + '(self' + url_replacement_dict + '):\n')

        class_file.write(doc_string)

        if url_requires_replacement_dict:
            url_replacement_dict = 'url_replacement_dict'
        else:
            url_replacement_dict = '{}'
        class_file.write('        url = ' + class_name + 'Url.' + method_name + '.replace('+ url_replacement_dict + ')\n')

        if method in ['post', 'put']:
            if json_body_requires_replacement_dict:
                json_body_replacement_dict = 'json_body_replacement_dict'
            else:
                json_body_replacement_dict = '{}'
            class_file.write('        json_body = '+ class_name +'Json.'+method_name+'.replace_all_fields(' + json_body_replacement_dict + ')\n\n')
            class_file.write('        response = HttpRequest.' + method + '(url, json_body)\n')
        else:
            class_file.write('        response = HttpRequest.' + method + '(url)\n')

        class_file.write('\n')
        class_file.write('        return response\n')


def generate_api_json_method_code_line(method, summary, json_body):
    code_line = method + '_'
    code_line = code_line + summary.lower().replace(' ','_') + ' = '
    code_line = code_line + 'PatternJson(' + json_body + ')'

    code_line = code_line.replace(method+'_'+method, method)

    return code_line


def get_value_from_json_by_path(tree, path, divider = '.'):
    if (type(tree) is str):
        try:
            tree = json.loads(tree)
        except:
            tree = {"json_formatted": "FALSE", "contents": tree}
    elif not isinstance(tree, dict):
        raise TypeError('Check that passed parameter "tree" is a string formatted as JSON or a dictionary')
    try:
        head, tail = path.split(divider, 1)
    except:
        #TODO: Print out the exception as debug logger
        # print tree
        # print path
        return tree[path]

    #if isdigit(head)==true then this is clearly an indice of an array in the JSON, so convert to number and proceed
    head = str(head)
    if str.isdigit(head):
        head = int(head)
        return get_value_from_json_by_path(tree[head], tail, divider)
    else:
        return get_value_from_json_by_path(tree[head], tail, divider)


if __name__ == "__main__":
  main()