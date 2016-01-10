function R = imnoise_gamma(M, N, a,b)
% input:
%       ٤��gamma�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
   % ����٤��ֲ�����
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