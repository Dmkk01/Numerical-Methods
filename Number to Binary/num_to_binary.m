em x = number_to_binary(50,1);
x = number_to_binary(-0.625,2);
x = number_to_binary(66.25);

function binary = number_to_binary(x, p)
    if nargin == 1; p = 1; end
    binary = [];
    if 2^(100) < x || x < -2^(100)
        disp('The number is not correct');
        return
    else
        if p == 1
            bias = 127;
            mant = 23;
            exp = 8;
        elseif p == 2
            bias = 1023;
            mant = 52;
            exp = 11;
        else
            disp('Value of p is incorrect');
            return
        end
        if x > 0
            sign = [0];
            binary = [binary sign];
        else
            sign = [1];
            binary = [binary sign];
        end
        exponent_power = power_number(x);
        number = x / (2^exponent_power);
        
        mantissa = number_to_mantissa(number);
        zero_number = mant - length(mantissa);
        zero_vector = zeros(1, zero_number);
        full_mantissa = [mantissa zero_vector];
        
        expo = exponent_power + bias;
        exponent = number_to_exponent(expo);
        zero_number_2 = exp - length(exponent);
        zero_vector_2 = zeros(1, zero_number_2);
        full_exponent = fliplr([exponent zero_vector_2]);
        
        binary = [binary full_exponent];
        binary = [binary full_mantissa];

        disp('Your number is: ');
        disp(x);
        disp('The binary floating point is: ');
        disp(sprintf('%d', binary));;
        disp('The sign is: ');
        disp(sprintf('%d', sign));
        disp('The exponent + bias is: ');
        disp(sprintf('%d', full_exponent));
        disp('The mantissa is: ');
        disp(sprintf('%d', full_mantissa));
        disp('--------------------------------------');
        
    end
end


function exponent_power = power_number(k)
if k > 0
    for a=0:k
        if 2^a > k
            exponent_power = a-1;
            break
        end
    end
end
if k < 0
    a = 0;
    while 2^a > k
        a = a - 1;
        break
    end
    exponent_power = a;
 
end

end

function mantissa = number_to_mantissa(m)
    mantissa = [];
    if m < 0 
        m = -m;
    end
    m = m - 1;
    if m == 1 
        mantissa = [mantissa 1]; 
    end
    while m ~= 1
        m = m*2;
        if m > 1
            mantissa = [mantissa 1];
            m = m - 1;
        elseif m == 1
            mantissa = [mantissa 1];
        else 
            mantissa = [mantissa 0];
        end
    end


end

function exponent = number_to_exponent(q)
    exponent = [];
    while q >= 1
        if rem(q, 2) == 0
            exponent = [exponent 0];
        else
            exponent = [exponent 1];
            q = q - rem(q,2);
        end
        q = q/2;
    end
end