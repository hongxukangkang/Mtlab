function im_e = Homom_filter(im,d,rL,rH)
% ̬ͬ�˲�
%��������: 
%         im:  ����Ķ�άͼ�����
%         d:   ��ֹƵ��
%         rL   ��Ƶ����
%         rH   ��Ƶ����
%�������: 
%         im_e: �ع��˲�ͼ��

if ~isa(im,'double')
    im = double(im);
end

[r c]=size(im); % ����ͼ��ά��
% ��˹��ͨ�˲�
A=zeros(r,c);
for i=1:r
    for j=1:c
        A(i,j)=(((i-r/2).^2+(j-c/2).^2)).^(.5);
        B(i,j)=A(i,j)*A(i,j);
        H(i,j)=(1-exp(-((B(i,j)).^2/d.^2)));  % ���ݺ���
    end
end

% ̬ͬ�˲������ݺ�����
H=((rH-rL).*H)+rL;
% ȡ����
im_l=log2(im + 1e-5);
% ��ɢ����Ҷ�任
im_f=fft2(im_l);
% �˲�
im_nf=H.*im_f;
% DFT���任
im_n=abs(ifft2(im_nf));
% ָ���任������ȡ����
im_e = exp(im_n);  % �˲�����
im_e = uint8(im_e);
