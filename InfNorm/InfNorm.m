% Example
a = [6 3 11 -1 2; 3 -2 7 0 4; 3 2 -6 5 -3; -5 7 1 -4 0]
b = InfNorm(a)

% Function
function output = InfNorm(matrix)
    x = size(matrix); % Dimensions of the matrix
    dim = x(1); % Number of columns
    results = []; % Array to store our results
    for c = 1:dim % Looping through each row
        y = matrix(c,:); % Each row of the matrix
        sum_y = sum(abs(y)); % Absolute sum of all values in the row
        results = [results, sum_y]; % Appending to the results array
    end
    output = max(results); % Finding the maximum value
end
