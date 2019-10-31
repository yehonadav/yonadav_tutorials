# async with httpx.AsyncClient() as client:
# >>>     async with client.parallel() as parallel:
# >>>         pending_one = parallel.get('https://example.com/1')
# >>>         pending_two = parallel.get('https://example.com/2')
# >>>         response_one = await pending_one.get_response()
# >>>         response_two = await pending_two.get_response()
#
# httpx suck!


# from time import time
# from grequests import get, map
#
# urls = [
#     'http://www.heroku.com',
#     'http://tablib.org',
#     'http://httpbin.org',
#     'http://python-requests.org',
#     'http://kennethreitz.com',
#     'https://google.com',
# ]
#
#
# def test_async_requests(urls):
#     t = time()
#     rs = map(get(u) for u in urls)
#     t = time() - t
#     print(f'processed {len(rs)} requests in {round(t, 3)}s')
#
#
# test_async_requests([urls[0]])
# test_async_requests(urls)
# test_async_requests(urls*2)
# test_async_requests(urls*3)
# test_async_requests(urls*4)
# test_async_requests(urls*5)
# test_async_requests(urls*6)
# test_async_requests(urls*7)
# test_async_requests(urls*8)
# test_async_requests(urls*9)
# test_async_requests(urls*10)
#
# grequests suck!


# from aiohttp import ClientSession, ClientResponse
# import asyncio
# from typing import List
#
#
# rs: List[ClientResponse] = []
#
#
# async def fetch(session: ClientSession, url: str):
#     async with session.get(url) as response:
#         rs.append(await response)
#
#
# async def main():
#     async with ClientSession() as session:
#         await fetch(session, 'http://python.org')
#
#
# if __name__ == '__main__':
#     loop = asyncio.get_event_loop()
#     loop.run_until_complete(main())
#     for r in rs:
#         print(r.status)
#
# aiohttp suck

from asyncio import get_event_loop
from typing import List, Callable


class Manager:
    def __init__(self):
        self.loop = get_event_loop()

    async def async_run(self, tasks: List[Callable]):
        progress = [self.loop.run_in_executor(None, task) for task in tasks]
        for task in progress:
            await task

    def run(self, tasks: List[Callable]):
        self.loop.run_until_complete(self.async_run(tasks))


if __name__ == "__main__":
    from requests import get
    from time import time

    errors = {}
    rs = []

    def task():
        try:
            r = get("https://google.com")
            r.raise_for_status()
            rs.append(r)
        except Exception as e:
            name = f'{e.__traceback__}{e}'
            if name in errors:
                errors[name] += 1
            else:
                errors[name] = 1

    tasks = [task for _ in range(20)]
    manager = Manager()

    t = time()
    manager.run(tasks)
    t = time() - t
    print(f'took {round(t, 3)}s')
    for e, n in errors.items():
        print(f'{e} this error occurred {n} times')
# TODO: this is good! ill make a package
