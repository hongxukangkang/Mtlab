function A_interp_pic = Bilinear_Filter_interp(A, filter_coef)
% 双线性插值滤波
% Input:    A: 输入图像
%           filter_coef: 滤波器系数
% Output:   
%           A_interp_pic:  双线性插值滤波图像

if (length(size(A)) == 3)
% 如果输入图像为3D数组，则重复插值滤波3次
    for i=1:3
        A_interp_pic(:,:,i) = Bilinear_Filter_interp(A(:,:,i),filter_coef);
    end
    
else
    [m,n] = size(A);       % 求行列
    % 初始化
    A1 = [];           % 初始化
    A_interp_pic = []; % 初始化
    % 列插值
    A_col= filter2(filter_coef,A);       % 滤波
    for i=1:n
        A1 = [A1, A(:,i), A_col(:,i)];
    end
    A1(:,end) = [];    % 去边缘
    % 行插值
    A_rows = filter2(filter_coef,A1')';  % 滤波
    for i=1:m
        A_interp_pic = [A_interp_pic; A1(i,:); A_rows(i,:)];
    end
    A_interp_pic(end,:) = []; % 去边缘
    
end

