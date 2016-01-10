function H = freqfilter_gaussian(M,N,D0,W)
% ��˹�����˲���
% input:
%     ָ���˲��������͡�gaussian��
%     M,N:Ƶ���˲����ĳߴ�
%     D0�������˲����Ľ�ֹƵ��
% output:
%       H��M x N�ľ��󣬱�ʾƵ���˲���������������Ϊdouble��

u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
H = 1-exp(-(1/2).*((D.^2-D0^2)./(D.*W)).^2);
end