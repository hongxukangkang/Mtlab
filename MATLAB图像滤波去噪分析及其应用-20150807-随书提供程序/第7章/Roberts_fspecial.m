function im1 = Roberts_fspecial(im,type)
    if nargin < 2
        type = 'Roberts';
    end
    if ~isa(im,'double')
        im = double(im)/255;
    end
    [a, b] = size(im(:,:,1));  %行＼列
    im1(:,:,1) = zeros(a,b);  % R1
   switch type
       case 'Roberts'  % Roberts filter
          for i = 1:size(im,3)  % 矩阵的维数，3D（RGB图像） 或者 2D（灰度图像）
              for j=1:a-1  %　行数
                  for k=1:b-1 % 列数
                      im1(j,k,i) = abs( im(j+1,k+1,i)-im(j,k,i) ) + abs( im(j+1,k,i)-im(j,k+1,i) );
                  end
              end
          end
   end
end

           
           
           