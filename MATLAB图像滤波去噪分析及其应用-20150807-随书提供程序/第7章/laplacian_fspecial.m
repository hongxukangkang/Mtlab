function h = laplacian_fspecial(type,p2)
    if nargin < 2
        type = 'laplacian';
        p2 = 1/5;    % alpha
    end
   switch type
       case 'laplacian'  % laplacian filter
         alpha = p2;
         alpha = max(0,min(alpha,1));
         h1    = alpha/(alpha+1); 
         h2 = (1-alpha)/(alpha+1);
         h     = [h1 h2 h1;
             h2 -4/(alpha+1) h2;
             h1 h2 h1];
   end
end

