from time import time


retries = 1


def generic_method_executioner(self, method, retries, *args, **kw):
    """this function can only be used on objects with methods and a log object"""
    t = time()
    tries = retries + 1
    for Try in range(tries):
        try:
            results = method(self, *args, **kw)
            break
        except Exception as error:
            caller = self.__class__.__name__ + '.' + method.__name__
            self.log.debug('{} arguments: {}{}'.format(caller, args, kw))
            self.log.debug('exception raised: handler method is to retry')
            self.log.debug('retries left {}'.format(retries - Try))
            if Try == retries:
                self.log.exception(error)
                raise Exception(error)
            else:
                self.log.error(error)
    t = time() - t
    return t, results


def dont_log(*args, **kw):
    """DecoratorConfig self.decorator_log can be configured to use this if no log is required"""
    pass


def log_info(self, method, t, results, *args, **kw):
    """this function can only be used on objects with methods and a log object"""
    msg = '{}: {} {}'.format('[%2.4f sec]' % t, self.__class__.__name__, method.__name__)
    self.log.info(msg)


def log_debug(self, method, t, results, *args, **kw):
    """this function can only be used on objects with methods and a log object"""
    msg = '[module:{}]:[line:{}]:[{} sec]: {} {} arguments {}{} results {}'.format(method.__module__, method.__code__.co_firstlineno, '%2.4f' % t,self.__class__.__name__, method.__name__, args, kw, results)
    self.log.debug(msg)


# def generic_decorator(retries=retries):
#     """this function can only be used on objects with methods and a log object"""
#     def decorator(method):
#         def wrapper(self, *args, **kw):
#             t, results = generic_method_executioner(self, method, retries, *args, **kw)
#             generic_log(self, method, t, *args, **kw)
#             return results
#         return wrapper
#     return decorator


class DecoratorConfig(object):
    """this class is meant to create a configurable decorator for objects methods with a self.log"""

    def __init__(self, retries=retries, decorator_log=log_info):
        self.retries = retries
        self.decorator_log = decorator_log

    def get_params(self, retries=None, decorator_log=None):
        if retries is None:
            retries = self.retries
        if decorator_log is None:
            decorator_log = self.decorator_log
        return retries, decorator_log

    def generic_decorator(self, retries=None, decorator_log=None):
        """
        this function can only be used on objects with methods and a log object
        :param retries: int the number of retries
        :param decorator_log: choose a log formatter function, default is log_info
        :return:
        """
        def decorator(method):
            def wrapper(obj, *args, **kw):
                retries_param, decorator_log_param = self.get_params(retries, decorator_log)
                t, results = generic_method_executioner(obj, method, retries_param, *args, **kw)
                decorator_log_param(obj, method, t, results, *args, **kw)
                return results
            return wrapper
        return decorator


if __name__ == "__main__":
    import logging
    # log setup
    logging.basicConfig(level=logging.DEBUG, format='%(asctime)s:[%(levelname)s]:%(message)s')
    # full format='%(asctime)s:[%(levelname)s]:[File:%(module)s]:[LineNumber:%(lineno)s]:[FunctionName:%(funcName)s]:%(message)s'

    # define a Handler which writes INFO messages or higher to the sys.stderr
    console = logging.StreamHandler()
    console.setLevel(logging.DEBUG)
    # set a format which is simpler for console use
    formatter = logging.Formatter('%(asctime)s:[%(levelname)s]:%(message)s')
    # tell the handler to use this format
    console.setFormatter(formatter)
    # add the handler to the root logger
    logging.getLogger('').addHandler(console)
    log = logging.getLogger()

    decorator_obj = DecoratorConfig(retries=2, decorator_log=log_debug)
    decorator = decorator_obj.generic_decorator

    class Adder:
        def __init__(self):
            self.log = log

        @decorator()
        def add_input(self, number):
            return int(input('enter number:')) + number

    class Corrector:
        def __init__(self):
            self.log = log
            self.adder = Adder()

        @decorator()
        def numbers_adder(self, *numbers):
            n = 0
            for number in numbers:
                n += self.adder.add_input(number)
            return n

        @decorator()
        def numbers_compiler(self, *numbers):
            n = 1
            a = 0
            for number in numbers:
                a += number
                n *= self.numbers_adder(a)
            return n

    corrector = Corrector()
    corrector.numbers_compiler(5,6)

    # import functools
    #
    # class MyDecorator(object):
    #     def __init__(self, argument):
    #         self.arg = argument5
    #
    #     def __call__(self, fn):
    #         @functools.wraps(fn)
    #         def decorated(*args, **kwargs):
    #             print "In my decorator before call, with arg %s" % self.arg
    #             fn(*args, **kwargs)
    #             print "In my decorator after call, with arg %s" % self.arg
    #         return decorated
    #
    # @MyDecorator(3)
    # def some1(a):
    #     print(a)
    #
    # some1(5)
