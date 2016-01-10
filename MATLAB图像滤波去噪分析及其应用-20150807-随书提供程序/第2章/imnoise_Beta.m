function R = imnoise_Beta(M, N, a,b)
% input:
%       Beta分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin < 4
   a = 1;b = 1;
end
   % 产生Beta分布噪声
   for i=1:M
       for j=1:N
           x=rand;
           R(i,j) = gam(a+b)./(gam(a).*gam(b)) .* (1-x).^(b-1).*x.^(a-1);
       end
   end
end

function T = gam(z)
umax= 10;
T=0;
for i =0:1:umax
    T =T + i^(z-1)*exp(-i);
end
end




