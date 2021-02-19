% Example
a = [1 2 -2; 2 3 1; 3 2 -4];
b = [9 23 11];
c = Gauss_alt(a,b);

% Function
function x = Gauss_alt(a, b)
if isrow(b) % If b is a row vector we transform to a column vector
    b = transpose(b);
end

a_b = [a b]; % We concatenate both matrices
[R, C] = size(a_b); % Obtain the number of rows and columns

% Elimination phase
for j = 1:(R-1)

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
