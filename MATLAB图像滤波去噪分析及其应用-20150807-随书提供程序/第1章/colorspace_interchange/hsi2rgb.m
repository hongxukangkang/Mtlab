function im1 = hsi2rgb(im)
% Convert HSI to sRGB
if ~isa(im,'double')
    im = double(im)/255; 
end

h = im(:,:,1);
s = im(:,:,2);
i = im(:,:,3);

for k=1:size(h,1)
    for j=1:size(h,2)
        if h(k,j)<2*pi/3
            x(k,j) = i(k,j).*(1-s(k,j));
            y(k,j) = i(k,j).*(1+ s(k,j).*cos(h(k,j))/cos(pi/3-h(k,j)));
            z(k,j) = 3*i(k,j)-(x(k,j)+y(k,j));
            r(k,j)=y(k,j);
            g(k,j)=z(k,j);
            b(k,j)=x(k,j);
        elseif h(k,j)>=2*pi/3 && h(k,j)<4*pi/3
            h(k,j) = h(k,j)-2*pi/3;
            x(k,j) = i(k,j).*(1-s(k,j));
            y(k,j) = i(k,j).*(1+ s(k,j).*cos(h(k,j))/cos(pi/3-h(k,j)));
            z(k,j) = 3*i(k,j)-(x(k,j)+y(k,j));
            r(k,j)=x(k,j);
            g(k,j)=y(k,j);
            b(k,j)=z(k,j);
        elseif h(k,j)>=4*pi/3 && h(k,j)<2*pi
            h(k,j) = h(k,j)-4*pi/3;
            x(k,j) = i(k,j).*(1-s(k,j));
            y(k,j) = i(k,j).*(1+ s(k,j).*cos(h(k,j))/cos(pi/3-h(k,j)));
            z(k,j) = 3*i(k,j)-(x(k,j)+y(k,j));
            r(k,j)=z(k,j);
            g(k,j)=x(k,j);
            b(k,j)=y(k,j);
        end
    end
end
im1(:,:,1) = r;
im1(:,:,2) = g;
im1(:,:,3) = b;

end