function Z = imnoise_period(M,N,C,A,B)
% input:
%       M,N: 生成的噪声矩阵的尺寸
%       C： k x 2的矩阵，表示周期噪声在频域的位置，k为噪声频点数目，矩阵的每行为
%           距离中心的偏置，如40,30表示在频域中心向右偏30，向下偏40，该点的中心对称点自动获得；
%       A：含有k个元素的向量，表示k各噪声频点的幅度
%       B：k x 2矩阵，表示k个噪声频点的相位特性，每行第一个元素为频点相位，另一个元素为共轭频点相位
% output:
%       Z：空域噪声图像矩阵
[K,n] = size(C);
if nargin==3
    A(1:K)=1;
    B(1:K,1:2)=0;
elseif nargin ==4
    B(1:K,1:2)=0;
end
% 生成频域矩阵
R = zeros(M,N);
for j=1:K
    u1 = M/2 + 1 + C(j,1);
    v1 = N/2 + 1 + C(j,2);
    R(u1,v1) = i * (A(j)/2) * exp(i*2*pi*C(j,1)*B(j,1)/M);
    % 复数共轭
    u2 = M/2 + 1 - C(j,1);
    v2 = N/2 + 1 - C(j,2);
    R(u2,v2) = -i * (A(j)/2) * exp(i*2*pi*C(j,2)*B(j,2)/N);
end
% 空域矩阵
Z = real(ifft2(ifftshift(R)));









