function DeNimg = Non_Local_Means(Nimg,PSH,WSH,Sigma)
% Non_Local_Means滤波器
%函数输入: 
%         Nimg:  输入的图像矩阵 + 带噪声的
%         PSH:  扩展窗尺寸大小
%         WSH: 窗尺寸大小
%         Sigma：方差
%函数输出: 
%         DeNimg: 重构滤波图像

if ~isa(Nimg,'double')
    Nimg = double(Nimg)/255;
end

% 图像维数
[Height,Width] = size(Nimg);
u = zeros(Height,Width); % 初始化去噪图像矩阵
M = u; % 初始化权值矩阵
Z = M; % 初始化叠加权值 accumlated weights
% 避免边界效应
PP = padarray(Nimg,[PSH,PSH],'symmetric','both');
PW = padarray(Nimg,[WSH,WSH],'symmetric','both');
% padarray使用
% A =
%      1     3     4
%      2     3     4
%      3     4     5
% B = padarray(A, 2 * [1 1], 0, 'both')
%      0     0     0     0     0     0     0
%      0     0     0     0     0     0     0
%      0     0     1     3     4     0     0
%      0     0     2     3     4     0     0
%      0     0     3     4     5     0     0
%      0     0     0     0     0     0     0
%      0     0     0     0     0     0     0
% 主循环
for dx = -WSH:WSH
    for dy = -WSH:WSH
        if dx ~= 0 || dy ~= 0
            Sd = integral_img(PP,dx,dy);  % 插值图像
            % 获取对应像素点的平方差矩阵
            SDist = Sd(PSH+1:end-PSH,PSH+1:end-PSH)+Sd(1:end-2*PSH,1:end-2*PSH)-Sd(1:end-2*PSH,PSH+1:end-PSH)-Sd(PSH+1:end-PSH,1:end-2*PSH);       
            % 计算每一个像素点的权值
            w = exp(-SDist/(2*Sigma^2));
            % 得到相应的噪声点
            v = PW((WSH+1+dx):(WSH+dx+Height),(WSH+1+dy):(WSH+dy+Width));
            % 更新去噪图像矩阵
            u = u+w.*v;
            % 更新权值去噪图像矩阵
            M = max(M,w);
            % 更新叠加权值 accumlated weights
            Z = Z+w;
        end
    end
end
% 重构图像        
f = 1;
u = u+f*M.*Nimg;
u = u./(Z+f*M);
DeNimg = u; % 重构去噪图像

function Sd = integral_img(v,dx,dy)
% 根据平方差，插值图像
% 变换计算：tx = vx+dx; ty = vy+dy
t = img_Shift(v,dx,dy);
% 平方差图像
diff = (v-t).^2;
% 沿行插值
Sd = cumsum(diff,1);  % 行叠加
% 沿列插值
Sd = cumsum(Sd,2);    % 列叠加

function t = img_Shift(v,dx,dy)
% 在xy坐标系下，进行图像变换操作
t = zeros(size(v));
type = (dx>0)*2+(dy>0);
switch type
    case 0 % dx<0,dy<0: 向右下方移动
        t(-dx+1:end,-dy+1:end) = v(1:end+dx,1:end+dy);
    case 1 % dx<0,dy>0: 向左下方移动
        t(-dx+1:end,1:end-dy) = v(1:end+dx,dy+1:end);
    case 2 % dx>0,dy<0: 向右上方移动
        t(1:end-dx,-dy+1:end) = v(dx+1:end,1:end+dy);
    case 3 % dx>0,dy>0: 向左上方移动
        t(1:end-dx,1:end-dy) = v(dx+1:end,dy+1:end);
end

