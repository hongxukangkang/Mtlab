function R = imnoise_poission(im,M, N, lamda)
% input:
%       泊松poission分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin < 4
   lamda = 0.5;
end
   % 产生poission分布噪声
   for i = 1:M
       for j=1:N
           b=1;
           c = double( floor(im(i,j)/30)+1 );
           for k =1:c
               b=b*k;
           end
           R(i,j) = exp(-lamda).*lamda.^(c)./b;
       end
   end
end
