data = xlsread('data_mag_rad.xls');
mag = data(:,7);
rad = data(:,6);

rad_pin_width = ceil(1 + log2(length(rad)));%calculating width for pins using Sturges rule
mag_pin_width = ceil(1 + log2(length(mag)));
rad_sorted = sort(rad);


hold on
histogram(mag, mag_pin_width);
%plot(hist(mag));
%findings of radiometry 
