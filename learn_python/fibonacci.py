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

# for i in SubFib(10, 200):
#     print(i)


def fib(x):
    if x < 2:
        return [i for i in range(x+1 )]
    ans = fib(x-1)
    return ans + [ans[-1] + ans[-2]]


print(fib(10))
