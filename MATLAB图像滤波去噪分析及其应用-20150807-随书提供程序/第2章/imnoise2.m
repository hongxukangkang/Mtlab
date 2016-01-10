function R = imnoise2(type, M, N, a, b)
% input:
%       type：字符串，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin == 1
   a = 0; b = 1;
   M = 1; N = 1;
elseif nargin == 3
   a = 0; b = 1;
end
% 使用lower函数，忽略函数输入字母大小写问题
switch lower(type)
    % 产生均匀分布噪声
case 'uniform'
   R = a + (b - a)*rand(M, N);
   % 产生高斯分布噪声--白噪声
case 'gaussian'
   R = a + b*randn(M, N);
   % 产生椒盐噪声
case 'salt & pepper'
   if nargin <= 3
      a = 0.05; b = 0.05; % 默认参数
   end
   R(1:M, 1:N) = 0.5;
   X = rand(M, N);
   c = find(X <= a);
   R(c) = 0;
   u = a + b;
   c = find(X > a & X <= u);
   R(c) = 1;
   % 产生对数正态分布噪声
case 'lognormal'
   if nargin <= 3
      a = 1; b = 0.25;
   end
   R = a*exp(b*randn(M, N));
   % 产生瑞利分布噪声
case 'rayleigh'
   R = a + (-b*log(1 - rand(M, N))).^0.5;
   % 产生指数分布噪声
case 'exponential'
   if nargin <= 3
      a = 1;
   end
   k = -1/a;
   R = k*log(1 - rand(M, N));
   % 产生伽玛分布噪声
case 'erlang'
   k = -1/a;
   R = zeros(M, N);
   for j = 1:b         
      R = R + k*log(1 - rand(M, N));
   end
otherwise
   error('输入错误.')
end