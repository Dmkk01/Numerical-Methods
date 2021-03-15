% Example
a = [1 cosd(45) 0 0 1 0; 0 sind(45) 0 1 0 0; 1 0 cosd(45) 0 0 0; 0 0 sind(45) 0 0 1; 0 -cosd(45) cosd(45) 0 0 0; 0 -sind(45) -sind(45) 0 0 0]
b = [0 0 0 0 0 10]
c = Gauss_alt_pivot(a,b)

% Function for calculating Gaussian pivoting
function x = Gauss_alt_pivot(a, b)
if isrow(b) % If b is a row vector we transform to a column vector
    b = transpose(b);
end

a_b = [a b]; % We concatenate both matrices
[R, C] = size(a_b); % Obtain the number of rows and columns

% Elimination phase
for j = 1:(R-1)
    
    % Checking if the pivot value equals to 0
    if a_b(j,j) == 0
        for k = j:(R-1)  % If it is equal to 0 we check every next value in the column
            if a_b(k,j) ~= 0 % If some value is not equal to 0
                % We exchange the the rows
                temp = a_b(j, :);
                a_b(j,:) = a_b(k,:);
                a_b(k,:) = temp;
                break % And exit the loop
            end
        end
    end

    for i = R:-1:j+1
        a_b(i,:) = a_b(i,:) - (a_b(i,j)/a_b(j,j))*a_b(j,:);
    end
end


x=zeros(R,1);  % Creating the zero-result vector
x(R) = a_b(R,C)/a_b(R,R); % Defining the last value

% Back substitution phase
for q = R-1:-1:1
    x(q)= (a_b(q,C)-a_b(q,q+1:R)*x(q+1:R))/a_b(q,q);
end
end