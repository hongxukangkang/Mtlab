function im1 = rgb2hsv(im)
    im = double(im)/255;
    V = max(im,[],3);
    S = (V - min(im,[],3))./(V + (V == 0));
    im1(:,:,1) = rgbtohue(im);
    im1(:,:,2) = S;
    im1(:,:,3) = V;
%     im1 = im2uint8(im);  % 类型转换
end

function H = rgbtohue(Image)
    % Convert RGB to HSV or HSL hue 色度H计算
    [M,i] = sort(Image,3);
    i = i(:,:,3);
    Delta = M(:,:,3) - M(:,:,1);
    Delta = Delta + (Delta == 0);
    R = Image(:,:,1);
    G = Image(:,:,2);
    B = Image(:,:,3);
    H = zeros(size(R));
    k = (i == 1);
    H(k) = (G(k) - B(k))./Delta(k);
    k = (i == 2);
    H(k) = 2 + (B(k) - R(k))./Delta(k);
    k = (i == 3);
    H(k) = 4 + (R(k) - G(k))./Delta(k);
    H = 60*H + 360*(H < 0);
    H(Delta == 0) = nan;
end