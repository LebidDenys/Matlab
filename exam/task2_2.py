import numpy as np
import numpy.linalg as lin
import math as m
import matplotlib.pyplot as plt


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
