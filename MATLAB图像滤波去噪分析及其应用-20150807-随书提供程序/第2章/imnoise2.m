function R = imnoise2(type, M, N, a, b)
% input:
%       type���ַ��������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin == 1
   a = 0; b = 1;
   M = 1; N = 1;
elseif nargin == 3
   a = 0; b = 1;
end
% ʹ��lower���������Ժ���������ĸ��Сд����
switch lower(type)
    % �������ȷֲ�����
case 'uniform'
   R = a + (b - a)*rand(M, N);
   % ������˹�ֲ�����--������
case 'gaussian'
   R = a + b*randn(M, N);
   % ������������
case 'salt & pepper'
   if nargin <= 3
      a = 0.05; b = 0.05; % Ĭ�ϲ���
   end
   R(1:M, 1:N) = 0.5;
   X = rand(M, N);
   c = find(X <= a);
   R(c) = 0;
   u = a + b;
   c = find(X > a & X <= u);
   R(c) = 1;
   % ����������̬�ֲ�����
case 'lognormal'
   if nargin <= 3
      a = 1; b = 0.25;
   end
   R = a*exp(b*randn(M, N));
   % ���������ֲ�����
case 'rayleigh'
   R = a + (-b*log(1 - rand(M, N))).^0.5;
   % ����ָ���ֲ�����
case 'exponential'
   if nargin <= 3
      a = 1;
   end
   k = -1/a;
   R = k*log(1 - rand(M, N));
   % ����٤��ֲ�����
case 'erlang'
   k = -1/a;
   R = zeros(M, N);
   for j = 1:b         
      R = R + k*log(1 - rand(M, N));
   end
otherwise
   error('�������.')
end