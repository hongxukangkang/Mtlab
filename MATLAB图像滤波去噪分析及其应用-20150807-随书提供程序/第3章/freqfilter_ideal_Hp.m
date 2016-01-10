function H = freqfilter_ideal_Hp(M,N,D0)
% ÀíÏë¸ßÍ¨ÂË²¨Æ÷
% input:
%     M,N:ÆµÓòÂË²¨Æ÷µÄ³ß´ç
%     D0£º´ø×èÂË²¨Æ÷µÄ½ØÖ¹ÆµÂÊ
% output:
%       H£ºM x NµÄ¾ØÕó£¬±íÊ¾ÆµÓòÂË²¨Æ÷¾ØÕó£¬Êı¾İÀàĞÍÎªdouble£¬
u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
H = double(D>=D0);
end
