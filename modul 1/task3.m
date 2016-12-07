data = xlsread('data_mag_rad.xls');
mag = data(:,7);
rad = data(:,6);
window_size = 5;
window_radius = (window_size - 1)/2;

mag_norm = (max(mag) - mag)/(max(mag) - min(mag)); %normalizing
rad_norm = (max(rad) - rad)/(max(rad) - min(rad));

mag_average = 1:(length(mag_norm) - 2*window_radius); %creating a matrix for average data
rad_average = 1:(length(rad_norm) - 2*window_radius);

j = 1;
for i = (window_radius + 1):(length(mag_norm) - window_radius) %calculating average magnitographic values
    local = mag_norm(i - window_radius:i + window_radius);
    mag_average(j) = mean(local);
    j = j + 1;
end

j = 1;
for i = (window_radius + 1):(length(rad_norm) - window_radius) %calculating the average gamma
    local = rad_norm(i - window_radius:i + window_radius);
    rad_average(j) = mean(local);
    j = j + 1;
end

flipted_mag = fliplr(mag_average); %reversing the array of average magnitographic values
correlation = 1:length(flipted_mag); %creating matrix for correlated data
for i = 1:length(correlation) %calculating the correlation
    local = rad_average(i)*flipted_mag(i); 
    correlation(i) = mean(local); 
end 

hold on; %graphics
plot(mag_average,'b'); 
plot(rad_average,'r');
plot(correlation, 'g');
legend('magnetometry','gamma','correlation');