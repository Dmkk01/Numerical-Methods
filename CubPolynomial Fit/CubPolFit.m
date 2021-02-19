% Numerical Methods in Engineering Week 4
% Dominik Lasinski 791351
clearvars
close all
clc

% Data points
x = [0 0.4 0.8 1.2 1.6 2.0 2.4 2.8 3.2 3.6 4.0 4.4 4.8 5.2 5.6 6.0];
y = [0 3.0 4.5 5.8 5.9 5.8 6.2 7.4 9.6 15.6 20.7 26.7 31.1 35.6 39.3 41.5];
[a, Er] = CubPolFit(x, y)

% Defining the functions
dx = 0.1;
fun_x = (0:dx:6);
fun_y = a(4)*fun_x.^3 + a(3)*fun_x.^2 + a(2)*fun_x + a(1);


% Plotting
figure(1)
scatter(x, y, 'b*');
hold on
plot(fun_x, fun_y, 'g');
title('CubPolFit');
legend('Data points', 'Fit function','Location','northwest');
xlabel('x');
ylabel('y');
text(0.15,37.5, sprintf('The total error is %.2f', Er));



function [a, Er] = CubPolFit(x, y)
    % Size of the data samples
    nx = length(x);
    ny = length(y);
    if nx ~= ny % Checking if the vectors are of the same length
        disp('ERROR: The number of elements in x must be the same as in y.')
        a = None;
        Er = None;
    else
        % Creating all the necessary sums to calculate coefficients
        sum_x = sum(x);
        sum_x2 = sum(x.^2);
        sum_x3 = sum(x.^3);
        sum_x4 = sum(x.^4);
        sum_x5 = sum(x.^5);
        sum_x6 = sum(x.^6);
        sum_y = sum(y);
        sum_xy = sum(x.*y);
        sum_x2y = sum(x.^2.*y);
        sum_x3y = sum(x.^3.*y);
        
        % Creating the matrices
        A = [nx sum_x sum_x2 sum_x3; sum_x sum_x2 sum_x3 sum_x4; sum_x2 sum_x3 sum_x4 sum_x5; sum_x3 sum_x4 sum_x5 sum_x6];
        B = [sum_y; sum_xy; sum_x2y; sum_x3y];
        a = (A\B);
        
        % Assigning coefficients
        a_0 = a(1);
        a_1 = a(2);
        a_2 = a(3);
        a_3 = a(4);
        
        % Calculating the error
        Er = sum((y - (a_3*x.^3 + a_2*x.^2 + a_1*x + a_0)).^2);
    end
    
end
