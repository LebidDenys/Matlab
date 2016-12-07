x = -2*pi+pi/36:0.0310:2*pi+pi/36;
x1 = linspace(-2*pi,2*pi,5);
y2 = [0,-1,0,1,0]; 
y = [0.02:-0.01:-1,-1:0.01:1,1:-0.01:-0.01];

y1 = y + 0.001; %data for aproximization
%boundary values
k_min = tan(25); 
k_max = tan(70); 
b_min = -1; 
b_max = 1; 
r_min = 0; 
r_max = 1; 
v_min = 0; 
v_max = 1; 
S_min = 0.001;%minimal error
S_max = 10^10;%maximum error
N = 20000;%number of iterations

for i=1:N 
    k = k_min+(k_max-k_min)*rand(1);%take random value
    b = b_min+(b_max-b_min)*rand(1); 
    r = r_min+(r_max-r_min)*rand(1); 
    v = v_min+(v_max-v_min)*rand(1);  
    f = v+r*sin(x.*k+b);%function
    sqr = sum((y1-f).^2);%calculating error
    
    if sqr < S_max 
        k_res = k; 
        b_res = b; 
        r_res = r; 
        v_res = v; 
        S_max = sqr; 
    elseif sqr<S_min 
        break 
    end 
end 

hold on 
plot(x1,y2,'or') 
plot (x,v_res + r_res*sin(x.*k_res + b_res),'b')