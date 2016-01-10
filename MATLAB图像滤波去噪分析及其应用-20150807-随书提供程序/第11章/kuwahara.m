function [Y,Xpad] = kuwahara(X,WINSZ)
% kuwahara_filter�˲���
% ��ͼ��߽������н�ǿ�ı�������
% kuwahara nonlinear edge-preserving filtering
% �������룺
%          X����άͼ�����
%          WINSZ�� window size
% ���������
%          Y���˲�ͼ��
%          Xpad������չ����
% The Kuwahara filter 4�飬(��ֱ�۵�������ʾ��5x5 pixels). 
%
%    ( a  a  ab   b  b)
%    ( a  a  ab   b  b)
%    (ac ac abcd bd bd)
%    ( c  c  cd   d  d)
%    ( c  c  cd   d  d)

if nargin < 2
    WINSZ = 5;  % Ĭ��ֵ
end

if ~isa(X,'double')
    X = im2double(X);  % double����
end

Pad = floor(WINSZ/2);  % ����ȡ��

Xpad = padarray(X,[Pad, Pad],'replicate');  % ����չ
% A = [ 1 2; 
%       3 4 ];
% B = padarray(A,[3 2],'replicate','post')
% B =
%      1     2     2     2
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
[padRows,padCols] = size(Xpad);                    % ��ά��
Y = zeros(size(X));

nRowIters = length((Pad+1):(padRows-Pad));
count = 1;
for i = (Pad+1):(padRows-Pad)
    for j = (Pad+1):(padCols-Pad)
        % �ֳ�ÿһ��С����Q1~Q4
        w = Xpad((i-Pad):(i+Pad),(j-Pad):(j+Pad));
        wnw = w(1:(Pad+1),1:(Pad+1));
        wne = w(1:(Pad+1),(Pad+1):WINSZ);
        wsw = w((Pad+1):WINSZ,1:(Pad+1));
        wse = w((Pad+1):WINSZ,(Pad+1):WINSZ);
        % ���㷽��
        s = var([wnw(:),wne(:),wsw(:),wse(:)]);
        m = mean([wnw(:),wne(:),wsw(:),wse(:)]);
        [y,k] = min(s);  
        % �����ֵ
        Y(i,j) = m(k);
    end

end
