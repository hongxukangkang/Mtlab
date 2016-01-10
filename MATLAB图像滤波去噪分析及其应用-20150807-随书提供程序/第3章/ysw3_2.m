clc,clear,close all
warning off
feature jit off
D0 = 30; % 阻止的频率点与频域中心的距离
x = 0:.5:80;
y = 0:.5:80;
[X,Y] = meshgrid(x,y);
for i=1:size(X,1)
    for j=1:size(X,2)
        if sqrt( (X(i,j)-40).^2 + (Y(i,j) -40).^2) <D0
            Z(i,j)=1;
        elseif sqrt( (X(i,j)-40).^2 + (Y(i,j) -40).^2)>=D0
            Z(i,j)=0;
        end
    end
end
figure('color',[1,1,1])
mesh(X,Y,Z)