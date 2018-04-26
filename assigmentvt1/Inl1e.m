res = 0.001;
r1 = (0:res:1);
r2 = (1+res:res:2);
r3 = (2+res:res:sqrt(5));
r = (0:res:sqrt(5));
Lyaponov1 = log(r1);
Lyaponov2 = log(3-2*r2);
Lyaponov3 = real(log(9-2*r3.^2)/2);
%%
Lyaponov = [Lyaponov1, Lyaponov2, Lyaponov3];

plot(r, Lyaponov);
title('Lyaponov Exponent task 1e')
xlabel('r');
ylabel('\lambda');