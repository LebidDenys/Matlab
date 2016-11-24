data = xlsread('data_mag_rad.xls');
mag = data(:,7);

mag_clipped = []; %clip data from magnetometry
for i=1:length(mag)
    if (mag(i)>min(mag)  && mag(i)<max(mag))
        mag_clipped(end+1) = mag(i);
    end
end

%clip data on 5 equal fragments
step_mag = (max(mag) - min(mag))/5;
mag_1 = clipping_function(mag_clipped, min(mag), step_mag, 5);
mag_2 = clipping_function(mag_clipped, min(mag), step_mag, 2);
mag_3 = clipping_function(mag_clipped, min(mag), step_mag, 3);
mag_4 = clipping_function(mag_clipped, min(mag), step_mag, 4);
mag_5 = clipping_function(mag_clipped, min(mag), step_mag, 5);

hold on %graphics
hist(mag_1,5);
hist(mag_2,5);
hist(mag_3,5);
hist(mag_4,5);
hist(mag_5,5);
legend('magnetometry');
