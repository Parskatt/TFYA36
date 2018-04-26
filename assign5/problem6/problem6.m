clear
close all
global A;
A = 0.2;
epsilon = A*pi/1.99;
sim_t = 100;
t_vec = 1:sim_t;
theta = -pi/2:0.01:3*pi/2;
%%
evo = zeros([length(theta) sim_t]);
for t = t_vec 
    evo(:,t) = theta;
    theta = theta + epsilon - f(theta);
end
hold off
figure(1);
plot(t_vec,evo);%evo(1,:));