function H = freqfilter_gaussian(M,N,D0,W)
% 高斯带阻滤波器
% input:
%     指定滤波器的类型’gaussian’
%     M,N:频域滤波器的尺寸
%     D0：带阻滤波器的截止频率
% output:
%       H：M x N的矩阵，表示频域滤波器矩阵，数据类型为double，

u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
H = 1-exp(-(1/2).*((D.^2-D0^2)./(D.*W)).^2);
end