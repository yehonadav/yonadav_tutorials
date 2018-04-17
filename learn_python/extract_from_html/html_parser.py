import os
import pathlib
from fnmatch import fnmatch
import ntpath
from operating_system import s
import logging

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


def create_button_name(value):
    invalid_name_characters = "!- =+@#$%^&*()/\\?<>.,[]{}|`~'\""
    for c in invalid_name_characters:
        if c in value:
            value = value.replace(c, '_')
    return value


def find_element_functions(element_type):
    element_functions = []
    for function in element_function_map:
        if element_type in element_function_map[function]:
            element_functions.append(function)
    return element_functions


def parse_html_body(patterns):
    # set root directory of html files
    html_directory = get_root_directory()
    html_files = deep_files_search(root_directory=html_directory, pattern="*.html")

    buttons = []
    for file in html_files:
        with open(file, 'r') as f:
            string = f.read()
        string = '<body' + string.split('<body')[-1]
        string = string.split('</body>')[0] + '</body>'
        elements = string.split('<')

        for element in elements:
            for pattern in patterns:
                if pattern in element:
                    element_type = element.split(' ')[0]
                    lines = element.split(pattern + '="')
                    if len(lines) > 1:
                        for i in range(1, len(lines)):
                            value = lines[i].split('"')[0]
                            name = create_button_name(value)
                            element_functions = find_element_functions(element_type)
                            buttons.append((element_type, element_functions, pattern, value, name))
    return buttons


element_function_map = dict(
    find_elements = ('label',),
    click_on_element = ('a', 'div', 'span'),
    send_to_element = ('input', 'textarea'),
    select_from_list = ('li',),
)


if "__main__" == __name__:
    r = parse_html_body(['data-tests-id'])
    for button in r:
        print(button)
