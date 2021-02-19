% Numerical Methods in Engineering Week 2 Exercise 4
% Dominik Lasinski 791351

% Example function 1:
f_1 = [5 6 -20];
roots_1 = roots(f_1)

% Example function 2:
f_2 = @(x) sin(x)*(cos(x))^2+1e-4;

% The three guesses:
roots_2_guess_1 = fzero(f_2, 1)
roots_2_guess_2 = fzero(f_2, 2)
roots_2_guess_3 = fzero(f_2, 5)
