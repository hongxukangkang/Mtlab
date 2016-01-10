function Fim = beltrami2D(im, num_iter, delta_t)
% beltrami�˲���   a NonLinear filter
% ��������:
%         im       - �Ҷ�ͼ�� (MxN).
%         num_iter - �������� 
%         delta_t  - ʱ�䲽��
%               
% �������:
%         Fim - (Filtered) image.

if ~isa(im,'double')
    im = double(im)/255;
end
% �ݶȾ���
hx=0.5.*[0 0 0; -1 0 1; 0 0 0]; % ˮƽ 
hy=0.5.*[0 -1 0; 0 0 0; 0 1 0]; % ��ֱ
% ��������
hxx=[0 0 0; 1 -2 1; 0 0 0];% ˮƽ
hyy=[0 1 0; 0 -2 0; 0 1 0];% ��ֱ
% xy
hxy=[1 0 -1; 0 0 0; -1 0 1];

Ik=im;  % ��ֵ

for i=1:num_iter
    
    Ixx=imfilter(Ik,hxx,'conv');% �˲�
    Iyy=imfilter(Ik,hyy,'conv');% �˲�
    Ix=imfilter(Ik,hx,'conv');  % �˲�
    Iy=imfilter(Ik,hy,'conv');  % �˲�
    Ixy=imfilter(Ik,hxy,'conv');% �˲�
%     ���ݶ��½����̻���
    Ikx=Ik+delta_t.*((Ixx.*(ones(size(Iy))+Iy.^2)+...
        Iyy.*(ones(size(Ix))+Ix.^2)-2.*Ix.*Iy.*Ixy)./(ones(size(Ix))+Ix.^2+Iy.^2).^2);
    Fim= Ikx;
    Ik = Ikx;
end

