data = xlsread('data_mag_rad.xls');
rad = data(:,6); 
step = (max(rad) - min(rad)) / 5;
rad_clipped = {[], [], [], [], []}; %array consisting five empty arrays

for j = 1:5 
    for i = 1:length(data)
        if mag(i) >= min(rad) + step * (j-1) && rad(i) <  min(rad) + step * j 
            rad_clipped{j}(end+1) = rad(i); %clipping data on five equal fragments
        end
    end
end

hold on
for i = 1:5
    hist(rad_clipped{i},5); %graphics 
end
legend('gamma');
