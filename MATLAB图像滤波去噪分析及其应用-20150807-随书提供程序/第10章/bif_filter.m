function [out, psn]=bif_filter(im,sigd,sigr)
% bilateral filter双边滤波器
% 函数输入：
%           im    输入的图像
%           sigd  空间内核的时域参数
%           sigr  内核参数强度变化范围
% 函数输出：
%          out  滤波图像 = output imagespatial kernel

 w=(2*sigd)+1;
% sigr=(n*100)^2/(.003*(sigd^2));  % 自适应R值，n为高斯噪声强度,n=0.001
 
% 高斯滤波器 
gw=zeros(w,w);       % 高斯权值矩阵初始化
c=ceil(w/2);         % 向前取整
c=[c c];             % 中心元素位置

for i=1:w    
    for j=1:w
        q=[i,j]; % 记录相连像素位置标识位
        gw(i,j)=norm(c-q); % 欧氏距离
    end
end

Gwd=(exp(-(gw.^2)/(2*(sigd^2)))); % 高斯函数

% Padding 扩展图像的边界，防止滑动窗口边界值溢出
proci=padarray(im,[sigd sigd],'replicate');
% A = [1 2; 3 4];
% B = padarray(A,[3 2],'replicate','post')
% B =
%      1     2     2     2
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4

[row clm]=size(proci);    % Size of image
if ~isa(proci,'double')
    proci = double(proci)/255;   % 转换为double类型
end

K=sigd;
L=[-K:K];
c=K+1;   % 中心元素位置
iter=length(L); % 迭代次数
ind=1;

for r=(1+K):(row-K)          % 行    
    for s=(1+K):(clm-K)      % 列     
            for i=1:iter     % 窗口大小 行
                for j=1:iter % 窗口大小 列                   
                    win(i,j)=proci((r+L(i)),(s+L(j))); % 获取窗口                  
                end
            end
            I=win; % 灰度矩阵
            win=win(c,c)-win; % 相对中心点处的强度差异，中心点为参考灰度值
            win=sqrt(win.^2); % 保证win中的每一个元素为正
            Gwi=exp(-(win.^2)/(2*(sigr^2))); % 高斯函数      
            weights=(Gwi.*Gwd)/sum(sum(Gwi.*Gwd)); % 高斯权值
            Ii=sum(sum(weights.*I));               % 得到当前双边滤波值  
            proci(r,s)=Ii;                         % 替换当前灰度值
            win=[];
    end
end

% 移除边界扩展值
proci=rpadd(proci,K);  % 移除边界扩展值
out=im2uint8(proci);   % 类型转换

%% 滤波重建后，图像峰值信噪比计算
if ~isa(out,'double')
    dimg = double(out)/255;   % 转换为double类型
end
psn = PSN(im,dimg); % PSNR,峰值信噪比
        
end

function x=rpadd(R,K)
% 移除边界扩展值
% 函数输入：
%         R    输入的图像矩阵
%         K    窗口大小(2*K + 1)
% 函数输出：
%         x    移除边界扩展值后的原图像矩阵
for i=1:K
    R(1,:)=[];
    R(:,1)=[];
    [ro cl]= size(R);
    R(ro,:)=[];
    R(:,cl)=[];;
end
x=R;
end

function [out]=PSN(orgimg,mimg)
% 峰值信噪比计算

orgimg =im2double(orgimg);
mimg   =im2double(mimg);
Mse=sum(sum((orgimg-mimg).^2))/(numel(orgimg)); % Mean square Error均方差
out=10*log10(1/Mse);
end   
  