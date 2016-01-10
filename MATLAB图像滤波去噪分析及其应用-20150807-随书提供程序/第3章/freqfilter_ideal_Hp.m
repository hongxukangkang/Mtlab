function H = freqfilter_ideal_Hp(M,N,D0)
% �����ͨ�˲���
% input:
%     M,N:Ƶ���˲����ĳߴ�
%     D0�������˲����Ľ�ֹƵ��
% output:
%       H��M x N�ľ��󣬱�ʾƵ���˲���������������Ϊdouble��
u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
H = double(D>=D0);
end
