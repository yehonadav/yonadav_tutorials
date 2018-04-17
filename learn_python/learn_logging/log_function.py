import logging

def create_logger(log_file):
    # log setup
    logging.basicConfig(filename=log_file, level=logging.INFO, format='%(asctime)s:[%(levelname)s]:%(message)s')
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
    return logging.getLogger()


if "__main__" == __name__:
    import os
    log_file = os.path.dirname(os.path.abspath(__file__)) + '\\log.txt'
    log = create_logger(log_file)

    log.info('hi')
    try:
        a = 1/0
    except Exception as e:
        log.exception(e)
        # raise Exception(e)
