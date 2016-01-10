function [Y,Xpad] = kuwahara(X,WINSZ)
% kuwahara_filter滤波器
% 对图像边界轮廓有较强的保护作用
% kuwahara nonlinear edge-preserving filtering
% 函数输入：
%          X：二维图像矩阵
%          WINSZ： window size
% 函数输出：
%          Y：滤波图像
%          Xpad：点扩展矩阵
% The Kuwahara filter 4块，(最直观的如下所示，5x5 pixels). 
%
%    ( a  a  ab   b  b)
%    ( a  a  ab   b  b)
%    (ac ac abcd bd bd)
%    ( c  c  cd   d  d)
%    ( c  c  cd   d  d)

if nargin < 2
    WINSZ = 5;  % 默认值
end

if ~isa(X,'double')
    X = im2double(X);  % double类型
end

Pad = floor(WINSZ/2);  % 向下取整

Xpad = padarray(X,[Pad, Pad],'replicate');  % 点扩展
% A = [ 1 2; 
%       3 4 ];
% B = padarray(A,[3 2],'replicate','post')
% B =
%      1     2     2     2
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
[padRows,padCols] = size(Xpad);                    % 求维数
Y = zeros(size(X));

nRowIters = length((Pad+1):(padRows-Pad));
count = 1;
for i = (Pad+1):(padRows-Pad)
    for j = (Pad+1):(padCols-Pad)
        % 分成每一个小窗，Q1~Q4
        w = Xpad((i-Pad):(i+Pad),(j-Pad):(j+Pad));
        wnw = w(1:(Pad+1),1:(Pad+1));
        wne = w(1:(Pad+1),(Pad+1):WINSZ);
        wsw = w((Pad+1):WINSZ,1:(Pad+1));
        wse = w((Pad+1):WINSZ,(Pad+1):WINSZ);
        % 计算方差
        s = var([wnw(:),wne(:),wsw(:),wse(:)]);
        m = mean([wnw(:),wne(:),wsw(:),wse(:)]);
        [y,k] = min(s);  
        % 计算均值
        Y(i,j) = m(k);
    end

end
