import os
import pathlib
from fnmatch import fnmatch
import ntpath
from learn_python.operating_system import s


class DummyClass:
    """ please don't touch this class in any way.
        it's used for dynamic objects"""
    def __init__(self):
        pass


def create_dynamic_object(keys, values):
    """ create objects in runtime!
        keys & values are lists/tuples with equal length
        keys must contain strings only
    """
    obj = DummyClass()
    for i in range(len(keys)):
        setattr(obj, keys[i], values[i])
    return obj


def dict_to_object(dictionary):
    """ parse an object and return a dictionary """
    obj = DummyClass()
    for key in dictionary:
        setattr(obj, key, dictionary[key])
    return obj


def object_to_dict(object):
    """ parse an object and return a dictionary """
    results = {}
    obj_dict = object.__dict__
    for key in obj_dict:
        if not key.startswith('__'):
            results[key] = obj_dict[key]
    return results


def get_root_directory():
    return os.path.dirname(os.path.abspath(__file__))


def deep_files_search(root_directory, pattern="*.txt"):
    """search for files under a directory and all its sub directories"""
    results = []
    for path, subdirs, files in os.walk(root_directory):
        for name in files:
            if fnmatch(name, pattern):
                results.append(str(pathlib.PurePath(path, name)))
    return results


def get_file_full_name(path):
    head, tail = ntpath.split(path)
    return tail or ntpath.basename(head)


def get_file_name_and_type(file_full_name):
    return file_full_name.split('.')


def get_file_directory(path):
    return os.path.dirname(os.path.realpath(path))


def get_element_map_from_file(file, patterns):
    if isinstance(patterns, str):
        patterns = [patterns]
    results = set()
    with open(file, 'r') as f:
        string = f.read()
    for pattern in patterns:
        lines = string.split(pattern + '="')
        if len(lines) > 1:
            for i in range(1, len(lines)):
                value = lines[i].split('"')[0]
                name = value.replace('-', '_')
                name = name.replace('/', '_')
                name = name.replace('\\', '_')
                name = name.replace('.', '_')
                name = name.replace(' ', '_')
                name = name.replace('+', '_plus_')
                mapped = str((pattern, value))
                element_map = '{} = {}'.format(name, mapped)
                results.add(element_map)
    return results


def get_ignore_map(file):
    with open(file, 'r') as f:
        ignore_list = f.readlines()
    for i in range(len(ignore_list)):
        ignore_list[i] = ignore_list[i].replace('\n', '')
    return ignore_list


def get_element_map_of_all_files(html_files, by):
    results = []
    for html_file in html_files:
        element_map = get_element_map_from_file(html_file, by)
        file_full_name = get_file_full_name(html_file)
        file_name, file_type = get_file_name_and_type(file_full_name)
        file_name = file_name
        results.append([
            element_map,
            file_name
        ])
    return results


def set_common_elements_together(results):
    commons = set()
    a = 0
    for result in results:
        a += 1
        element_map = result[0]
        for i in range(a, len(results)):
            element_map2 = results[i][0]
            common = set(element_map).intersection(element_map2)
            commons.update(common)
            result[0], results[i][0] = element_map - element_map2 - commons, element_map2 - element_map - commons
    return commons


def set_elements_to_ignore(ignore_files):
    elements_to_ignore = ''
    if len(ignore_files) > 0:
        elements_to_ignore = get_ignore_map(ignore_files[0])
    return elements_to_ignore


def create_element_map_file(results, html_directory, elements_to_ignore, commons, all_is_common=True):
    element_map_file = html_directory + s + 'element_map.py'
    f = open(element_map_file, 'w')
    f.write('from ASDC_FE_tests.pages.common.element_map import ElementMap\n\n\n')
    f.write('class element_map(ElementMapGlobal):\n')
    for result in results:
        element_map, file_name = result
        if len(element_map) > 0:
            if all_is_common is not True:
                f.write('\n    class {}:\n'.format(file_name))
            for web_element in element_map:
                if str(web_element) not in elements_to_ignore:
                    if all_is_common is not True:
                        f.write('        {}\n'.format(web_element))
                    else:
                        f.write('    {}\n'.format(web_element))
    f.write('\n')
    for web_element in commons:
        if web_element not in elements_to_ignore:
            f.write('    {}\n'.format(web_element))
    f.close()
    return element_map_file


