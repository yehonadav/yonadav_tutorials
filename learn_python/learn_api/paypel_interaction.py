__author__ = 'root'

import sys, inspect
from requests import request

headers = {"Accept": "application/json","Content-Type": "application/json","USER_ID": "cs0008"}
upload_headers = {"Accept": "application/json","USER_ID": "cs0008"}


def funcname():
    return inspect.stack()[1][3]


def string_list(l):
    """make a valid string to send out of a list(json content)"""
    s = '['
    for i in l:
        s += '\r\n\t'
        if isinstance(i, str):
            s += '\"' + i + '\"'
        elif isinstance(i, list):
            s += string_list(i)
        elif isinstance(i, dict):
            s += string_json(i)
        else:
            s += str(i)
        s += ','
    return s[:-1] + '\r\n]'


def string_json(dictionary):
    """make a valid string to send out of a dictionary(json content)"""
    s = '{'
    for k, v in dictionary.items():
        s += '\r\n\t\"' + k + '\":'
        if isinstance(v, str):
            s += '\"' + v + '\"'
        elif isinstance(v, list):
            s += string_list(v)
        elif isinstance(v, dict):
            s += string_json(v)
        else:
            s += str(v)
        s += ','
    return s[:-1] + '\r\n}'

class Request1(object):
    """this is a request method"""
    def __call__(self, method, url, payload=None, headers=headers, *args, **kw):
        # string from dictionary
        if payload is None:
            pass
        else:
            payload = string_json(payload)

        r = request(method, url, data=payload, headers=headers)
        print(funcname())
        print('method: ' + method)
        print('url: ' + url)
        print('headers: ' + str(headers))
        print('data: ' + str(payload))
        if r.status_code == 200:
            print('PASS: response ' + str(r.status_code))
        else:
            print('FAIL: response ' + str(r.status_code))
            print(r.text)
            sys.exit(1)
        return r


class Request2(object):
    """this is a request method for file upload"""
    def __call__(self, method, url, files=None, headers=upload_headers, *args, **kw):
        r = request(method, url, files=files, headers=headers)
        print(funcname())
        print('method: ' + method)
        print('url: ' + url)
        print('headers: ' + str(headers))
        print('data: ' + str(files))
        if r.status_code == 200:
            print('PASS: response ' + str(r.status_code))
        else:
            print('FAIL: response ' + str(r.status_code))
            print(r.text)
            sys.exit(1)
        return r
