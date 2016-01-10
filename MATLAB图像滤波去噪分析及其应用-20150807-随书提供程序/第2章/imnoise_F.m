function R = imnoise_F(M, N, a, b)
% input:
%       F分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin < 4
   a = 1;b=1;
end
   % 产生F分布噪声
   R1=zeros(M,N);
   R2=zeros(M,N);
   for i=1:a
        R1 = R1 + 5*randn(M, N).^2;
        R2 = R2 + 5*randn(M, N).^2;
        R = R1./R2;
   end
end
