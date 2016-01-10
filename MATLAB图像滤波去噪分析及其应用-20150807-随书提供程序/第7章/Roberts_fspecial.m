function im1 = Roberts_fspecial(im,type)
    if nargin < 2
        type = 'Roberts';
    end
    if ~isa(im,'double')
        im = double(im)/255;
    end
    [a, b] = size(im(:,:,1));  %�У���
    im1(:,:,1) = zeros(a,b);  % R1
   switch type
       case 'Roberts'  % Roberts filter
          for i = 1:size(im,3)  % �����ά����3D��RGBͼ�� ���� 2D���Ҷ�ͼ��
              for j=1:a-1  %������
                  for k=1:b-1 % ����
                      im1(j,k,i) = abs( im(j+1,k+1,i)-im(j,k,i) ) + abs( im(j+1,k,i)-im(j,k+1,i) );
                  end
              end
          end
   end
end

           
           
           