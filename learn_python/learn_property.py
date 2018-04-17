class A:
    z = 0

    @property
    def a(self):
        return self.__class__.z

    @a.setter
    def a(self, n):
        self.__class__.z = n


S = A()
print(S.a)
S.a = 500
print(S.a)
