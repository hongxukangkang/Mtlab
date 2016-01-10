function H = freqfilter_ideal(M,N,D0,W)
% ��������˲���
% input:
%     M,N:Ƶ���˲����ĳߴ�
%     D0�������˲����Ľ�ֹƵ��
%     W:����
% output:
%       H��M x N�ľ��󣬱�ʾƵ���˲���������������Ϊdouble��

u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
	H = double( or( D<(D0-W/2), D>(D0+W/2) ) );
end
