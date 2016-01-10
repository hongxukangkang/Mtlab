function R = imnoise_t(M, N, a)
% input:
%       t分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin < 1
   a = 1;
end
   % 产生F分布噪声
   R1=zeros(M,N);
   R2=zeros(M,N);
   for i=1:a
        R1 = 5*randn(M, N).^2;
        R2 = 5*randn(M, N).^2;
        R = R1./sqrt(R2./a);
   end
end