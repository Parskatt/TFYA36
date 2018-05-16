clear
close all
global A;
A = 0.002;
epsilon = A*pi/1.99;
sim_t = 1000;
t_vec = 1:sim_t;
theta = -pi/2:0.01:pi/2;
%%
evo = zeros([length(theta) sim_t]);
for t = t_vec 
    evo(:,t) = theta;
    theta = theta + epsilon - f(theta);
end
hold off
figure(1);
plot(t_vec,evo);%evo(1,:));
ylim([-pi/2 pi])
xlim([1 length(t_vec)])
title(['A = ',num2str(A)])