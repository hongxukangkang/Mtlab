function [imgOutput, nIter, dtt] = NCD_filter(imgInput, Tmax)
%�������Ը���ɢ�˲�
% �������룺
%        imgInput - ��������ͼ��
%        Tmax  - ��ɢʱ��
% �������:
%        imgOutput - f�����Ը���ɢ�˲�ͼ��
%        nIter  - �˲������������
%        dtt    - ÿһ�ε�����ʱ�䲽��
% �趨Ĭ�ϵĵ�����ɢʱ��
if nargin < 2 ;   % �������С��2
    Tmax  = 3.0 ; % TmaxĬ�ϸ�ֵ
end 

% ��ʼ������
theta     = pi/30;           % ��ʼ��
j         = sqrt(-1);        % ��ʼ��
e_jxtheta = exp(j*theta);    % ��ʼ��
kappamin  =   2.0;           % ��ʼ��
kappamax  =  28.0;           % ��ʼ��

% ��˹�˲���
wsize     = 3;  % ���ڴ�С 3 x 3
wsigma    = 10; % ����
filter_gaussian    = fspecial('gaussian', wsize, wsigma);  % �˲���ģ
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
% ��ɢ�˲���ϵ��
wsigma2    = 0.5; % ����
filter_gaussian2  = fspecial('gaussian', wsize, wsigma2);  % �˲���ģ

lapKernel      = [0,1,0; 1,-4,1; 0,1,0]; % laplacian kernel
gradKernel     = [-1/2,0,1/2];          % �ݶ�kernel
[xSize, ySize] = size(imgInput);         % ͼ��ά��

Border = 2; % ͼ��߽�2�����ص�֮�䲻�����ݶȼ���
indexX = 1+Border:xSize+Border; % (1+Border):(xSize+Border)
indexY = 1+Border:ySize+Border; % (1+Border):(xSize+Border)

if ~isa(imgInput,'double')
    yNCDF = double(imgInput); % ͼ����������ת��
end

t_iter = 0;  % ����ʱ���ۼӺ�
nIter = 0;  % ��������

while (Tmax - t_iter) > eps % ��ɢʱ��
    nIter = nIter + 1;
    ryNCDF = real(yNCDF);  % ʵ��
    iyNCDF = imag(yNCDF);  % �鲿
    
    % �˲�,�����ʽ��10.32��
    localAvg = filter2(filter_gaussian, ryNCDF, 'same');
    minlocalAvg = min(localAvg(:));   % ��Сֵ
    
    % ����Ӧϵ�� k�������ʽ��10.31��
    k_mod = kappamax + (kappamin-kappamax)* ...
        (localAvg - minlocalAvg) / (max(localAvg(:)) - minlocalAvg);
    % �����Ը���ɢ����
    coefDif = e_jxtheta ./ (1 + ( (iyNCDF/theta) ./ k_mod ).^2);
    coefDif = filter2(filter_gaussian, coefDif, 'same');

    % ���� laplacian and gradient
    % lap(yNCDF)
    yAux  = zeros(xSize+2*Border, ySize+2*Border);
    yAux(indexX, indexY) = yNCDF;
    del2Y = conv2(yAux, lapKernel, 'same');
    del2Y = del2Y(indexX, indexY);
    
    % grad(yNCDF)
    dAux  = conv2(yAux, gradKernel, 'same');  % ���
    dYx   = dAux(indexX, indexY);
    dAux  = conv2(yAux, gradKernel', 'same'); % ���
    dYy   = dAux(indexX, indexY);
    
    % grad(coefDif)
    dDx   = conv2(coefDif, gradKernel, 'same');  % ���
    dDy   = conv2(coefDif, gradKernel', 'same'); % ���
    
    dIdt  = coefDif.*del2Y + dDx.*dYx + dDy.*dYy;
    
    % ��������Ӧʱ�䲽��
    dt = (1/4)*( 0.25 + 0.75*exp(- max(max( abs(real(dIdt)) ./ ryNCDF ))) );
    
    dtt(nIter) = dt;
    
    % Լ��ÿһ������󲽳�
    if t_iter + dt > Tmax ;
        dt = Tmax - t_iter ; 
    end
    % �����Ѿ������Ѿ���ɢ��ʱ������
    t_iter = t_iter + dt;
    
    % ���� yNCDF
    yNCDF = yNCDF + dt.*dIdt;
    
end % ��������Ӧwhile (Tmax - t_iter) > eps

imgOutput = real(yNCDF);  % ʵ����ͼ�����

end