def create_page_file(element_map_file):
    page_file = get_root_directory() + s + 'page.py'
    with open(element_map_file, 'r') as f:
        lines = f.readlines()
    names = []
    for line in lines:
        if ' = ' in line:
            name = line.split(' = ')[0].replace(' ', '')
            names.append(name)
    f = open(page_file, 'w')
    f.write("__author__ = 'root'\n\n")
    f.write("from ASDC_FE_tests.pages.common.page import Page\n")
    f.write("from ASDC_FE_tests.pages.page_model.decorators import page_function_decorator, page_action_decorator\n")
    f.write("from .element_map import element_map\n\n\n")
    f.write("# page model\n")
    f.write("class dummyPage(Page):\n")
    f.write('''    """ this is the dummyPage for ASDC"""\n\n''')
    f.write("    # page initialization\n")
    f.write("    def __init__(self, log, driver):\n")
    f.write("        Page.__init__(self, log, driver)\n\n")
    f.write("    # --------------------------------------------------------\n")
    f.write("    # -                    page actions                      -\n")
    f.write("    # --------------------------------------------------------\n\n")
    for name in names:
        f.write("    @page_function_decorator()\n")
        f.write("    def get_{}_elements(self):\n".format(name))
        f.write("        return self.find_elements(element_map.{})\n\n".format(name))

        f.write("    @page_action_decorator()\n")
        if 'btn' in name:
            f.write("    def click_on_{}(self):\n".format(name))
            f.write("        self.find_elements(element_map.{})\n\n".format(name))

        elif 'input' in name or 'text' in name:
            f.write("    def send_{}(self, {}):\n".format(name, name))
            f.write("        self.send_to_element(element_map.{}, {})\n\n".format(name, name))

        elif 'multilist' in name:
            f.write("    def select_{}(self, {}):\n".format(name, name))
            f.write("        self.common.select_operational_scope(element_map.{}, {})\n\n".format(name, name))

            f.write("    @page_function_decorator()\n")
            f.write("    def get_{}s(self):\n".format(name))
            f.write("        return self.common.get_list_data(element_map.{})\n\n".format(name))

        elif 'list' in name:
            f.write("    def select_{}(self, {}):\n".format(name, name))
            f.write("        self.select_element_from_list(element_map.{}, {})\n\n".format(name, name))

            f.write("    @page_function_decorator()\n")
            f.write("    def get_{}s(self):\n".format(name))
            f.write("        return self.common.get_list_data(element_map.{})\n\n".format(name))
        else:
            f.write("    def send_{}(self, {}):\n".format(name, name))
            f.write("        self.send_to_element(element_map.{}, {})\n\n".format(name, name))

    f.write("    # --------------------------------------------------------\n")
    f.write("    # -                    page functions                    -\n")
    f.write("    # --------------------------------------------------------\n\n")
    f.write("    @page_function_decorator()\n")
    f.write("    def page_config(self, metadata):\n\n")
    for name in names:
        if 'btn' in name:
            f.write("        if metadata.{} is not None:\n".format(name))
            f.write("            self.click_on_{}(metadata.{})\n\n".format(name, name))
        elif 'input' in name or 'text' in name:
            f.write("        if metadata.{} is not None:\n".format(name))
            f.write("            self.send_{}(metadata.{})\n\n".format(name, name))
        elif 'multilist' in name:
            f.write("        if metadata.{} is not None:\n".format(name))
            f.write("            for item in {}\n".format(name))
            f.write("                self.select_{}(metadata.{})\n\n".format(name, name))
        elif 'list' in name:
            f.write("        if metadata.{} is not None:\n".format(name))
            f.write("            self.select_{}(metadata.{})\n\n".format(name, name))
        else:
            f.write("        if metadata.{} is not None:\n".format(name))
            f.write("            self.send_{}(metadata.{})\n\n".format(name, name))
    f.write("    # --------------------------------------------------------\n")
    f.write("    # -                    page data                         -\n")
    f.write("    # --------------------------------------------------------\n\n")
    f.write("    class create_metadata:\n")
    f.write("        def __init__(self):\n")
    for name in names:
        if 'btn' not in name:
            f.write("            self.{} = None\n".format(name))
    f.close()
    return page_file


def create_elemet_maps(by):
    # set root directory of html files
    html_directory = get_root_directory()
    html_files = deep_files_search(root_directory=html_directory, pattern="*.html")
    ignore_files = deep_files_search(root_directory=html_directory, pattern="*ignore_list.py")

    results = get_element_map_of_all_files(html_files, by)

    commons = set_common_elements_together(results)

    elements_to_ignore = set_elements_to_ignore(ignore_files)

    return create_element_map_file(results, html_directory, elements_to_ignore, commons)


if "__main__" == __name__:
    element_map_file = create_elemet_maps(['data-uxf-point', 'data-test-id', 'data-tests-id'])
    create_page_file(element_map_file)