function Image = rgb2lch(Image)

    if size(Image,3) ~= 3
        error('im must have three color channels');
    end
    if ~isa(Image,'double')
        Image = double(Image)/255; 
    end

    % Convert to CIE L*ch
    Image = rgb2lab(Image);  % Convert to CIE L*ab
    H = atan2(Image(:,:,3),Image(:,:,2));
    H = H*180/pi + 360*(H < 0);
    Image(:,:,2) = sqrt(Image(:,:,2).^2 + Image(:,:,3).^2);  % C
    Image(:,:,3) = H;   
    
end
