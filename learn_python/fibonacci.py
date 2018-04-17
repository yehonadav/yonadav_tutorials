def F():
    a,b = 0,1
    while True:
        yield a
        a, b = b, a + b


def SubFib(startNumber, endNumber):
    for cur in F():
        if cur > endNumber: return
        if cur >= startNumber:
            yield cur

for i in SubFib(10, 200):
    print(i)
