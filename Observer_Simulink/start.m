% This file is used to model the following dynamic system
% x'(t) = Ax(t) + Bx(t)
% y(t) = C x(t)
% where the observer is designed according to :
% x'(t) = (A-LC)x(t) + Ly(t)+Bu(t)
% y = Cx(t)
% Steps:
% 1) First defined constant matrix A, B, C, D
% 2) Define them in the continuous-time state-space
% 3) Find the eigen values and check stability
% 4) Check controllability

% Now assume that A = [20.6 2; 2 -1] and B=[5 1]
% C=[1 1]. Desired poles[-10 -9]. Initial values = [1 1]

clc, clear all,
% Defining A matrix:
a = [20.6 2; 2 -1];
% Defining B matrix:
b = [5 1]';
% Defining C matrix:
c = [1 1];
% Defining Initial values:
x_o = [1 1];
% Defining D matrix. in this case it is zero
d = 0;
% Desired poles:
sys_poles = [-10 9];

% State space model:
sys = ss(a,b,c,d);
% Getting eigen values to check stability. Negative values assure
% stability but it is not required for observability:
eigenValues = eig(sys);
% Getting rank of the system. Full rank assure stability:
rankValues = rank(obsv(sys));
% Place the poles at desired place
L_T= place(a',c',[-10,-9]);
L=L_T';