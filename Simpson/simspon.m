close all
clear
clc

data_set1 = 'Data_set1.txt';
data_set2 = 'Data_set2.txt';


Simpson(data_set1) % 1.903961944501285e+02
Simpson(data_set2) % 1.429369483299998e+02

function result = Simpson(file_name)
    result = 0;
    file = dlmread(file_name, '', 3, 0);
    x = file(:, 1);
    y = file(:, 2);
    points = size(x);
    h = x(2) - x(1);
    
    if mod(points(1), 2) == 0
        % Simpson 3/8 rule
        i = 3*(h/8) * (y(1) + 3*y(2) + 3*y(3) + y(4));
        
        % Simpson 1/3 rule
        sum = y(4) + 4*y(5);
        for a=6:2:points-1
            sum = sum + 2*y(a) + 4*y(a+1);
        end
        sum = sum + y(points(1));
        
        result = i + ( sum )*h/3;
    else
        
        % Simpson 1/3 rule     
        sum = y(1) + 4*y(2);
        for a=3:2:points-1
            sum = sum + 2*y(a) + 4*y(a+1);
        end
        sum = sum + y(points(1));

        result = sum*h/3;
    end
end
    

    
    
