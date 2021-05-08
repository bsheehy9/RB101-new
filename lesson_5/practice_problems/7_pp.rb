a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p arr
# => [4, [1, 8]]

# from nested assignment
# the difference is because an array is a reference?

a1 = [1, 3]
b1 = [2]
arr1 = [a1, b1]

arr1[0][1] = 8
p arr1
p a1
