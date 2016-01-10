function im_ret = Lee( im, w_size, out_size, NL, bound, flag )
%   im��SARӰ��
%   w_size�����ڴ�С������ 3 5 7 9��
%   out_size�����ͼ��Ĵ�С��������'same'����'full'
%   NL��number of Looks����Ч����
%   bound����Ե��չģʽ����Ϊ'symmetric'��'replicate','circular'��
%   flag������ʱ�Ƿ�����������أ�0Ϊ��������1Ϊ������ 
%
%   bound��flag��Ҫ�Ǹ�im_mean_var�õ� :)
% ���������
%   im_ret���˲����

if ~isa(im,'double')
    im = double(im)/255;
end
[im_Mean, im_Var] = im_mean_var(im, w_size, out_size, bound, flag); % ���ֵ�ͷ���
im_Std = sqrt(im_Var);  % ����
Ci = im_Std ./ im_Mean; % ���ϵ��
Cu = sqrt(1/NL);        % �������ϵ��
tmp = 2*log(Cu) - 2.*log(Ci+0.1);
tmp = exp(tmp);
W = 1 - tmp;
im_ret = im .* W + im_Mean .* (1 - W);  % �˲����

