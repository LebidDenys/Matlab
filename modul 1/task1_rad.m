data = xlsread('data_mag_rad.xls');
rad = data(:,6); 
step = (max(rad) - min(rad)) / 5;
rad_fragments = {[], [], [], [], []}; %array consisting of five empty arrays

for j = 1:5 
    for i = 1:length(data)
        if rad(i) >= min(rad) + step * (j-1) && rad(i) <  min(rad) + step * j 
            rad_fragments{j}(end+1) = rad(i); %separating data into five equal fragments
        end
    end
end
rad_fragments{end}(end+1) = max(rad);%adding largest element 

hold on
histogram(rad_fragments{1},10);%graphics
histogram(rad_fragments{2},10);
histogram(rad_fragments{3},10);
histogram(rad_fragments{4},10);
histogram(rad_fragments{5},10);
legend('1 fragment', '2 fragment', '3 fragment', '4 fragment' ,'5 fragment');
