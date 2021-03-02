% Numerical Methods in Engineering Week 6
% Dominik Lasinski 791351

close all
clear 
clc

% Function to integrate
y = @(x) (sin(x))^2 - tan(x);

% Variables
k = 0;
I2h = 0;
diff = 1;
conv = 1e-3;

while abs(diff) > conv % The function applies trapezoidal rule until it meets the accuracy requirement
    k = k + 1;
    Ih = trapezoid(y, 0, pi/4, I2h, k);
    diff = Ih - I2h;
    I2h = Ih;
end

disp(diff) % -5.1160e-04
disp(Ih) % -0.2038
disp(k) % 3 = 2^3-1 = 4 panels


    
function Ih = trapezoid(func,a,b,I2h,k)
% func = the function io integrate
% a,b = limits
% I2h = previous result
% Ih = current result
% k => 2^k-1 = number of panels

    if k == 1 % If it is the first panel
        fa = feval(func,a); fb = feval(func,b);
        Ih = (fa + fb)*(b - a)/2.0;
    else
        n = 2^(k -2 ); % Number of new points
        h = (b - a)/n ; % Spacing of new points
        x = a + h/2.0; % Coord. of 1st new point
        sum = 0.0;
        for i = 1:n
            fx = feval(func,x);
            sum = sum + fx;
            x = x + h;
        end
    Ih = (I2h + h*sum)/2.0;
    end
end