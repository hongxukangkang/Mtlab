function H = freqfilter_btw(M,N,D0,W,n)
% 巴特沃斯带阻滤波器
% input:
%     滤波器的类型，‘btw’
%     M,N:频域滤波器的尺寸
%     D0：带阻滤波器的截止频率
%     n:巴特沃斯滤波器的阶数
% output:
%       H：M xN的矩阵，表示频域滤波器矩阵，数据类型为double，
if nargin == 5
	n=1;
end
u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);

    H = 1./(1+(D*W./(D.^2-D0^2)).^(2*n));
end