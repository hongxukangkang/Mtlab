function R = imnoise_Beta(M, N, a,b)
% input:
%       Beta�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin < 4
   a = 1;b = 1;
end
   % ����Beta�ֲ�����
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




