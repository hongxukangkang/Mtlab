function [J, LAGRA] = deconvreg_filter(I,PSF,NP)
% 约束最小平方滤波器
%函数输入: 
%        I:   输入的二维图像矩阵
%        PSF: 退化函数的空域模板
%        NP:  表示噪声的功率
%函数输出: 
%        J: 约束最小平方滤波图像
%        LAGRA: 可以为一个数值，表示指定约束最小平方的最佳复原参数y，
%               也可以为[min,max]形式，表示参数y的搜索范围
%               若此参数省略，则表示搜索范围为[1e-9,1e9] 。

% 约束最小平方滤波
if ~isa(I,'double')
    I = double(I)/255;
end
LR = [1e-9 1e9];    % 复原参数搜索范围
% 求解输入图像维数
sizeI = size(I);
% PSF 矩阵
sizePSF = size(PSF);
% 输入图像的维数求解
numNSdim = find(sizePSF~=1);  
NSD = length(numNSdim);
% 转化PSF函数到期望的维数 光传递函数OTF
otf = psf2otf(PSF,sizeI);
% regop：通过计算拉普拉斯算子计算图像的平滑性
% 具体见表达式（10.23）
  if NSD == 1,
    regop = [1 -2 1];
  else % 二维矩阵
    % 3x3 Laplacian matrixes
    regop = repmat(zeros(3),[1 1 3*ones(1,NSD-2)]);
    % center matrix of Laplacian
    idx = [{':'}, {':'}, repmat({2},[1 NSD-2])];
    regop(idx{:}) = [0 1 0;1 -NSD*2 1;0 1 0];  %　模板算子
  end
%   regop =
%      0     1     0
%      1    -4     1
%      0     1     0
  % 改变REGOP折返回原始维数
  idx1 = repmat({1},[1 length(sizePSF)]);
  idx1(numNSdim) = repmat({':'},[1 NSD]);
  REGOP(idx1{:}) = regop;
% 转化PSF函数到期望的维数 光传递函数OTF  
REGOP = psf2otf(REGOP,sizeI);

fftnI = fftn(I);
R2 = abs(REGOP).^2;
H2 = abs(otf).^2;

% 计算LAGRA值
if (numel(LR)==1) || isequal(diff(LR),0),% LAGRA is given
  LAGRA = LR(1);
else % 采用fminbnd在[1e-9,1e9]优化，加速计算
  R4G2 = (R2.*abs(fftnI)).^2;
  H4 = H2.^2;
  R4 = R2.^2;
  H2R22 = 2*H2.*R2;
  ScaledNP = NP*prod(sizeI);
  LAGRA = fminbnd(@ResOffset,LR(1),LR(2),[],R4G2,H4,R4,H2R22,ScaledNP);
end;

% 重构图像
Denom = H2 + LAGRA*R2;
Nomin = conj(otf).*fftnI;

% 保证Denom中的最小值取为sqrt(eps)
Denom = max(Denom, sqrt(eps));
J = real(ifftn(Nomin./Denom));   % 取实部
end

function f = ResOffset(LAGRA,R4G2,H4,R4,H2R22,ScaledNP)
% 计算反向卷积残差-留数计算
% Parseval's theorem 
Residuals = R4G2./(H4 + LAGRA*H2R22 + LAGRA^2*R4 + sqrt(eps));
f = abs(LAGRA^2*sum(Residuals(:)) - ScaledNP);
end

