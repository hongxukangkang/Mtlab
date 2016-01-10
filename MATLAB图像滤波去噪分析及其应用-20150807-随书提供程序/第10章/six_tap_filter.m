function A_interp_pic = six_tap_filter(A, filter_coef)
% ����ͷ��ֵ�˲�
% ��������:    A: ����ͼ��
%             filter_coef: �˲���ϵ��
% �������:   
%             A_interp_pic:  ����ͷ��ֵ�˲�ͼ��

if (length(size(A)) == 3)
% �������ͼ��Ϊ3D���飬���ظ���ֵ�˲�3��
    for i=1:3
        A_interp_pic(:,:,i) = Bilinear_Filter_interp(A(:,:,i),filter_coef);
    end
    
else
    [m,n] = size(A);       % ������
    % ��ʼ��
    A1 = [];           % ��ʼ��
    A_interp_pic = []; % ��ʼ��
    % �в�ֵ
    A_col= filter2(filter_coef,A);       % �˲�
    for i=1:n
        A1 = [A1,A(:,i),A_col(:,i)];
    end
    A1(:,end) = [];    % ȥ��Ե
    % �в�ֵ
    A_rows = filter2(filter_coef,A1')';  % �˲�
    for i=1:m
        A_interp_pic = [A_interp_pic; A1(i,:); A_rows(i,:)];
    end
    A_interp_pic(end,:) = []; % ȥ��Ե
    
end

