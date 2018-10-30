root = {
    "key1": {
        "nestKey1": "nestValue1",
        "nestList1": [0, 1, 2, 3, 4, 5, {"listNest1": 101}],
        "nestDict1": {"1": 1, "2": 2, "3": 3}
    },
    "key2": {
        "nestKey2": "nestValue2",
        "nestList2": [0, 1, 2, 3, 4, 5, {"listNest2": 102}],
        "nestDict2": {"1": 1, "2": 2, "3": 3}
    },
    "key3": {
        "nestKey3": "nestValue3",
        "nestList3": [0, 1, 2, 3, 4, 5, {"listNest3": 103}],
        "nestDict3": {"1": 1, "2": 2, "3": 3}
    }
}


class JsonFinder:
    def __init__(self, root: dict):
        self.root = root

    def _find_key(self, key, element):
        if isinstance(element, dict):
            for k in element:
                if k == key:
                    return key, element[k]
                else:
                    r = self._find_key(key, element[k])
                    if r is not None:
                        return r
        elif isinstance(element, list):
            for i in element:
                if isinstance(i, dict):
                    r = self._find_key(key, i)
                    if r is not None:
                        return r

    def _find_value(self, value, element):
        if isinstance(element, dict):
            for k in element:
                if element[k] == value:
                    return k, value
                else:
                    r = self._find_value(value, element[k])
                    if r is not None:
                        return r

        elif isinstance(element, list):
            for i in range(len(element)):
                if element[i] == value:
                    return i, value
                else:
                    r = self._find_value(value, element[i])
                    if r is not None:
                        return r

    def find_key(self, key):
        return self._find_key(key, self.root)

    def find_value(self, value):
        return self._find_value(value, self.root)


finder = JsonFinder(root)
print(finder.find_key("key1"))
print(finder.find_key("key2"))
print(finder.find_key("key3"))

print(finder.find_key("nestKey1"))
print(finder.find_key("nestList1"))
print(finder.find_key("nestDict1"))

print(finder.find_key("nestKey2"))
print(finder.find_key("nestList2"))
print(finder.find_key("nestDict2"))

print(finder.find_key("nestKey3"))
print(finder.find_key("nestList3"))
print(finder.find_key("nestDict3"))

print(finder.find_key("listNest1"))
print(finder.find_key("listNest2"))
print(finder.find_key("listNest3"))

print(finder.find_key("1"))
print(finder.find_key("2"))
print(finder.find_key("3"))

print(finder.find_value("nestValue1"))
print(finder.find_value("nestValue2"))
print(finder.find_value("nestValue3"))

print(finder.find_value(0))
print(finder.find_value(101))
print(finder.find_value(103))