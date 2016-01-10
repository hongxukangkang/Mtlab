function h = prewitt_fspecial(type)
    if nargin < 1
        type = 'prewitt';
    end
   switch type
       case 'prewitt'  % prewitt filter
        h = [1 1 1;
            0 0 0;
            -1 -1 -1];
   end
end
  
