data = xlsread('data_mag_rad.xls');
mag = data(:,7);
rad = data(:,6);

mag_norm = (max(mag) - mag)/(max(mag) - min(mag)); %normalizing
rad_norm = (max(rad) - rad)/(max(rad) - min(rad));

mag_average = 1:mag_norm/5; %creating a matrix for average data
rad_average = 1:rad_norm/5;

j = 1;
for i = 5:5:length(mag_norm) %calculating average magnitographic values
    local = mag_norm(i-4:i);
    mag_average(j) = mean(local);
    j = j + 1;
end

j = 1;
for i = 5:5:length(rad_norm) %calculating the average gamma
    local = rad_norm(i-4:i);
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