"""
https://www.youtube.com/watch?v=NwH0HvMI4EA
https://stackoverflow.com/questions/6893968/how-to-get-the-return-value-from-a-thread-in-python?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
"""


import threading
from queue import Queue
import time


print_lock = threading.Lock()
queue = Queue()
wait = 1


# def job(worker_id):
#     time.sleep(0.5)
#     with print_lock:
#         print(threading.current_thread().name, worker_id)
#
#
# def worker():
#     while True:
#         worker_id = queue.get()
#         job(worker_id)
#         queue.task_done()
#
#
# for _ in range(10):
#     thread = threading.Thread(target=worker)
#     thread.daemon = True
#     thread.start()
#
#
# start = time.time()
# for worker_id in range(20):
#     queue.put(worker_id)
#
#
# queue.join()
# print('Entire job took:', time.time()-start)


# def job(job_id, wait):
#     time.sleep(wait)
#     with print_lock:
#         print(threading.current_thread().name, 'job-{}'.format(job_id), 'took {} sec'.format(wait))
#     return job_id
#
#
# class Thread:
#     def __init__(self):
#         self.results = []
#
#     def __call__(self, wait):
#         while True:
#             job_id = queue.get()
#             self.results.append(job(job_id, wait))
#             queue.task_done()
#
#
# threads = []
# for w in range(10):
#     thread = threading.Thread(target=Thread(), args=(wait*w/5+0.05,))
#     thread.daemon = True
#     thread.start()
#     threads.append(thread)
#
# start = time.time()
# for worker_id in range(20):
#     queue.put(worker_id)
#
# stop = False
# while True:
#     for thread in threads:
#         if len(thread.results) > 0:
#             if thread.results[0] is not None:
#                 print(thread.name)
#                 stop = True
#                 break
#     if stop is True:
#         break
#
# queue.join()
# print('Entire job took:', time.time() - start)


class Thread(threading.Thread):
    def __init__(self, group=None, target=None, name=None, args=(), kwargs=None, *, daemon=None):
        self.queue = Queue()
        threading.Thread.__init__(self, group, target, name, (self.queue,) + args, kwargs, daemon=daemon)


def thread_decorator(f, daemon=True):
    """
    decorator to thread functions
    :param f: function to be threaded
    :param daemon: thread behavior
    :rtype: wrap
    """

    def wrapped_f(queue, *args, **kwargs):
        """
        this function calls the decorated function and puts the
        result in a queue
        :type queue: Queue
        """
        ret = f(*args, **kwargs)
        queue.put(ret)

    def wrap(*args, **kwargs):
        """
        this is the function returned from the decorator. It fires off
        wrapped_f in a new thread and returns the thread object with
        the result queue attached
        :rtype: Thread"""
        t = Thread(target=wrapped_f, args=args, kwargs=kwargs)
        t.daemon = daemon
        t.start()
        return t

    return wrap


@thread_decorator
def long_task(x):
    """
    :rtype: Thread
    """
    t = time.time()
    time.sleep(wait*(x+0.1)/5+0.05)
    return time.time()-t


# does not block, returns Thread object
threads = []
for i in range(10):
    threads.append(long_task(i))


# this blocks, waiting for the result
def get_first_result(threads):
    """
    get the first result that returns from a thread
    :type threads: list[Thread]
    """
    while True:
        for thread in threads:
            if not thread.is_alive():
                return thread.queue.get()

print(get_first_result(threads))

t = time.time()
for thread in threads:
    thread.join()
print("all threads terminated: {}".format(time.time()-t))
