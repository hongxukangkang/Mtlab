function Z = adaptsmooth_filter(X,mn)
% 函数对输入的二维图像矩阵进行自适应平滑滤波
% input：
%        X：输入的二维图像矩阵
%        m：m行的滤波模板
%        n：n列的滤波末班
% output: 
%        Z：输出对m x n的二维图像矩阵的运算结果
if nargin < 2
    m = 3;  % 滤波模板尺寸
    n = 3;
end
if size(X,3)~=1
    error('图像应该为2维矩阵')
end
if ~isa(X,'double')
    X = double(X)/255;  % 数据类型 
end
m = mn(1);  n = mn(2);  % 模板大小
[n1,n2] =size(X);
X(n1:n1+m, n2:n2+n) = 0;   % 扩充，使得图像能够被m x n模板全部覆盖
% 计算掩膜系数
for i =1:size(X,1)-m
    for j=1:size(X,2)-n
        H = zeros(m,n);   % 初始化
        for k=1:m
            for l=1:n
                Gx = 0.5* ( X(k+i,l) - X(k+i-1,l) );
                Gy = 0.5* ( X(k,l+j) - X(k,l+j-1) );
                d = sqrt(Gx^2 + Gy^2);
                H(k,l) = exp(-d/2);
            end
        end
        % 计算相关累加值
        Z = H.*X(i:m+i-1,j:n+j-1);  
        % 归一化
        im1(i,j) = im2uint8( sum(Z(:))/sum(H(:)) );
    end
end
Z = im1(1:n1,1:n2); % 去掉最边缘增加的行列

end

