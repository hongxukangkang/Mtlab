function H = freqfilter_ideal_sink(M,N,u0,v0,D0)
% �����ݲ��˲���
% input:
%     M,N:Ƶ���˲����ĳߴ�
%     u0,v0��Ƶ����ֹ��
%     D0�������˲����Ľ�ֹƵ��
% output:
%       H��M x N�ľ��󣬱�ʾƵ���˲���������������Ϊdouble��
u = -M/2:M/2-1;
v = -N/2:N/2-1;
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
D1 = sqrt( (U-u0).^2 + (V-v0).^2 );
D2 = sqrt( (U+u0).^2 + (V+v0).^2 );
	Mask1 = D1<=D0;
	Mask2 = D2<=D0;
    Mask = or(Mask1,Mask2);
H = ones(M,N);
H(Mask) = 0;

end
