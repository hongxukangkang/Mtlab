function R = imnoise_rayleigh(M, N, a,b)
% input:
%       瑞利rayleigh分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
   % 产生瑞利分布噪声
   R = a + (-b*log(1 - rand(M, N))).^0.5;
end