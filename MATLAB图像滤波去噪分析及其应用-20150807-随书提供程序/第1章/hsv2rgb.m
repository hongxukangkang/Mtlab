function im1 = hsv2rgb(im)

H = im(:,:,1);  % H
S = im(:,:,2);  % S
V = im(:,:,3);  % V
im1 = huetorgb( (1-S).*V, V, H );

end

function Image = huetorgb(m0,m2,H)
% HSV / HSL ��ɫ�ռ䵽 RGB
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
