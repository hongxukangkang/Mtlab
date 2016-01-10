function R = imnoise_X2(M, N, a)
% input:
%       卡方X2，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin < 1
   a = 1;
end
   % 产生卡方分布噪声
   R=zeros(M,N);
   for i=1:a
        R = R + 5*randn(M, N).^2;
   end
end

   
   