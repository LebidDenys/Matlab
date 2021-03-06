data = [2 2; 4 3]; 
k_min = tan(15); 
k_max = tan(70); 
b_min = -3; 
b_max = 3; 
b_del = b_max - b_min; 
S_min = 0.001; 
S_max = 10^10; 
N = 20000; 
n = 100; 


for y = 1:5 
    b_min = b_min + 0.25; 
    b_max = b_max - 0.25; 
    for j = 1:n 

        for i = 1:N 
            k = k_min +(k_max - k_min)*rand(1); 
            b = b_min +(b_max - b_min)*rand(1); 
            f = k*data(:,1) + b; 
            sqr = sum((data(:,2)-f).^2); 
            if sqr < S_max 
                k_res = k; 
                b_res = b; 
                S_max = sqr; 
            elseif sqr < S_min 
                break 
            end 
        end
        
        n123(j) = i; 
    end 
    n1(y) = sum(n123)/100; 
end  

figure; 
hold on 
plot ([0:0.1:4],k_res*[0:0.1:4]+b_res,'r','linewidth',2) 
plot (data(:,1),data(:,2),'oc') 
legend('aproximated function','dotes for aproximization') 
xlabel('x'); 
ylabel('y');

figure; 
hold on 
x1 = linspace(6,4,5); 
y1 = [n1]; 
plot(x1,y1,'r','linewidth',2) 
plot(x1,y1,'og') 
legend('propotion between number of iterations and delta(b)') 
xlabel('Delta(b)') 
ylabel('Number of iterations') 