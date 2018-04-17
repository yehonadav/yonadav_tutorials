import os
import platform

class System:
    name = os.name
    platform_system = platform.system()
    platform_release = platform.release()
    slash = '/'
    if name == 'nt':
        slash = '\\'

s = System.slash