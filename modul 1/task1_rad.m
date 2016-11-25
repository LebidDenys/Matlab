data = xlsread('data_mag_rad.xls');
rad = data(:,6); 
step = (max(rad) - min(rad)) / 5;
rad_fragmetns = {[], [], [], [], []}; %array consisting of five empty arrays

for j = 1:5 
    for i = 1:length(data)
        if mag(i) >= min(rad) + step * (j-1) && rad(i) <  min(rad) + step * j 
            rad_fragmetns{j}(end+1) = rad(i); %separating data into five equal fragments
        end
    end
end

hold on
for i = 1:5
    hist(rad_fragmetns{i},5); %graphics 
end
legend('gamma');
