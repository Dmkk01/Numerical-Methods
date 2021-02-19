% Numerical Methods in Engineering Week 5
% Dominik Lasinski 791351
clc
clear
close all

A = importdata("data.txt"); % Importing the data

% Assign each column to a variable
x=A(:,1);
y=A(:,2);
[m, n] = FDA(x,y);


% Visualization
figure(1)
subplot(3,1,1)
plot(x, y, 'b');
xlabel('x');
ylabel('y');
title('Data');

subplot(3,1,2)
plot(x, m, 'r');
xlabel('x');
ylabel('y');
title('First Derivative');

subplot(3,1,3)
plot(x, n, 'g');
xlabel('x');
ylabel('y');
title('Second Derivative');




function [d1, d2] = FDA(x,y)

n = length(x); % Size of vector x
if n < 5
    disp('Not enough data')
else
    % Creating empty vectors to store the results
    d1 = zeros(n, 1);
    d2 = zeros(n, 1);
    
    h = x(2)-x(1); % Difference between all the x, assumed to be the same

	% Finding if we need to use backward, central or forward DA
    for i = 1:n
        if (i == 1)
            k = 2; % Forward 
        else
            if (i == n) 
                k = 3; % Backward
            else
                k = 1; % Central
            end
        end
  
        % Calculating the first and second derivative
        if (k == 3) 
            d1(i) = (y(i-2) - 4*y(i-1) + 3*y(i)) / (2*h);
            d2(i) = (-y(i-3) + 4*y(i-2) - 5*y(i-1) + 2*y(i)) / (h^2);
        else 
            if (k == 2)
                d1(i) = (-y(i+2) + 4*y(i+1) - 3*y(i)) / (2*h);
                d2(i) = ((2*y(i)) - (5*y(i+1)) + (4*y(i+2)) - y(i+3)) / (h^2);
            else
                if (k == 1) 
                    d1(i) = (y(i+1) - y(i-1)) / (2*h);
                    d2(i) = (y(i+1) - 2*y(i) + y(i-1)) / (h^2);
                end
            end
        end
     end
end

end

