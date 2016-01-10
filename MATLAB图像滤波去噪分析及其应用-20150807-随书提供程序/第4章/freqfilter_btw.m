function H = freqfilter_btw(M,N,D0,W,n)
% ������˹�����˲���
% input:
%     �˲��������ͣ���btw��
%     M,N:Ƶ���˲����ĳߴ�
%     D0�������˲����Ľ�ֹƵ��
%     n:������˹�˲����Ľ���
% output:
%       H��M xN�ľ��󣬱�ʾƵ���˲���������������Ϊdouble��
if nargin == 5
	n=1;
end
u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);

    H = 1./(1+(D*W./(D.^2-D0^2)).^(2*n));
end