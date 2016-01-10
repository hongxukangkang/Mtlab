function DeNimg = Non_Local_Means(Nimg,PSH,WSH,Sigma)
% Non_Local_Means�˲���
%��������: 
%         Nimg:  �����ͼ����� + ��������
%         PSH:  ��չ���ߴ��С
%         WSH: ���ߴ��С
%         Sigma������
%�������: 
%         DeNimg: �ع��˲�ͼ��

if ~isa(Nimg,'double')
    Nimg = double(Nimg)/255;
end

% ͼ��ά��
[Height,Width] = size(Nimg);
u = zeros(Height,Width); % ��ʼ��ȥ��ͼ�����
M = u; % ��ʼ��Ȩֵ����
Z = M; % ��ʼ������Ȩֵ accumlated weights
% ����߽�ЧӦ
PP = padarray(Nimg,[PSH,PSH],'symmetric','both');
PW = padarray(Nimg,[WSH,WSH],'symmetric','both');
% padarrayʹ��
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
% ��ѭ��
for dx = -WSH:WSH
    for dy = -WSH:WSH
        if dx ~= 0 || dy ~= 0
            Sd = integral_img(PP,dx,dy);  % ��ֵͼ��
            % ��ȡ��Ӧ���ص��ƽ�������
            SDist = Sd(PSH+1:end-PSH,PSH+1:end-PSH)+Sd(1:end-2*PSH,1:end-2*PSH)-Sd(1:end-2*PSH,PSH+1:end-PSH)-Sd(PSH+1:end-PSH,1:end-2*PSH);       
            % ����ÿһ�����ص��Ȩֵ
            w = exp(-SDist/(2*Sigma^2));
            % �õ���Ӧ��������
            v = PW((WSH+1+dx):(WSH+dx+Height),(WSH+1+dy):(WSH+dy+Width));
            % ����ȥ��ͼ�����
            u = u+w.*v;
            % ����Ȩֵȥ��ͼ�����
            M = max(M,w);
            % ���µ���Ȩֵ accumlated weights
            Z = Z+w;
        end
    end
end
% �ع�ͼ��        
f = 1;
u = u+f*M.*Nimg;
u = u./(Z+f*M);
DeNimg = u; % �ع�ȥ��ͼ��

function Sd = integral_img(v,dx,dy)
% ����ƽ�����ֵͼ��
% �任���㣺tx = vx+dx; ty = vy+dy
t = img_Shift(v,dx,dy);
% ƽ����ͼ��
diff = (v-t).^2;
% ���в�ֵ
Sd = cumsum(diff,1);  % �е���
% ���в�ֵ
Sd = cumsum(Sd,2);    % �е���

function t = img_Shift(v,dx,dy)
% ��xy����ϵ�£�����ͼ��任����
t = zeros(size(v));
type = (dx>0)*2+(dy>0);
switch type
    case 0 % dx<0,dy<0: �����·��ƶ�
        t(-dx+1:end,-dy+1:end) = v(1:end+dx,1:end+dy);
    case 1 % dx<0,dy>0: �����·��ƶ�
        t(-dx+1:end,1:end-dy) = v(1:end+dx,dy+1:end);
    case 2 % dx>0,dy<0: �����Ϸ��ƶ�
        t(1:end-dx,-dy+1:end) = v(dx+1:end,1:end+dy);
    case 3 % dx>0,dy>0: �����Ϸ��ƶ�
        t(1:end-dx,1:end-dy) = v(dx+1:end,dy+1:end);
end

