% linear solver "glpk” - means GNU Linear Programming Kit
% non linear "fsolve" - not our problem
function [xmin, fmin, status, extra]=SimpleSolver
%example -  f(y) =  max C'*x
c = [10, 6, 4]';
%liniowe ograniczenie (linear constraint) A*x = b
A = [ 1, 1, 1;
     10, 4, 5;
      2, 2, 6];
b = [100, 600, 300]';

%lower bounds on each of the variables 
lb = [0, 0, 0]';

%upper bound on each of the variables
ub = [];

%characters containing the sense of each constraint in the constraint matrix
ctype = "UUU"; % "U" - inequality constraint with an upper bound

%types of variables - "C" continuous variable 
vartype = "CCC";

%1 = min , -1 max
s = -1;

%length of return  message = "1" erroes + warnings
param.msglev = 1;

% max numbers of iteration - dont burn my PC : )
param.itlim = 100;

[xmin, fmin, status, extra] = glpk (c, A, b, lb, ub, ctype, vartype, s, param)
   
return
endfunction
 