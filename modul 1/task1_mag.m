data = xlsread('data_mag_rad.xls');
mag = data(:,7); 
step = (max(mag) - min(mag)) / 5;
mag_fragments = {[], [], [], [], []}; %array consisting of five empty arrays

for j = 1:5
    for  i = 1:length(data)
        if mag(i) >= min(mag) + step * (j-1) && mag(i) <  min(mag) + step * j 
            mag_fragments{j}(end+1) = mag(i); %separating data into five equal fragments
        end
    end
end

hold on
for i = 1:5
    hist(mag_fragments{i},5); %graphics 
end
legend('magnetometry');
