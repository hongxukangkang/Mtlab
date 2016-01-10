function im1 = kirsch_fspecial(im,type)
    if nargin < 2
        type = 'kirsch';
    end
    if ~isa(im,'double')
        im = double(im)/255;
    end
   switch type
       case 'kirsch'  % kirsch filter
        for dim=1:size(im,3)  % ά����RGB���߻Ҷ�ͼ��
            a = im(:,:,dim);
            b=[-5 3 3;   % ģ��1
                -5 0 3;
                -5 3 3]/1512;
            c=[3 3 3;    % ģ��2
                -5 0 3;
                -5 -5 3]/1512; 
            d=[3 3 3;    % ģ��3
                3 0 3;
                -5 -5 -5]/1512;
            e=[3 3 3;    % ģ��4
                3 0 -5;
                3 -5 -5]/1512; 
            f=[3 3 -5;   % ģ��5
                3 0 -5;
                3 3 -5]/1512;
            g=[3 -5 -5;  % ģ��6
                3 0 -5;
                3 3 3]/1512; 
            h=[-5 -5 -5; % ģ��7
                3 0 3;
                3 3 3]/1512;
            i=[-5 -5 3;  % ģ��8
                -5 0 3;
                3 3 3]/1512; 
            b=conv2(a,b,'same');b=abs(b);  % ����������ֵ
            c=conv2(a,c,'same');c=abs(c);  % ����������ֵ
            d=conv2(a,d,'same');d=abs(d);  % ����������ֵ
            e=conv2(a,e,'same');e=abs(e);  % ����������ֵ
            f=conv2(a,f,'same');f=abs(f);  % ����������ֵ
            g=conv2(a,g,'same');g=abs(g);  % ����������ֵ
            h=conv2(a,h,'same');h=abs(h);  % ����������ֵ
            i=conv2(a,i,'same');i=abs(i);  % ����������ֵ
            p=max(b,c);  % ȡ��ֵ
            p=max(d,p);  % ȡ��ֵ
            p=max(e,p);  % ȡ��ֵ
            p=max(f,p);  % ȡ��ֵ
            p=max(g,p);  % ȡ��ֵ
            p=max(h,p);  % ȡ��ֵ
            p=max(i,p);  % ȡ��ֵ
            im1(:,:,dim) = double(p).*255;
        end
   end
end

