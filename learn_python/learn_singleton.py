class Singleton(type):
    _instance = {}
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instance:
            cls._instance[cls] = super(Singleton, cls).__call__(*args, **kwargs)
        return cls._instance[cls]

class A: pass

class B(A, metaclass=Singleton): pass

a1 = B()
a2 = B()
print(a1)
print(a2)