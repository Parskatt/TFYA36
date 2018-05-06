clear;
global b;
J = [3-1/3, -1/3;
    3, 0];
[eigvec, eig] = eig(J);
lam1 = log(eig(1,1));
lam2 = log(eig(2,2));