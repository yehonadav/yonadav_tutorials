import try1


try1.mod1.A.run()
try1.pkg1.mod1.A.run()


# import utils
# from os.path import dirname
#
#
# import glob
#
#
# for filename in glob.iglob(dirname(__file__)+'/**', recursive=True):
#     if filename.endswith("__init__.py"):
#         utils.update_imports(filename.replace("__init__.py", ""))
#
# from try2.pkg2.mod3 import C
# from try1 import mod1
# mod1.A.run()
# C.run()
#


# import try1
#
# for module in try1.__all__:
#     import module

