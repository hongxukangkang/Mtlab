function [thr,sorh,keepapp] = ddencmp_thr(dorc,worwp,x)
% 函数输入：
%         dorc: 'den'还是‘cmp’
%         worwp： 'wv'小波还是‘wp’小波包
%         x：输入图像二维矩阵
% 函数输出：
%         thr：阈值
%         sorh：软阈值‘s’还是硬阈值'h'
%         keepapp：常数1；
% 默认值
keepapp = 1; % keepapp=1时，表示保持低频图像系数不变，keepapp=0时，表示可以改变。
if isequal(dorc,'den') && isequal(worwp,'wv')
    sorh = 's';   % 软阈值门限
else
    sorh = 'h';   % 硬阈值门限
end

 % 最著名的阈值形式
n = numel(x);  % 一般为65536
% nominal threshold.
switch dorc
  case 'den'
    switch worwp
      case 'wv' , thr = sqrt(2*log(n));               % wavelets.
      case 'wp' , thr = sqrt(2*log(n*log(n)/log(2))); % wavelet packets.
    end
  case 'cmp' ,  thr = 1;
end
