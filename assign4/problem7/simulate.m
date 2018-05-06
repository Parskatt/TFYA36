global alpha;
alpha = 1;
global b;
b = 1;
%% Setup
x = 0:0.01:1;
y = 0:0.01:1;

[X,Y] = meshgrid(x,y);
X_begin = X;
Y_begin = Y;
%% Simulate
t_vec = 2:50;
X_vec = zeros([size(X), length(t_vec)+1]);
Y_vec = zeros([size(Y), length(t_vec)+1]);
XY_vec = zeros([length(t_vec), size(Y),2]);
X_vec(:,:,1) = X;
Y_vec(:,:,1) = Y;
XY_vec(1,:,:,1) = X;
XY_vec(1,:,:,2) = Y;
for t = t_vec
    [X,Y] = mapxy(X,Y);
    X_vec(:,:,t) = X;
    Y_vec(:,:,t) = Y;
    XY_vec(t,:,:,1) = X;
    XY_vec(t,:,:,2) = Y;
end
%% Long simulate
t_vec = 2:100000;
for t = t_vec
    [X,Y] = mapxy(X,Y);
end
%% Fixed points
fixpts = (X_begin-X).^2+(Y_begin-Y).^2 < 0.0001;
result = zeros(size(X));
result(fixpts) = 1;
imagesc(result);
%% Histogram
figure(1);
hist3(squeeze(XY_vec(:,30,70,:)),'Nbins',[32 32]);
legend('Num of elements in each bin')
title('Support for ergodicity: starting at x=0.01, y= 0.01, alpha = 1, b = 1/3, t = 5000')
%% Plot one boi
plot3(squeeze(X_vec(23,40,:)),squeeze(Y_vec(50,50,:)),[1 t_vec]);
%% Cat mapping (just a circle)
circle = (X_begin-0.5).^2 + (Y_begin-0.5).^2 < 0.2;
idx = sub2ind(size(X),int16(Y(circle)*100)+1,int16(X(circle)*100)+1);
beginning = zeros(size(X));
result = zeros(size(X));
beginning(circle) = 1;
result(idx) = 1;
figure(2)
imagesc(beginning)
title('Beginning unperturbed circle')
figure(3)
imagesc(result)
title('The resulting mix')



