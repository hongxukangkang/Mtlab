function Image = rgb2lab(Image)
    if size(Image,3) ~= 3
        error('im must have three color channels');
    end
    if ~isa(Image,'double')
        Image = double(Image)/255; 
    end
    
   % Undo gamma correction
   R = invgammacorrection(Image(:,:,1));
   G = invgammacorrection(Image(:,:,2));
   B = invgammacorrection(Image(:,:,3));
   % Convert RGB to XYZ
   T = inv([3.2406, -1.5372, -0.4986; -0.9689, 1.8758, 0.0415; 0.0557, -0.2040, 1.057]);
   Image(:,:,1) = T(1)*R + T(4)*G + T(7)*B;  % X 
   Image(:,:,2) = T(2)*R + T(5)*G + T(8)*B;  % Y
   Image(:,:,3) = T(3)*R + T(6)*G + T(9)*B;  % Z
   
   % Convert XYZ to CIE L*a*b*   
   WhitePoint = [0.950456,1,1.088754];
   X = Image(:,:,1)/WhitePoint(1);
   Y = Image(:,:,2)/WhitePoint(2);
   Z = Image(:,:,3)/WhitePoint(3);
   fX = f(X);
   fY = f(Y);
   fZ = f(Z);
   Image(:,:,1) = 116*fY - 16;    % L*
   Image(:,:,2) = 500*(fX - fY);  % a*
   Image(:,:,3) = 200*(fY - fZ);  % b*
   
end

function R = invgammacorrection(Rp)
    R = zeros(size(Rp));
    i = (Rp <= 0.0404482362771076);
    R(i) = Rp(i)/12.92;
    R(~i) = real(((Rp(~i) + 0.055)/1.055).^2.4);
end

function fY = f(Y)
    fY = real(Y.^(1/3));
    i = (Y < 0.008856);
    fY(i) = Y(i)*(841/108) + (4/29);
end

function Y = invf(fY)
    Y = fY.^3;
    i = (Y < 0.008856);
    Y(i) = (fY(i) - 4/29)*(108/841);
end



