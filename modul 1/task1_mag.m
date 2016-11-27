data = xlsread('data_mag_rad.xls');
mag = data(:,7); 
step = (max(mag) - min(mag)) / 5;
mag_fragments = {[], [], [], [], []}; %array consisting of five empty arrays

for j = 1:5
    for i = 1:length(data)
        if mag(i) >= min(mag) + step * (j-1) && mag(i) <  min(mag) + step * j 
            mag_fragments{j}(end+1) = mag(i); %separating data into five equal fragments
        end
    end
end
mag_fragments{end}(end+1) = max(mag);%adding largest element 

hold on
histogram(mag_fragments{1},20);%graphics
histogram(mag_fragments{2},20);
histogram(mag_fragments{3},20);
histogram(mag_fragments{4},20);
histogram(mag_fragments{5},20);
legend('1 fragment', '2 fragment', '3 fragment', '4 fragment' ,'5 fragment');
