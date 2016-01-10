function Z = adapmedian_filter(X, Smax)
% ����������ͼ��������򴰿ڴ�С�ɱ������Ӧ��ֵ�˲�
%  ��������
%        X�����˶�άͼ�����
%        smax����ֵ�˲������յ����ֵ�������Ǵ���1������
%  �������
%        Z�����ͼ���������������������ͬ
% smax�����Ǵ���1������
if (Smax<=1) | (Smax/2 == round(Smax/2)) | (Smax ~= round(Smax))
    error('smax�����Ǵ���1������')
end
if size(X,3)~=1
    error('ͼ��Ӧ��Ϊ2ά����')
end
if ~isa(X,'double')
    X = double(X)/255;  % �������� 
end
[M, N] = size(X);
% ��ʼ��
Z = X;  Z(:)=0;
LevelA = false(size(X));   % ��ʼ����ͬX�� ȫ0�߼�����
% ��ʼ�˲�
for k=3:2:Smax
    Zmin = ordfilt2(X,1,ones(k,k),'symmetric' );   % �����˲�
    Zmax = ordfilt2(X,k*k,ones(k,k), 'symmetric'); % �����˲�
    Zmed = medfilt2(X,[k,k], 'symmetric');         % ��ֵ�˲�
    % �ж��Ƿ����B��
    LevelB = (Zmed>Zmin)&(Zmax>Zmed)&LevelA;  % �ж�A��
    ZB = (X > Zmin) & (Zmax > X);
    outputZxy = LevelB & ZB;    % ������
    outputZmed = LevelB & ~ZB;  % ������
    Z(outputZxy) = X(outputZxy);            % ��ֵ
    Z(outputZmed) = Zmed(outputZmed);       % ��ֵ
    LevelA = LevelA  | LevelB; % ������
    if all(LevelA(:))
        break;
    end
end
Z(~LevelA) = Zmed(~LevelA); % ��ֵ
Z = im2uint8(Z);  % ����ת��
end
