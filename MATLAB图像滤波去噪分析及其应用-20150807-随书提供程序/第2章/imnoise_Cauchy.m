function R = imnoise_Cauchy(M, N, a,b)
% input:
%       柯西Cauchy分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin < 4
   a= 0.0; b=1.0;
end
b=1;
   % 产生柯西Cauchy分布噪声
   R = b./(pi*( b.^2 + ( rand(M,N) - a ).^2 ));
end
