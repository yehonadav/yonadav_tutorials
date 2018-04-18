# https://www.youtube.com/watch?v=GJdiM-muYqc
# find first recurring string char


def find_first_recurring_char(string):
    count = {}
    for char in string:
        if char in count:
            return char
        count[char] = 1

print(find_first_recurring_char("abcdabcd"))
print(find_first_recurring_char("abcd"))


# https://www.youtube.com/watch?v=bGC2fNALbNU
# Find and print all subsets of a given set! (Given as an array.)


def print_array(array):
    array_to_print = []
    for i in array:
        if i is not None:
            array_to_print.append(i)
    print(*array_to_print)


def all_subsets(given_array):
    subset = list(given_array)
    helper(given_array, subset, 0)


def helper(given_array, subset, i):
    if i == len(given_array):
        print_array(subset)
    else:
        subset[i] = None
        helper(given_array, subset, i+1)
        subset[i] = given_array[i]
        helper(given_array, subset, i+1)

all_subsets((1,2,3,4))


# https://www.youtube.com/watch?v=eaYX0Ee0Kcg
# given an array of tuples representing points in 2D space, how would you find the K closest points to the origin (0, 0)?
# example points = [(-2, 4), (0, -2), (-1, 0), (3, 5), (-2, -3), (3, 2)]
# answear involve the pythagorean theorem



