function R = imnoise_gamma(M, N, a,b)
% input:
%       伽马gamma分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
   % 产生伽玛分布噪声
   if nargin <= 3
      a = 2; b = .5;
   end
   c=0.1;
   R = zeros(M, N);     
   for i = 1:M
       for j=1:N
           x= rand;
           if x>c
               R(i,j) = b.^a./(gam(a)) .*(x-c).^(a-1).*exp(-b.*(x-c));
           else
               R(i,j)=0;
           end
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