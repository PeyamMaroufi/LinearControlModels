% This file is meant to run before running simulink model. In this file we
% trying to model the suspension behaviour of a suspension system.
%  
%  ||
%  &&
% |_._|
%   |
% Following are the variables used in this model
% M1 : Quarter mass kg
% M2 : Suspension mass kg
% K1 : Spring suspension N/m
% K2 : Wheel and tire's suspension N/m
% b1 : Damping of suspension N/m
% b2 : Damping of tire N/m
% U  : Control Input N
% The transfer funtion is :
% ((M1+M2)*s^2+b2*s+K2)/((M1*s^2+b1*s+K1)*(M2*s^2+(b1+b2)*s+(K1+K2))-(b1*s+K1)*(b1*s+K1));
% which is simplified in the simulink transfer function block
clear all, clc,

M1 = 2500;
M2 = 320;
K1 = 80000;
K2 = 500000;
b1 = 350;
b2 = 15020;
