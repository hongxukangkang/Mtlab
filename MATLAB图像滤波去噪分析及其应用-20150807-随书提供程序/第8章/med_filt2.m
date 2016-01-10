function b = med_filt2(a,mn)
% ��ֵ�˲�
% ���룺
%      a�������άͼ��ֳ���
%      mn��Ϊ[m,n]�˲�ģ��
% �����
%      b:��ֵ�˲�ͼ��

domain = ones(mn);          % ģ��
if (rem(prod(mn), 2) == 1)
    order = (prod(mn)+1)/2; % ��ֵ
    b = ordfilt2(a, order, domain, 'zeros'); % �����˲�
else
    order1 = prod(mn)/2;
    order2 = order1+1;
    b = ordfilt2(a, order1, domain, 'zeros');  % �����˲�
    b2 = ordfilt2(a, order2, domain, 'zeros'); % �����˲�
	if islogical(b)  % �߼�����
		b = b | b2;  % ������
	else
		b =	imlincomb(0.5, b, 0.5, b2); % 0.5*b + 0.5*b2
	end
end