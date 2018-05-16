clear;
global b;
J = [2, 1;
    3, 2];
[eigvec, eig] = eig(J);
lam1 = log(eig(1,1));
lam2 = log(eig(2,2));