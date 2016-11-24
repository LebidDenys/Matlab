data = xlsread('data_mag_rad.xls'); 
rad = data(:,6);

rad_clipped = [];
for i=1:length(rad) %clipping data from radiometry
    if (rad(i)>min(rad)  && rad(i)<max(rad))
        rad_clipped(end+1) = rad(i);
    end
end

%clipping data on 5 equal fragments
step_rad = (max(rad) - min(rad))/5;
rad_1 = clipping_function(rad_clipped, min(rad), step_rad, 1);
rad_2 = clipping_function(rad_clipped, min(rad), step_rad, 2);
rad_3 = clipping_function(rad_clipped, min(rad), step_rad, 3);
rad_4 = clipping_function(rad_clipped, min(rad), step_rad, 4);
rad_5 = clipping_function(rad_clipped, min(rad), step_rad, 5);

hold on %graphics
hist(rad_1,5); 
hist(rad_2,5);
hist(rad_3,5);
hist(rad_4,5);
hist(rad_5,5);
legend('gamma');