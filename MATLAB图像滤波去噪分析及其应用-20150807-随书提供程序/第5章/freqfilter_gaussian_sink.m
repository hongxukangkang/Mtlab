function H = freqfilter_gaussian_sink(M,N,u0,v0,D0)
% 高斯陷波滤波器
% input:
%     M,N:频域滤波器的尺寸
%     u0,v0：频率阻止点
%     D0：带阻滤波器的截止频率
% output:
%       H：M x N的矩阵，表示频域滤波器矩阵，数据类型为double，
u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
D1 = sqrt( (U-u0).^2 + (V-v0).^2 );
D2 = sqrt( (U+u0).^2 + (V+v0).^2 );

H = 1-exp( -(1/2)*(D1.*D2./D0^2) ) ;
end
