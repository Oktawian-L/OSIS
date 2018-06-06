% example of 2 equations in 2 unknowns
function [y]=user_func(x)
   %y=(6*x^4-x^3-7*x^2+x+1)+sin(x);
    y(1) = -2*x(1)^2 + 3*x(1)*x(2)   + 4*sin(x(2)) - 6;
    y(2) =  3*x(1)^2 - 2*x(1)*x(2)^2 + 3*cos(x(1)) + 4;
endfunction;