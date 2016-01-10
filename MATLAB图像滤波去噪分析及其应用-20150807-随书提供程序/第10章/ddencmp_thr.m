function [thr,sorh,keepapp] = ddencmp_thr(dorc,worwp,x)
% �������룺
%         dorc: 'den'���ǡ�cmp��
%         worwp�� 'wv'С�����ǡ�wp��С����
%         x������ͼ���ά����
% ���������
%         thr����ֵ
%         sorh������ֵ��s������Ӳ��ֵ'h'
%         keepapp������1��
% Ĭ��ֵ
keepapp = 1; % keepapp=1ʱ����ʾ���ֵ�Ƶͼ��ϵ�����䣬keepapp=0ʱ����ʾ���Ըı䡣
if isequal(dorc,'den') && isequal(worwp,'wv')
    sorh = 's';   % ����ֵ����
else
    sorh = 'h';   % Ӳ��ֵ����
end

 % ����������ֵ��ʽ
n = numel(x);  % һ��Ϊ65536
% nominal threshold.
switch dorc
  case 'den'
    switch worwp
      case 'wv' , thr = sqrt(2*log(n));               % wavelets.
      case 'wp' , thr = sqrt(2*log(n*log(n)/log(2))); % wavelet packets.
    end
  case 'cmp' ,  thr = 1;
end
