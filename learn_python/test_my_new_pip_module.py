"""
https://marthall.github.io/blog/how-to-package-a-python-app/
http://peterdowns.com/posts/first-time-with-pypi.html
https://github.com/pypa/setuptools/issues/941
"""

from variable_generator.name_generator import generate_valid_variable_name

a = generate_valid_variable_name("pip install -U variable_generator")

print(a, "it worked!")


from threaders import threaders
import time


@threaders.threader()
def function_to_be_threaded(x):
    """ :rtype: threaders.Thread """
    t = time.time()
    time.sleep(0.5*(x+0.1)/5+0.05)
    return time.time()-t


def main():
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
    print("all threads terminated: {}".format(time.time()-t))


if __name__ == "__main__":
    main()
