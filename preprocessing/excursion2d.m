% [x, y] = ndgrid(-1:0.01:1,-1:0.01:1);

d_1 = 1;
d_2 = 1;
u = 10;

l11 = 1;
l12 = 0;
l22 = 1;

% z = u + d_1*x + d_2*y + (1/2)*u*(x^2*l11 + 2*x*y*l12 + y^2*l22);
n = length(-1:0.01:1);
z = zeros(n);
x = -1:0.01:1;
y = -1:0.01:1;
for I = 1:n
    for J = 1:n
        z(I,J) = u + d_1*x(I) + d_2*y(J) + (1/2)*u*(x(I)^2*l11 + 2*x(I)*y(J)*l12 + y(J)^2*l22);
    end
end


surf(z);