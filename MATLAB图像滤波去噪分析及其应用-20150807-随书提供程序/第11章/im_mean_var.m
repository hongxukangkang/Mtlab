function [im_Mean, im_Var] = im_mean_var(im, w_size, out_size, bound, flag)
% ��������:
    % im: �����Ӱ�񣬻��߾���
    % w_size: ���ڵĴ�С,��5����5*5�Ĵ���
    % out_size�����ͼ��Ĵ�С��������'same'����'full'
    % bound: ��Ե����չģʽ����Ϊ'symmetric'��'replicate','circular'��
    % flag������ʱ�Ƿ�����������أ�0Ϊ��������1Ϊ������
% �������:
    % im_Mean����ֵӰ��/����
    % im_Var������Ӱ��/����

% ��ֵ�˲���
h = ones(w_size);
h_size=w_size^2;
if flag == 0
    h((w_size+1)/2,(w_size+1)/2) = 0;
    h_size = h_size - 1;
end
h = h ./ h_size;
im_Mean = imfilter(im, h, bound, out_size);
% ����
im_Var = zeros(size(im));
% ��ԭʼ������bound��ģʽ���б�Ե��չ
im_pad = padarray(im, [(w_size-1)/2 (w_size-1)/2], bound);
% A = [1 2; 3 4];
% B = padarray(A,[3 2],'replicate','post')
% B =
%      1     2     2     2
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
     
imsize = size(im_pad);
row=imsize(1);  % ��
col=imsize(2);  % ��
tmp = (w_size-1)/2;
for i=1:1:row-tmp*2
    for j=1:1:col-tmp*2
        im_sub = imcrop(im_pad, [i, j, w_size-1, w_size-1]); % ȡС����
        m2v=im_sub(:);
        if(flag == 1)  % ��������м��
            im_Var(j,i) = var(m2v,1);    % ������ƫ����(N-1)��������N
        else           % ����������м��
            tt = zeros(w_size^2-1 , 1);
            tt(1:(w_size^2-1)/2) = m2v(1:(w_size^2-1)/2);
            tt((w_size^2-1)/2+1:end) = m2v((w_size^2-1)/2+2:end);
            im_Var(j,i) = var(tt,1);
        end    
    end
end

