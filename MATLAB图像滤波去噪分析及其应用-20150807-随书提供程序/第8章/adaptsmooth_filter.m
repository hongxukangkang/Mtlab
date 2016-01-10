function Z = adaptsmooth_filter(X,mn)
% ����������Ķ�άͼ������������Ӧƽ���˲�
% input��
%        X������Ķ�άͼ�����
%        m��m�е��˲�ģ��
%        n��n�е��˲�ĩ��
% output: 
%        Z�������m x n�Ķ�άͼ������������
if nargin < 2
    m = 3;  % �˲�ģ��ߴ�
    n = 3;
end
if size(X,3)~=1
    error('ͼ��Ӧ��Ϊ2ά����')
end
if ~isa(X,'double')
    X = double(X)/255;  % �������� 
end
m = mn(1);  n = mn(2);  % ģ���С
[n1,n2] =size(X);
X(n1:n1+m, n2:n2+n) = 0;   % ���䣬ʹ��ͼ���ܹ���m x nģ��ȫ������
% ������Ĥϵ��
for i =1:size(X,1)-m
    for j=1:size(X,2)-n
        H = zeros(m,n);   % ��ʼ��
        for k=1:m
            for l=1:n
                Gx = 0.5* ( X(k+i,l) - X(k+i-1,l) );
                Gy = 0.5* ( X(k,l+j) - X(k,l+j-1) );
                d = sqrt(Gx^2 + Gy^2);
                H(k,l) = exp(-d/2);
            end
        end
        % ��������ۼ�ֵ
        Z = H.*X(i:m+i-1,j:n+j-1);  
        % ��һ��
        im1(i,j) = im2uint8( sum(Z(:))/sum(H(:)) );
    end
end
Z = im1(1:n1,1:n2); % ȥ�����Ե���ӵ�����

end

