data = xlsread('data_mag_rad.xls'); 
rad = data(:,6); 
x = 0:0.1:25;
mu = 14; 
sigma = 3; 

y = normpdf(x,mu,sigma); %normal probability density function
y_increased = y.*400;
obj = gmdistribution.fit(rad,4); %gaussian mixture model
x1 = linspace(0,22,251); %generates 251 points, the spacing between the points is 22/(251-1)

hold on 
hist (rad,13); 
ezplot(@(x)pdf(obj,x)*450,0:22);
plot(x1,y_increased, 'g', 'linewidth', 2); 
legend('gamma', 'gauss mixture', 'normal distributions');