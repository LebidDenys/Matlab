number_of_values = 20;
raw_data = xlsread('data_mag_rad.xls');
mag = raw_data(:,7); 
random_position = rand(1)*(length(mag) - number_of_values);
data = mag(random_position : random_position+(number_of_values-1));

first_derivative = 1:(number_of_values);
for i = 2:(number_of_values-1)
    first_derivative(i) = data(i+1) - data(i);
end
first_derivative(1) = mean(first_derivative(2:(number_of_values-1)));
first_derivative(number_of_values) = mean(first_derivative(2:(number_of_values-1)));

second_derivative = 1:(number_of_values);
for i = 2:(number_of_values-1)
    second_derivative(i) = first_derivative(i+1) - first_derivative(i);
end

second_derivative(1) = mean(second_derivative(2:(number_of_values-1)));
second_derivative(number_of_values) = mean(second_derivative(2:(number_of_values-1)));
