function im1 = hsl2rgb(im)
% Convert HSL to sRGB
L = im(:,:,3);
Delta = im(:,:,2).*min(L,1-L);
im1 = huetorgb(L-Delta,L+Delta, im(:,:,1));
end

function Image = huetorgb(m0,m2,H)
% Convert HSV or HSL hue to RGB
N = size(H);
H = min(max(H(:),0),360)/60;
m0 = m0(:);
m2 = m2(:);
F = H - round(H/2)*2;
M = [m0, m0 + (m2-m0).*abs(F), m2];
Num = length(m0);
j = [2 1 0;1 2 0;0 2 1;0 1 2;1 0 2;2 0 1;2 1 0]*Num;
k = floor(H) + 1;
Image = reshape([M(j(k,1)+(1:Num).'),M(j(k,2)+(1:Num).'),M(j(k,3)+(1:Num).')],[N,3]);
end



