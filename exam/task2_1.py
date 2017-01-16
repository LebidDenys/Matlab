import numpy as np
import numpy.linalg as lin
import math as m
import matplotlib.pyplot as plt


x_values_1 = [1,2,3,4]
x_values_2 = [6,7,8,9]
y_values_1 = [1.2,4,7,16]
y_values_2 = [15.8,8.4,4.5,2]

y_matrix_1 = np.zeros((2, 1))
x_matrix_1 = np.zeros((2, 2))
y_matrix_2 = np.zeros((2, 1))
x_matrix_2 = np.zeros((2, 2))


for i in range(len(y_values_1)):
    y_matrix_1[0,0] += y_values_1[i] * x_values_1[i]
    y_matrix_1[1,0] += y_values_1[i]
    y_matrix_2[0,0] += y_values_2[i] * x_values_2[i]
    y_matrix_2[1,0] += y_values_2[i]
    
for i in range(len(x_values_1)):
    x_matrix_1[0,0] += x_values_1[i]**2
    x_matrix_1[0,1] += x_values_1[i]
    x_matrix_2[0,0] += x_values_2[i]**2
    x_matrix_2[0,1] += x_values_2[i]
x_matrix_1[1,1] = len(x_values_1)
x_matrix_1[1,0] = x_matrix_1[0,1]
x_matrix_2[1,1] = len(x_values_2)
x_matrix_2[1,0] = x_matrix_2[0,1]


coefficients_matrix_1 = np.dot(lin.inv(x_matrix_1), y_matrix_1)
coefficients_matrix_2 = np.dot(lin.inv(x_matrix_2), y_matrix_2)

x_extended_1 = [1,2,3,4,5]
x_extended_2 = [5,6,7,8,9]

y_calculated_1 = map(lambda x: float(coefficients_matrix_1[0])*x + float(coefficients_matrix_1[1]),x_extended_1)
y_calculated_2 = map(lambda x: float(coefficients_matrix_2[0])*x + float(coefficients_matrix_2[1]),x_extended_2)

yy_1 = map(lambda x: float(coefficients_matrix_1[0])*x + float(coefficients_matrix_1[1]),x_values_1)
yy_2 = map(lambda x: float(coefficients_matrix_2[0])*x + float(coefficients_matrix_2[1]),x_values_2)

deviation = sum(map(lambda x,y:(x-y)**2, yy_1, y_values_1)) + sum(map(lambda x,y:(x-y)**2, yy_1, y_values_2))
 

plt.plot(x_extended_1,y_calculated_1,'r')
plt.scatter(x_values_1, y_values_1)
plt.plot(x_extended_2,y_calculated_2,'r')
plt.scatter(x_values_2, y_values_2)
#plt.show()
y_values = [1.2,4,7,16,15.8,8.4,4.5,2]
x_values = [1,2,3,4,6,7,8,9]
y_matrix = np.zeros((3, 1))
x_matrix = np.zeros((3, 3))

for i in range(len(y_values)):
    y_matrix[0,0] += y_values[i]
    y_matrix[1,0] += y_values[i] * x_values[i]
    y_matrix[2,0] += y_values[i] * (x_values[i]**2)
    
for i in range(len(x_values)):
    x_matrix[0,0] += x_values[i]**2
    x_matrix[0,1] += x_values[i]
    x_matrix[1,0] += x_values[i]**3
    x_matrix[2,0] += x_values[i]**4
x_matrix[1,1] = x_matrix[2,2] = x_matrix[0,0]
x_matrix[1,2] = x_matrix[0,1]
x_matrix[2,1] = x_matrix[1,0]
x_matrix[0,2] = len(x_values)

coefficients_matrix = np.dot(lin.inv(x_matrix), y_matrix)

y_calculated = map(lambda x: coefficients_matrix[0]*(x**2) + coefficients_matrix[1]*x + coefficients_matrix[2],x_values)
deviation = float(sum(map(lambda x,y:(x-y)**2, y_calculated, y_values)))

plt.plot(x_values,y_calculated,'r')
plt.scatter(x_values, y_values)
plt.show()
