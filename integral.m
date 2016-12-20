number_of_values = 20;
raw_data = xlsread('data_mag_rad.xls');
rad = raw_data(:,6); 
random_position = rand(1)*(length(rad) - number_of_values);
data = rad(random_position : random_position+(number_of_values-1));
integral_value = 0;

for i = 1:number_of_values
    integral_value = integral_value + data(i);
end