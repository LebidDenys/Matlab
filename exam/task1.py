import numpy as np

matrix_of_ten = []
matrix_of_five = []

for i in range(10):
    matrix_of_ten.append(np.random.randint(1,10,(10,1)))

for i in range(0,9,2):
    matrix_of_five.append(np.hstack((matrix_of_ten[i], matrix_of_ten[i+1])))

finall_matrix = np.array(matrix_of_five[0])
for i in range(1,5):
    finall_matrix = np.hstack((finall_matrix, matrix_of_five[i]))
