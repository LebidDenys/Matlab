x = 2:0.1:4;
y = 2:0.05:3;
y_rand = rand(1,length(y));
x_rand= rand(1,length(x));
y2 = y + y_rand;
x2 = x + x_rand;

% least squares method
N = length(x2);
Mx = sum(x2);
Mx2 = sum(x2.^2);
My = sum(y2);
Mxy = sum(x2.*y2);

A = [Mx2 Mx; Mx N];
B = [Mxy; My];
X = A\B;

% coefficients
ax = X(1);
bx = X(2);

% linear fit
x3 = linspace(min(x),max(x),21);
y3 = ax.*x3 + bx;

hold on
plot(x2,y2,'ob');
plot(x3,y3,'-r')
grid on;
legend('dotes', 'approximated function');
