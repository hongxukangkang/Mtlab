function canny_im = canny_fspecial(im,type)
    if nargin < 2
        type = 'canny';
    end
    if ~isa(im,'double')
        im = double(im)/255;
    end
   switch type
       case 'canny'  % canny filter

    r=im(:,:,1);g=im(:,:,2);b=im(:,:,3);
    % 平滑滤波器
    filter= [2 4 5 4 2;
             4 9 12 9 4;
             5 12 15 12 5;
             4 9 12 9 4;
             2 4 5 4 2];
    filter=filter/115;

    im_conv= convn(im,filter);  % 平滑滤波后图像

    % 计算梯度
    gradXfilt=[-1 0 1;   % 卷积模板convolution mask
               -2 0 2; 
               -1 0 1];
    gradYfilt=[1  2   1; % 卷积模板 convolution mask
               0  0   0; 
              -1  -2  -1];
    GradX= convn(im_conv,gradXfilt);  % 卷积
    GradY= convn(im_conv,gradYfilt);  % 卷积
    absgrad=abs(GradX)+abs(GradY);
    
    % 计算梯度角
    [a,b]=size(GradX);
    theta=zeros([a b]);
    for i=1:a
          for j=1:b
                if(GradX(i,j)==0)
                   theta(i,j)=atan(GradY(i,j)/1e-10);
                else
                    theta(i,j)=atan(GradY(i,j)/GradX(i,j));
                end
          end
     end
      theta=theta*(180/3.14);
      for i=1:a
          for j=1:b
                if(theta(i,j)<0)
                    theta(i,j)= theta(i,j)-90;
                    theta(i,j)=abs(theta(i,j));
                end
          end
     end
      for i=1:a
          for j=1:b
              if ((0<theta(i,j))&&(theta(i,j)<22.5))||((157.5<theta(i,j))&&(theta(i,j)<181))
                    theta(i,j)=0;
              elseif (22.5<theta(i,j))&&(theta(i,j)<67.5)
                     theta(i,j)=45;
              elseif (67.5<theta(i,j))&&(theta(i,j)<112.5)  
                      theta(i,j)=90;
              elseif (112.5<theta(i,j))&&(theta(i,j)<157.5)
                      theta(i,j)=135;
              end
          end
      end 

    % 非极大值抑制
    canny_im = padarray(absgrad, [1 1]);
% A = [1 2; 3 4];
% B = padarray(A,[3 2],'replicate','post')
% B =
%      1     2     2     2
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
%      3     4     4     4
    [a,b]=size(theta);
    for i=2:a-2
        for j=2:b-2
               if (theta(i,j)==135)
                     if ((canny_im(i-1,j+1)>canny_im(i,j))||(canny_im(i+1,j-1)>canny_im(i,j)))
                          canny_im(i,j)=0;
                      end
               elseif (theta(i,j)==45)   
                      if ((canny_im(i+1,j+1)>canny_im(i,j))||(canny_im(i-1,j-1)>canny_im(i,j)))
                           canny_im(i,j)=0;
                      end
               elseif (theta(i,j)==90)   
                      if ((canny_im(i,j+1)>canny_im(i,j))||(canny_im(i,j-1)>canny_im(i,j)))
                          canny_im(i,j)=0;
                      end
               elseif (theta(i,j)==0)   
                      if ((canny_im(i+1,j)>canny_im(i,j))||(canny_im(i-1,j)>canny_im(i,j)))
                          canny_im(i,j)=0;
                      end
               end
        end
    end

   end
end