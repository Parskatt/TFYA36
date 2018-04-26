global alpha;
alpha = 1;
global b;
b = 1;
%%
x = (0:0.01:1);
y = 0:0.01:1;

[X,Y] = meshgrid(x,y);
X_begin = X;
Y_begin = Y;
%%
t_vec = 1:20000;
X_vec = zeros([size(X), length(t_vec)]);
Y_vec = zeros([size(Y), length(t_vec)]);
XY_vec = zeros([length(t_vec), size(Y),2]);
for t = t_vec
    [X,Y] = mapxy(X,Y);
    X_vec(:,:,t) = X;
    Y_vec(:,:,t) = Y;
    XY_vec(t,:,:,1) = X;
    XY_vec(t,:,:,2) = Y;
end
%%
hist3(squeeze(XY_vec(:,2,2,:)),'Nbins',[32 32]);
N = hist3(squeeze(XY_vec(:,2,2,:)),'Nbins',[32 32]);
legend('Num of elements in each bin')
title('Support for ergodicity: starting at x=0.01, y= 0.01, alpha = 1, b = 1, t = 20000')
%% Cat mapping (just a circle)
circle = (X_begin-0.5).^2 + (Y_begin-0.5).^2 < 0.05;
distort = (X-0.5).^2 + (Y-0.5).^2 < 0.05;
beginning = zeros(size(X));
result = zeros(size(X));
beginning(circle) = 1;
result(distort) = 1;
figure(2)
imagesc(beginning)
title('Beginning unperturbed circle')
figure(3)
imagesc(result)
title('The resulting mix')

