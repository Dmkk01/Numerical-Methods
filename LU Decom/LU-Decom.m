% Example system of equations
A = [1 2 -2; 2 3 1; 3 2 -4];
B= [9 23 11]';
[L, U] = LUdecom(A);
disp(L)
disp(U)
E = LUsolut(L,U,B);
disp(E)

% Functions
function [L, U] = LUdecom(A)

    [m,n]=size(A); % Dimensions of A
    % Create two-zero matrices as placeholders for the L and U matrices
    U=zeros(m);
    L=zeros(m);
    
    % L has 1s on diaganol
    for j=1:m
        L(j,j)=1;
    end
    
    % U values on first column are the same as A
    for j=1:m
        U(1,j)=A(1,j);
    end
    
    
    for i=2:m
        for j=1:m
            
            % Solving L matrix
            for k=1:i-1
                if k==1
                    s1=0; % Creating a 1st variable to use for the L values
                else
                for p=1:k-1
                    s1=s1+L(i,p)*U(p,k); % Defining its value of based on the matrices
                end
                end
                L(i,k)=(A(i,k)-s1)/U(k,k); % Inserting the value in the matrix
            end
            
            % Solving U matrix
            for k=i:m
                s2=0; % Creating a 2nd variable to use for the U values
                for p=1:i-1
                    s2=s2+L(i,p)*U(p,k); % Defining its value of based on the matrices
                end
                U(i,k)=A(i,k)-s2; % Inserting the value in the matrix
            end
        end
    end
end

function x = LUsolut(L, U, B)

    [m, n] = size(L);
    
    % Solving Ly = b
    y = zeros(m, 1); % Placeoholder for y
    
    y(1) = B(1); % Defining the first value
    
    % Back substitution for the rest of the values
    for i = 2:m
        y(i) = (B(i) - (L(i,1:i-1) * y(1:i-1) )) / L(i,i);
    end
    % Solving Ux = y
    x = zeros(m,1);
    
    x(m) = y(m)/U(m,m); % Defining the last value
    
    % Back substitution for the rest of the values
    for j = m-1:-1:1
        x(j) = (y(j)-U(j,j+1:m)*x(j+1:m))/U(j,j);
    end  
end