x = -2*pi+pi/36:0.0310:2*pi+pi/36;
x1 = linspace(-2*pi,2*pi,5);
y2 = [0,-1,0,1,0]; 
y = [0.02:-0.01:-1,-1:0.01:1,1:-0.01:-0.01];

y1 = y+0.001; %data for aproximization
%boundary values
kmin = tan(25); 
kmax = tan(70); 
bmin = -1; 
bmax = 1; 
rmin = 0; 
rmax = 1; 
vmin = 0; 
vmax = 1; 
Smin = 0.001;%minimal error
Smax = 10^10;%maximum error
N = 20000;%number of iterations

for i=1:N 
    k = kmin+(kmax-kmin)*rand(1);%take random value
    b = bmin+(bmax-bmin)*rand(1); 
    r = rmin+(rmax-rmin)*rand(1); 
    v = vmin+(vmax-vmin)*rand(1);  
    f = v+r*sin(x.*k+b);%function
    sqr = sum((y1-f).^2);%calculating error
    
    if sqr < Smax 
        kres = k; 
        bres = b; 
        rres = r; 
        vres = v; 
        Smax = sqr; 
    elseif sqr<Smin 
        break 
    end 
end 

hold on 
plot(x1,y2,'or') 
plot (x,vres+rres*sin(x.*kres+bres),'b')