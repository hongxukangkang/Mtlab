function p= cauchypdf(x, varargin)
    % Default values
    a =	0.0;
    b =	1.0;
    % Check the arguments
    if(nargin >= 2)
        a=	varargin{1};
        if(nargin == 3)
            b=			varargin{2};
            b(b <= 0)=	NaN;	% Make NaN of out of range values.
        end
    end
    if((nargin < 1) || (nargin > 3))
        error('At least one argument, at most three!');
    end
    % Calculate
    p =	b./(pi*(b.^2 + (x-a).^2));
end
