function [imgOutput, nIter, dtt] = NCD_filter(imgInput, Tmax)
%　非线性复扩散滤波
% 函数输入：
%        imgInput - 含噪声的图像
%        Tmax  - 扩散时间
% 函数输出:
%        imgOutput - f非线性复扩散滤波图像
%        nIter  - 滤波迭代处理次数
%        dtt    - 每一次迭代的时间步长
% 设定默认的迭代扩散时间
if nargin < 2 ;   % 输入个数小于2
    Tmax  = 3.0 ; % Tmax默认赋值
end 

% 初始化操作
theta     = pi/30;           % 初始化
j         = sqrt(-1);        % 初始化
e_jxtheta = exp(j*theta);    % 初始化
kappamin  =   2.0;           % 初始化
kappamax  =  28.0;           % 初始化

% 高斯滤波器
wsize     = 3;  % 窗口大小 3 x 3
wsigma    = 10; % 方差
filter_gaussian    = fspecial('gaussian', wsize, wsigma);  % 滤波掩模
% fspecial('gaussian', 3, 0.001)
% ans =
%      0     0     0
%      0     1     0
%      0     0     0
% fspecial('gaussian', 5, 0.001)
% ans =
%      0     0     0     0     0
%      0     0     0     0     0
%      0     0     1     0     0
%      0     0     0     0     0
%      0     0     0     0     0
% 扩散滤波器系数
wsigma2    = 0.5; % 方差
filter_gaussian2  = fspecial('gaussian', wsize, wsigma2);  % 滤波掩模

lapKernel      = [0,1,0; 1,-4,1; 0,1,0]; % laplacian kernel
gradKernel     = [-1/2,0,1/2];          % 梯度kernel
[xSize, ySize] = size(imgInput);         % 图像维数

Border = 2; % 图像边界2个像素点之间不进行梯度计算
indexX = 1+Border:xSize+Border; % (1+Border):(xSize+Border)
indexY = 1+Border:ySize+Border; % (1+Border):(xSize+Border)

if ~isa(imgInput,'double')
    yNCDF = double(imgInput); % 图像数据类型转换
end

t_iter = 0;  % 迭代时间累加和
nIter = 0;  % 迭代次数

while (Tmax - t_iter) > eps % 扩散时间
    nIter = nIter + 1;
    ryNCDF = real(yNCDF);  % 实部
    iyNCDF = imag(yNCDF);  % 虚部
    
    % 滤波,见表达式（10.32）
    localAvg = filter2(filter_gaussian, ryNCDF, 'same');
    minlocalAvg = min(localAvg(:));   % 最小值
    
    % 自适应系数 k，见表达式（10.31）
    k_mod = kappamax + (kappamin-kappamax)* ...
        (localAvg - minlocalAvg) / (max(localAvg(:)) - minlocalAvg);
    % 非线性复扩散函数
    coefDif = e_jxtheta ./ (1 + ( (iyNCDF/theta) ./ k_mod ).^2);
    coefDif = filter2(filter_gaussian, coefDif, 'same');

    % 计算 laplacian and gradient
    % lap(yNCDF)
    yAux  = zeros(xSize+2*Border, ySize+2*Border);
    yAux(indexX, indexY) = yNCDF;
    del2Y = conv2(yAux, lapKernel, 'same');
    del2Y = del2Y(indexX, indexY);
    
    % grad(yNCDF)
    dAux  = conv2(yAux, gradKernel, 'same');  % 卷积
    dYx   = dAux(indexX, indexY);
    dAux  = conv2(yAux, gradKernel', 'same'); % 卷积
    dYy   = dAux(indexX, indexY);
    
    % grad(coefDif)
    dDx   = conv2(coefDif, gradKernel, 'same');  % 卷积
    dDy   = conv2(coefDif, gradKernel', 'same'); % 卷积
    
    dIdt  = coefDif.*del2Y + dDx.*dYx + dDy.*dYy;
    
    % 计算自适应时间步长
    dt = (1/4)*( 0.25 + 0.75*exp(- max(max( abs(real(dIdt)) ./ ryNCDF ))) );
    
    dtt(nIter) = dt;
    
    % 约束每一步的最大步长
    if t_iter + dt > Tmax ;
        dt = Tmax - t_iter ; 
    end
    % 更新已经处理已经扩散的时间消耗
    t_iter = t_iter + dt;
    
    % 更新 yNCDF
    yNCDF = yNCDF + dt.*dIdt;
    
end % 结束，对应while (Tmax - t_iter) > eps

imgOutput = real(yNCDF);  % 实部，图像输出

end
