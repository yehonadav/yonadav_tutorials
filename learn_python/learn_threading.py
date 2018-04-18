"""
https://www.youtube.com/watch?v=NwH0HvMI4EA
https://stackoverflow.com/questions/6893968/how-to-get-the-return-value-from-a-thread-in-python?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
https://github.com/yehonadav/threaders
"""

from threaders import threaders
from random import randrange
import time
import threading


# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


delays = [randrange(1, 3) for i in range(50)]
print_lock = threading.Lock()


def wait_delay(i, d):
    with print_lock:
        print('{} sleeping for ({})sec'.format(i, d))
    time.sleep(d)

pool = threaders.ThreadPool(10)

for i, d in enumerate(delays):
    pool.put(wait_delay, i, d)

pool.join()


# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


@threaders.threader()
def function_to_be_threaded(x):
    """ :rtype: threaders.Thread """
    t = time.time()
    time.sleep(0.5*(x+0.1)/5+0.05)
    return time.time()-t


# create threads
threads = []
for i in range(10):
    threads.append(function_to_be_threaded(i))

# get first result
print(threaders.get_first_result(threads))

# kill threads
t = time.time()
for thread in threads:
    thread.join()
print("all threads terminated: {}".format(time.time() - t))