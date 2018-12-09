% in this matlab code we are trying to use the z transform and the
% symbolic function in Matlab. There are two methods for inversing. 
% on is the partial function  method that simplifies the calculations
% and the long division. I personally like the partially division 
% but here we do the partial division. That is the fact that we have
% a function like 18*z /z^4 + 15z^3 +23z +10 and we want to express it
% as r1/(z-p1) + r2/(z-p2) + ... where r1 and r 2 .. are constants. 
% look the example and you will understand 
%     

clc, clear all,
syms z 
disp('If you want to learn partial function way');
G = 10*z/(z^2 + 4*z +3); % out z transform function that we want to inverse
G = diff(int(G/z)); % Divide the z transfor function with z


B = [10]; % which is the coefficien of the demonitor
% B/A => B = (a_n*z^n + a_(n-1) * z^(n-1)+ ...+ a_2 * z^2 + a_1 * z + a_0 * z^0)
% A = (b_n*z^n + b_(n-1) * z^(n-1)+ ...+ b_2 * z^2 + b_1 * z + b_0 * z^0)
A = [1 4 3];

% Now calculate the coefficients and poles and rest
[r,p,k] = residue(B, A);

% Build the transfor function with those values 
G = (r(1)/(z-p(1)))+(r(2)/(z-p(2)));

% multiply it to z because you divided it with z before
G = expand(G*z);

% now calculate inverse
syms k positive
y = iztrans(G,k)


% Fast way if you don't care of steps
disp('If you dont care of steps and learning');
G = 10*z/(z^2 + 4*z +3);
syms k positive
y = iztrans(G,k)