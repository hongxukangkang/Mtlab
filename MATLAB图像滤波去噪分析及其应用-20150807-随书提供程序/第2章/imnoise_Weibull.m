function R = imnoise_Weibull(M, N, a,b)
% input:
%       ������Weibull�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
   % �����������ֲ�����
   % a --- > k
   % b --- > lamda
   for i=1:M
       for j=1:N
           x = randn;
           if x>=0
               R(i,j)=(a/b)*(x./b).^(a-1)*exp(-(x./b).^a);
           else
               R(i,j)=0;
           end
       end
   end
   
end
