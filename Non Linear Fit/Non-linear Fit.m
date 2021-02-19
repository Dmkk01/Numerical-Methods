clearvars
close all
clc

% Our data and values
F = [24.6 29.3 31.5 33.3 34.8 35.7 36.6 37.5 38.8 39.6 40.4];
L = [12.58 12.82 12.91 12.95 13.05 13.21 13.35 13.49 14.08 14.21 14.48];
A_0 = 1.25*10^(-4);
L_0 = 0.0125;

% Calculating x and y
x = (1/(A_0*L_0))*F.*L;
y = log(L./L_0);

% Calculating the coefficients
nx = length(x);
sum_x = sum(log(x));
sum_x2 = sum(log(x).*(log(x)));
sum_y = sum(log(y));
sum_xy = sum(log(x).*(log(y)));

a_0 = (sum_x2*sum_y - sum_xy*sum_x)/(nx*sum_x2 - (sum_x)^2);
a_1 = (nx*sum_xy - sum_x*sum_y)/(nx*sum_x2 - (sum_x)^2);

% Defining our values and functions
K = exp(a_0)
m = a_1
log_y = m.*log(x) + log(K);

% Plotting
figure(1)
plot(x,y, 'b')
hold on
plot(x,exp(log_y), 'r*');
ylim([6.5 7.5]);
xlabel('x');
ylabel('y');
title('Uniaxial tension test');




