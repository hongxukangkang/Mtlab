function Z = threddmean_filter(X,n,thred)
% ����������ͼ����г�������ƽ�����˲�
%  ��������
%        X�����˶�άͼ�����
%        n����Ĥ�ߴ�
%        thred����ֵ
%  �������
%        Z�����ͼ���������������������ͬ
if size(X,3)~=1
    error('ͼ��Ӧ��Ϊ2ά����')
end
if ~isa(X,'double')
    X = double(X)/255;  % �������� 
end
H = fspecial('average',n);    % ��ֵģ��
Y = imfilter(X, H);
thre = abs(X-Y)>thred;  % �ж���Щ������
Z = X;   % ��ֵ
Z(thre)=Y(thre);
Z = im2uint8(Z);  % ����ת��

end

