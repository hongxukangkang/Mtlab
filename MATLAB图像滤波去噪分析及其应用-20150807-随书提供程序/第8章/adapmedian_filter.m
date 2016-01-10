function Z = adapmedian_filter(X, Smax)
% 函数对输入图像进行邻域窗口大小可变的自适应中值滤波
%  函数输入
%        X：输人二维图像矩阵
%        smax：中值滤波邻域窗日的最大值，必须是大于1的奇数
%  函数输出
%        Z：输出图像矩阵，数据类型与输人相同
% smax必须是大于1的奇数
if (Smax<=1) | (Smax/2 == round(Smax/2)) | (Smax ~= round(Smax))
    error('smax必须是大于1的奇数')
end
if size(X,3)~=1
    error('图像应该为2维矩阵')
end
if ~isa(X,'double')
    X = double(X)/255;  % 数据类型 
end
[M, N] = size(X);
% 初始化
Z = X;  Z(:)=0;
LevelA = false(size(X));   % 初始化，同X的 全0逻辑矩阵
% 开始滤波
for k=3:2:Smax
    Zmin = ordfilt2(X,1,ones(k,k),'symmetric' );   % 排序滤波
    Zmax = ordfilt2(X,k*k,ones(k,k), 'symmetric'); % 排序滤波
    Zmed = medfilt2(X,[k,k], 'symmetric');         % 中值滤波
    % 判断是否进入B层
    LevelB = (Zmed>Zmin)&(Zmax>Zmed)&LevelA;  % 判断A层
    ZB = (X > Zmin) & (Zmax > X);
    outputZxy = LevelB & ZB;    % 交运算
    outputZmed = LevelB & ~ZB;  % 交运算
    Z(outputZxy) = X(outputZxy);            % 赋值
    Z(outputZmed) = Zmed(outputZmed);       % 赋值
    LevelA = LevelA  | LevelB; % 非运算
    if all(LevelA(:))
        break;
    end
end
Z(~LevelA) = Zmed(~LevelA); % 赋值
Z = im2uint8(Z);  % 类型转化
end
