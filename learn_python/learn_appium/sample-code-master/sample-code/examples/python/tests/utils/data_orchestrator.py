

def organize(data_lists):
    """
        data_lists = [(1,),(1,2,3),(1,2),(1,2,3,4)]
        will return:

        [[1, 1, 1, 1],[1, 1, 1, 2],[1, 1, 1, 3],[1, 1, 1, 4],[1, 1, 2, 1],[1, 1, 2, 2],
         [1, 1, 2, 3],[1, 1, 2, 4],[1, 1, 3, 1],[1, 1, 3, 2],[1, 1, 3, 3],[1, 1, 3, 4],
         [1, 2, 1, 1],[1, 2, 1, 2],[1, 2, 1, 3],[1, 2, 1, 4],[1, 2, 2, 1],[1, 2, 2, 2],
         [1, 2, 2, 3],[1, 2, 2, 4],[1, 2, 3, 1],[1, 2, 3, 2],[1, 2, 3, 3],[1, 2, 3, 4]]

    :type data_lists: []
    :rtype: []
    """
    try:
        data_lists.sort(key=len)

        all_possibilities = 1
        for i in range(len(data_lists)):
            all_possibilities *= len(data_lists[i])

        data = [[] for _ in range(all_possibilities)]

        looper = all_possibilities
        for data_list in data_lists:
            looper /= len(data_list)
            d = 0
            while d < all_possibilities:
                for i in data_list:
                    for _ in range(int(looper)):
                        data[d].append(i)
                        d += 1
        return data
    except ZeroDivisionError as e:
        raise ZeroDivisionError("empty lists are not allowed") from e


# data_lists = []
# organize(data_lists)
#
# data_lists = [(123, '5555'),(1,2,3,0,0),(1,2),(1,2,3,4)]
# organize(data_lists)
#
#
# data_lists = [(),(1,2,3),(1,2),(1,2,3,4)]
# organize(data_lists)
#


class TestWebData:
    drivers = ["chrome", "firefox", "ie"]
    operating_systems = ["windows", "mac", "linux"]


class TestMobileData:
    drivers = ["autoUI", "iosdriver"]
    operating_systems = ["android", "ios"]


class TestIoTData:
    devices = ['1.1.1.1', '1.1.1.2']

l = organize([TestWebData.drivers, TestWebData.operating_systems])
print(l)