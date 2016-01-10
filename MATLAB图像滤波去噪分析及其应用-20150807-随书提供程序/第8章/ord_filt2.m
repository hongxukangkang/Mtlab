function A = ord_filt2(im,order,domain)

if ~isa(im,'double')   % �Ƿ�Ϊdouble����
    A = double(im)/255;
end

domainSize = size(domain);  % ά��
center = floor((domainSize + 1) / 2);
[r,c] = find(domain);
r = r - center(1);  % �����ķֿ�
c = c - center(2);  % �����ķֿ�
padSize = max(max(abs(r)), max(abs(c))); % ��������ĵ���󳤶�
A = padarray(A, padSize * [1 1], 0, 'both');  % ��Χȫ����0��䣬��������2��0������������0
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
Ma = size(A,1);  % ��
offsets = c*Ma + r;
% ȷ��offsets��Ч
if ~isreal(offsets) || any(floor(offsets) ~= offsets) || any(~isfinite(offsets))
    error(message('offsets��Ч'))
end

% ����
  B = ord_filt2(A, order, offsets);
end
