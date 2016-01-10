function [out, psn]=bif_filter(im,sigd,sigr)
% bilateral filter˫���˲���
% �������룺
%           im    �����ͼ��
%           sigd  �ռ��ں˵�ʱ�����
%           sigr  �ں˲���ǿ�ȱ仯��Χ
% ���������
%          out  �˲�ͼ�� = output imagespatial kernel

 w=(2*sigd)+1;
% sigr=(n*100)^2/(.003*(sigd^2));  % ����ӦRֵ��nΪ��˹����ǿ��,n=0.001
 
% ��˹�˲��� 
gw=zeros(w,w);       % ��˹Ȩֵ�����ʼ��
c=ceil(w/2);         % ��ǰȡ��
c=[c c];             % ����Ԫ��λ��

for i=1:w    
    for j=1:w
        q=[i,j]; % ��¼��������λ�ñ�ʶλ
        gw(i,j)=norm(c-q); % ŷ�Ͼ���
    end
end

Gwd=(exp(-(gw.^2)/(2*(sigd^2)))); % ��˹����

% Padding ��չͼ��ı߽磬��ֹ�������ڱ߽�ֵ���
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
    proci = double(proci)/255;   % ת��Ϊdouble����
end

K=sigd;
L=[-K:K];
c=K+1;   % ����Ԫ��λ��
iter=length(L); % ��������
ind=1;

for r=(1+K):(row-K)          % ��    
    for s=(1+K):(clm-K)      % ��     
            for i=1:iter     % ���ڴ�С ��
                for j=1:iter % ���ڴ�С ��                   
                    win(i,j)=proci((r+L(i)),(s+L(j))); % ��ȡ����                  
                end
            end
            I=win; % �ҶȾ���
            win=win(c,c)-win; % ������ĵ㴦��ǿ�Ȳ��죬���ĵ�Ϊ�ο��Ҷ�ֵ
            win=sqrt(win.^2); % ��֤win�е�ÿһ��Ԫ��Ϊ��
            Gwi=exp(-(win.^2)/(2*(sigr^2))); % ��˹����      
            weights=(Gwi.*Gwd)/sum(sum(Gwi.*Gwd)); % ��˹Ȩֵ
            Ii=sum(sum(weights.*I));               % �õ���ǰ˫���˲�ֵ  
            proci(r,s)=Ii;                         % �滻��ǰ�Ҷ�ֵ
            win=[];
    end
end

% �Ƴ��߽���չֵ
proci=rpadd(proci,K);  % �Ƴ��߽���չֵ
out=im2uint8(proci);   % ����ת��

%% �˲��ؽ���ͼ���ֵ����ȼ���
if ~isa(out,'double')
    dimg = double(out)/255;   % ת��Ϊdouble����
end
psn = PSN(im,dimg); % PSNR,��ֵ�����
        
end

function x=rpadd(R,K)
% �Ƴ��߽���չֵ
% �������룺
%         R    �����ͼ�����
%         K    ���ڴ�С(2*K + 1)
% ���������
%         x    �Ƴ��߽���չֵ���ԭͼ�����
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
% ��ֵ����ȼ���

orgimg =im2double(orgimg);
mimg   =im2double(mimg);
Mse=sum(sum((orgimg-mimg).^2))/(numel(orgimg)); % Mean square Error������
out=10*log10(1/Mse);
end   
  