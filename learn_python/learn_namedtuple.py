import json
from collections import namedtuple


jstr = '{"name":"el","age":20}'
p = json.loads(jstr, object_hook=lambda d:namedtuple('Person', d.keys())(*d.values()))

print(p.name, p.age)

p = p.__class__('ff', 20)
print(p)
