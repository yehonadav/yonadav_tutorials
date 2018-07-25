# from os.path import dirname, basename
# import glob
#
#
# def load_modules(__file__):
#     return [basename(f) for f in glob.glob(dirname(__file__)+"/*") if not basename(f).startswith('__')]
#



# import pkgutil
# import sys
#
#
# def load_all_modules_from_dir(dirname):
#     for importer, package_name, _ in pkgutil.iter_modules([dirname]):
#         full_package_name = '%s.%s' % (dirname, package_name)
#         if full_package_name not in sys.modules:
#             module = importer.find_module(package_name
#                         ).load_module(full_package_name)
#             print(module)

"""
carefull!
all __init__.py files
content will be overwritten
run this everytime you want to update your imports.


# usage example:

from os.path import dirname
update_imports_recursively(dirname(__file__))
"""


import os
import glob


def update_imports(path):
    files = os.listdir(path)
    imports = []

    for i in range(len(files)):
        name = files[i].split('.')
        if len(name) > 1:
            if name[1] == 'py' and name[0] != '__init__':
                name = name[0]
                imports.append(name)

    file = open(path+'__init__.py', 'w')
    write = '__all__ = '+str(imports)
    file.write(write)
    file.close()


def update_imports_recursively(root_directory):
    for filename in glob.iglob(root_directory+'/**', recursive=True):
        if filename.endswith("__init__.py"):
            update_imports(filename.replace("__init__.py", ""))





