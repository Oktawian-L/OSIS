% linear solver "glpk” - means GNU Linear Programming Kit
% non linear "fsolve" - not our problem
function [xmin, fmin, status, extra]=Solver2
%objective function
%c = [10, 6, 4]';
c = [0 5 8 0 0 0 2 7 0 0 0 4 0 0 0 0];

%liniowe ograniczenie (linear constraint) A*x = b

A = [ 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 1 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0;
      0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 0];

b = [1 0 1];

%lower bounds on each of the variables 
lb = [];

%upper bound on each of the variables
ub = [];

%characters containing the sense of each constraint in the constraint matrix
ctype = [];%"UUU"; % "U" - inequality constraint with an upper bound

%types of variables - "C" continuous variable 
vartype = "CCCCCCCCCCCCCCCC";

%1 = min , -1 max
s = -1;

%length of return  message = "1" erroes + warnings
param.msglev = 1;

% max numbers of iteration - dont burn my PC : )
param.itlim = 100;

[xmin, fmin, status, extra] = glpk (c, A, b, lb, ub, ctype, vartype, s, param)
   
return
endfunction