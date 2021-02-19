clearvars
close all
clc

% Data and functions
x = [10 25 40 55 70];
y = [12 26 28 30 24];
dx = 0.1;
x1 = (10:dx:25);
x2 = (25:dx:40);
x3 = (40:dx:55);
x4 = (55:dx:70);

% Matrix from by-hand calculations
A = [ 10 1 0 0 0 0 0 0 0 0 0;
      25 1 0 0 0 0 0 0 0 0 0;
    0 0 625 25 1 0 0 0 0 0 0;
    0 0 1600 40 1 0 0 0 0 0 0;
    0 0 0 0 0 1600 40 1 0 0 0;
    0 0 0 0 0 3025 55 1 0 0 0;
    0 0 0 0 0 0 0 0 3025 55 1;
    0 0 0 0 0 0 0 0 4900 70 1;
    1 0 -50 -1 0 0 0 0 0 0 0;
    0 0 80 1 0 -80 -1 0 0 0 0;
    0 0 0 0 0 110 1 0 -110 -1 0];

B = [12;26;26;28;28;30;30;24;0;0;0];
coeff = (A\B);

% For a better transparency of the code
% We assign the values to their coefficient names
b_1 = coeff(1);
c_1 = coeff(2);
a_2 = coeff(3);
b_2 = coeff(4);
c_2 = coeff(5);
a_3 = coeff(6);
b_3 = coeff(7);
c_3 = coeff(8);
a_4 = coeff(9);
b_4 = coeff(10);
c_4 = coeff(11);

% Functions
f1 = b_1*x1 + c_1;
f2 = a_2*x2.^2 + b_2*x2 + c_2;
f3 = a_3*x3.^2 + b_3*x3 + c_3;
f4 = a_4*x4.^2 + b_4*x4 + c_4;

% Plotting
figure(1)
hold on
plot(x1, f1, 'k');
plot(x2, f2, 'k');
plot(x3, f3, 'k');
plot(x4, f4, 'k');
scatter(x,y, 'b');
box on
xlabel('x');
ylabel('y');

% Assignment points
ex_x = [30 65];
ex_y = [29.363 30.397];
scatter(ex_x, ex_y, 'r*');



