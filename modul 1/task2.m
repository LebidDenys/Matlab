y_values = [1,1.8,0,-0.5,0,0.5,1];%initial data
x_values = (0: pi/300: 2*pi);
x_actual = (0: pi/3: 2*pi);

y_matrix = zeros(2, 1);%creating empty matrix
x_matrix = zeros(2, 2);

for i = 1:length(y_values)%calculating y matrix
    y_matrix(1) = y_matrix(1) + y_values(i)*sin(x_values(i));
    y_matrix(2) = y_matrix(2) + y_values(i)*cos(x_values(i));
end
    
for i = 1:length(x_values)%calculating x matrix
    x_matrix(1) = x_matrix(1) + sin(x_values(i))^2;
    x_matrix(2) = x_matrix(2) + sin(x_values(i))*cos(x_values(i));
    x_matrix(4) = x_matrix(4) + cos(x_values(i))^2;
end

x_matrix(3) = x_matrix(2); 
coefficients_matrix =x_matrix\y_matrix;%calculating coefficients
result = sin(coefficients_matrix(1)*sin(x_values + coefficients_matrix(2))) * 10^4;

hold on;%graphics
plot(x_actual, y_values, '*');
plot(x_values, result, 'g', 'linewidth', 1);
grid on; 