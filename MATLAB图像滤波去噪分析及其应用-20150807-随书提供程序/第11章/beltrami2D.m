function Fim = beltrami2D(im, num_iter, delta_t)
% beltrami滤波器   a NonLinear filter
% 函数输入:
%         im       - 灰度图像 (MxN).
%         num_iter - 迭代次数 
%         delta_t  - 时间步长
%               
% 函数输出:
%         Fim - (Filtered) image.

if ~isa(im,'double')
    im = double(im)/255;
end
% 梯度矩阵
hx=0.5.*[0 0 0; -1 0 1; 0 0 0]; % 水平 
hy=0.5.*[0 -1 0; 0 0 0; 0 1 0]; % 垂直
% 度量张量
hxx=[0 0 0; 1 -2 1; 0 0 0];% 水平
hyy=[0 1 0; 0 -2 0; 0 1 0];% 垂直
% xy
hxy=[1 0 -1; 0 0 0; -1 0 1];

Ik=im;  % 赋值

for i=1:num_iter
    
    Ixx=imfilter(Ik,hxx,'conv');% 滤波
    Iyy=imfilter(Ik,hyy,'conv');% 滤波
    Ix=imfilter(Ik,hx,'conv');  % 滤波
    Iy=imfilter(Ik,hy,'conv');  % 滤波
    Ixy=imfilter(Ik,hxy,'conv');% 滤波
%     对梯度下降方程积分
    Ikx=Ik+delta_t.*((Ixx.*(ones(size(Iy))+Iy.^2)+...
        Iyy.*(ones(size(Ix))+Ix.^2)-2.*Ix.*Iy.*Ixy)./(ones(size(Ix))+Ix.^2+Iy.^2).^2);
    Fim= Ikx;
    Ik = Ikx;
end

