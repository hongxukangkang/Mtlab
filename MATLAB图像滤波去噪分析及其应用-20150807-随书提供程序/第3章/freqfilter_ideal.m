function H = freqfilter_ideal(M,N,D0,W)
% 理想带阻滤波器
% input:
%     M,N:频域滤波器的尺寸
%     D0：带阻滤波器的截止频率
%     W:带宽
% output:
%       H：M x N的矩阵，表示频域滤波器矩阵，数据类型为double，

u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
	H = double( or( D<(D0-W/2), D>(D0+W/2) ) );
end
