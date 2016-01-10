function b = med_filt2(a,mn)
% 中值滤波
% 输入：
%      a：输入二维图像局长呢
%      mn：为[m,n]滤波模板
% 输出：
%      b:中值滤波图像

domain = ones(mn);          % 模板
if (rem(prod(mn), 2) == 1)
    order = (prod(mn)+1)/2; % 中值
    b = ordfilt2(a, order, domain, 'zeros'); % 排序滤波
else
    order1 = prod(mn)/2;
    order2 = order1+1;
    b = ordfilt2(a, order1, domain, 'zeros');  % 排序滤波
    b2 = ordfilt2(a, order2, domain, 'zeros'); % 排序滤波
	if islogical(b)  % 逻辑运算
		b = b | b2;  % 或运算
	else
		b =	imlincomb(0.5, b, 0.5, b2); % 0.5*b + 0.5*b2
	end
end