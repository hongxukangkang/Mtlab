function im1 = kirsch_fspecial(im,type)
    if nargin < 2
        type = 'kirsch';
    end
    if ~isa(im,'double')
        im = double(im)/255;
    end
   switch type
       case 'kirsch'  % kirsch filter
        for dim=1:size(im,3)  % 维数，RGB或者灰度图像
            a = im(:,:,dim);
            b=[-5 3 3;   % 模板1
                -5 0 3;
                -5 3 3]/1512;
            c=[3 3 3;    % 模板2
                -5 0 3;
                -5 -5 3]/1512; 
            d=[3 3 3;    % 模板3
                3 0 3;
                -5 -5 -5]/1512;
            e=[3 3 3;    % 模板4
                3 0 -5;
                3 -5 -5]/1512; 
            f=[3 3 -5;   % 模板5
                3 0 -5;
                3 3 -5]/1512;
            g=[3 -5 -5;  % 模板6
                3 0 -5;
                3 3 3]/1512; 
            h=[-5 -5 -5; % 模板7
                3 0 3;
                3 3 3]/1512;
            i=[-5 -5 3;  % 模板8
                -5 0 3;
                3 3 3]/1512; 
            b=conv2(a,b,'same');b=abs(b);  % 卷积后求绝对值
            c=conv2(a,c,'same');c=abs(c);  % 卷积后求绝对值
            d=conv2(a,d,'same');d=abs(d);  % 卷积后求绝对值
            e=conv2(a,e,'same');e=abs(e);  % 卷积后求绝对值
            f=conv2(a,f,'same');f=abs(f);  % 卷积后求绝对值
            g=conv2(a,g,'same');g=abs(g);  % 卷积后求绝对值
            h=conv2(a,h,'same');h=abs(h);  % 卷积后求绝对值
            i=conv2(a,i,'same');i=abs(i);  % 卷积后求绝对值
            p=max(b,c);  % 取大值
            p=max(d,p);  % 取大值
            p=max(e,p);  % 取大值
            p=max(f,p);  % 取大值
            p=max(g,p);  % 取大值
            p=max(h,p);  % 取大值
            p=max(i,p);  % 取大值
            im1(:,:,dim) = double(p).*255;
        end
   end
end

