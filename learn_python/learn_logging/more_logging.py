import logging

# default log formatter
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')


def get_logger(
        log_file=None,
        log_level=logging.DEBUG,
        log_name=__name__,
        log_formatter=formatter,
        mode='a',
        log_to_console=True):

    # create logger
    logger = logging.getLogger(log_name)
    logger.setLevel(log_level)

    if log_to_console is True:
        # create console handler and set level to debug
        ch = logging.StreamHandler()
        ch.setLevel(log_level)
        # add formatter to ch
        ch.setFormatter(log_formatter)
        # add ch to logger
        logger.addHandler(ch)

    if log_file is not None:
        # create file handler and set level to debug
        fh = logging.FileHandler(log_file, mode)
        fh.setLevel(log_level)
        # add formatter to fh
        fh.setFormatter(log_formatter)
        # add ch to logger
        logger.addHandler(fh)

    return logger


log1 = get_logger('log1.txt', log_name='log1')
# 'application' code
log1.debug('debug message')
log1.info('info message')
log1.warning('warn message')
log1.error('error message')
log1.critical('critical message')

log2 = get_logger('log2.txt', log_name='log2', log_level=logging.INFO, log_to_console=False)
# 'application' code
log2.debug('debug message')
log2.info('info message')
log2.warning('warn message')
log2.error('error message')
log2.critical('critical message')