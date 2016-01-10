function Image = lab2rgb(Image)
    if size(Image,3) ~= 3
        error('im must have three color channels');
    end
    if ~isa(Image,'double')
        Image = double(Image)/255; 
    end
    
   % Convert to CIE L*a*b* (CIELAB)
   WhitePoint = [0.950456,1,1.088754];
   % Convert CIE L*ab to XYZ
   fY = (Image(:,:,1) + 16)/116;
   fX = fY + Image(:,:,2)/500;
   fZ = fY - Image(:,:,3)/200;
   Image(:,:,1) = WhitePoint(1)*invf(fX);  % X
   Image(:,:,2) = WhitePoint(2)*invf(fY);  % Y
   Image(:,:,3) = WhitePoint(3)*invf(fZ);  % Z
   
    % Convert XYZ to RGB
   T = [3.2406, -1.5372, -0.4986; -0.9689, 1.8758, 0.0415; 0.0557, -0.2040, 1.057];
   R = T(1)*Image(:,:,1) + T(4)*Image(:,:,2) + T(7)*Image(:,:,3);  % R
   G = T(2)*Image(:,:,1) + T(5)*Image(:,:,2) + T(8)*Image(:,:,3);  % G
   B = T(3)*Image(:,:,1) + T(6)*Image(:,:,2) + T(9)*Image(:,:,3);  % B
   % Desaturate and rescale to constrain resulting RGB values to [0,1]   
   AddWhite = -min(min(min(R,G),B),0);
   R = R + AddWhite;
   G = G + AddWhite;
   B = B + AddWhite;
   % Apply gamma correction to convert linear RGB to sRGB
   Image(:,:,1) = gammacorrection(R);  % R'
   Image(:,:,2) = gammacorrection(G);  % G'
   Image(:,:,3) = gammacorrection(B);  % B'

end

function Y = invf(fY)
Y = fY.^3;
i = (Y < 0.008856);
Y(i) = (fY(i) - 4/29)*(108/841);
end

function Rp = gammacorrection(R)
Rp = zeros(size(R));
i = (R <= 0.0031306684425005883);
Rp(i) = 12.92*R(i);
Rp(~i) = real(1.055*R(~i).^0.416666666666666667 - 0.055);
end
