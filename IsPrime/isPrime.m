text = 'Type your number: ';
x = input(text);
disp(isPrime(x));

function y = isPrime(n)
              
i=2; 

while i<=sqrt(n) 
      if mod(n,i)==0 
          y = 'This is not a prime number'; 
          return 
          break
      else 
             i=i+1; 
      end
   
end
y = 'This is a prime number!';
return
end

%a = isPrime(83) -- Returns 'This is a prime number!'
%b = isPrime(127) -- Returns 'This is a prime number!'
%c = isPrime(367) -- Returns 'This is a prime number!'