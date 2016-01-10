function R = imnoise_Weibull(M, N, a,b)
% input:
%       威布尔Weibull分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
   % 产生威布尔分布噪声
   % a --- > k
   % b --- > lamda
   for i=1:M
       for j=1:N
           x = randn;
           if x>=0
               R(i,j)=(a/b)*(x./b).^(a-1)*exp(-(x./b).^a);
           else
               R(i,j)=0;
           end
       end
   end
   
end
