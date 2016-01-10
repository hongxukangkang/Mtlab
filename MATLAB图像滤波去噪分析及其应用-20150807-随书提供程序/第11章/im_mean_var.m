function [im_Mean, im_Var] = im_mean_var(im, w_size, out_size, bound, flag)
% 函数输入:
    % im: 待求的影像，或者矩阵
    % w_size: 窗口的大小,如5代表5*5的窗口
    % out_size：输出图像的大小，可以是'same'或者'full'
    % bound: 边缘的扩展模式，分为'symmetric'，'replicate','circular'。
    % flag：计算时是否包含中心像素，0为不包含，1为包含。
% 函数输出:
    % im_Mean：均值影像/矩阵
    % im_Var：方差影像/矩阵

% 均值滤波器
h = ones(w_size);
h_size=w_size^2;
if flag == 0
    h((w_size+1)/2,(w_size+1)/2) = 0;
    h_size = h_size - 1;
end
h = h ./ h_size;
im_Mean = imfilter(im, h, bound, out_size);
% 方差
im_Var = zeros(size(im));
% 将原始矩阵按照bound的模式进行边缘扩展
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
row=imsize(1);  % 行
col=imsize(2);  % 列
tmp = (w_size-1)/2;
for i=1:1:row-tmp*2
    for j=1:1:col-tmp*2
        im_sub = imcrop(im_pad, [i, j, w_size-1, w_size-1]); % 取小窗口
        m2v=im_sub(:);
        if(flag == 1)  % 如果包含中间点
            im_Var(j,i) = var(m2v,1);    % 不是无偏估计(N-1)，而是用N
        else           % 如果不包含中间点
            tt = zeros(w_size^2-1 , 1);
            tt(1:(w_size^2-1)/2) = m2v(1:(w_size^2-1)/2);
            tt((w_size^2-1)/2+1:end) = m2v((w_size^2-1)/2+2:end);
            im_Var(j,i) = var(tt,1);
        end    
    end
end

