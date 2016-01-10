function h = sobel_fspecial(type)
    if nargin < 1
        type = 'sobel';
    end
   switch type
       case 'sobel'  % Sobel filter
        h = [1 2 1;
            0 0 0;
            -1 -2 -1];
   end
end
  