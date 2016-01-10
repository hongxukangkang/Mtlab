function A = ord_filt2(im,order,domain)

if ~isa(im,'double')   % 是否为double类型
    A = double(im)/255;
end

domainSize = size(domain);  % 维数
center = floor((domainSize + 1) / 2);
[r,c] = find(domain);
r = r - center(1);  % 以中心分开
c = c - center(2);  % 以中心分开
padSize = max(max(abs(r)), max(abs(c))); % 求距离中心点最大长度
A = padarray(A, padSize * [1 1], 0, 'both');  % 周围全部用0填充，向左右增2列0，上下增两行0
% A =
%      1     3     4
%      2     3     4
%      3     4     5
% B = padarray(A, 2 * [1 1], 0, 'both')
%      0     0     0     0     0     0     0
%      0     0     0     0     0     0     0
%      0     0     1     3     4     0     0
%      0     0     2     3     4     0     0
%      0     0     3     4     5     0     0
%      0     0     0     0     0     0     0
%      0     0     0     0     0     0     0
Ma = size(A,1);  % 行
offsets = c*Ma + r;
% 确保offsets有效
if ~isreal(offsets) || any(floor(offsets) ~= offsets) || any(~isfinite(offsets))
    error(message('offsets无效'))
end

% 排序
  B = ord_filt2(A, order, offsets);
end
