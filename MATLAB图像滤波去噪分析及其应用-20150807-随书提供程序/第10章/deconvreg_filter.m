function [J, LAGRA] = deconvreg_filter(I,PSF,NP)
% Լ����Сƽ���˲���
%��������: 
%        I:   ����Ķ�άͼ�����
%        PSF: �˻������Ŀ���ģ��
%        NP:  ��ʾ�����Ĺ���
%�������: 
%        J: Լ����Сƽ���˲�ͼ��
%        LAGRA: ����Ϊһ����ֵ����ʾָ��Լ����Сƽ������Ѹ�ԭ����y��
%               Ҳ����Ϊ[min,max]��ʽ����ʾ����y��������Χ
%               ���˲���ʡ�ԣ����ʾ������ΧΪ[1e-9,1e9] ��

% Լ����Сƽ���˲�
if ~isa(I,'double')
    I = double(I)/255;
end
LR = [1e-9 1e9];    % ��ԭ����������Χ
% �������ͼ��ά��
sizeI = size(I);
% PSF ����
sizePSF = size(PSF);
% ����ͼ���ά�����
numNSdim = find(sizePSF~=1);  
NSD = length(numNSdim);
% ת��PSF������������ά�� �⴫�ݺ���OTF
otf = psf2otf(PSF,sizeI);
% regop��ͨ������������˹���Ӽ���ͼ���ƽ����
% ��������ʽ��10.23��
  if NSD == 1,
    regop = [1 -2 1];
  else % ��ά����
    % 3x3 Laplacian matrixes
    regop = repmat(zeros(3),[1 1 3*ones(1,NSD-2)]);
    % center matrix of Laplacian
    idx = [{':'}, {':'}, repmat({2},[1 NSD-2])];
    regop(idx{:}) = [0 1 0;1 -NSD*2 1;0 1 0];  %��ģ������
  end
%   regop =
%      0     1     0
%      1    -4     1
%      0     1     0
  % �ı�REGOP�۷���ԭʼά��
  idx1 = repmat({1},[1 length(sizePSF)]);
  idx1(numNSdim) = repmat({':'},[1 NSD]);
  REGOP(idx1{:}) = regop;
% ת��PSF������������ά�� �⴫�ݺ���OTF  
REGOP = psf2otf(REGOP,sizeI);

fftnI = fftn(I);
R2 = abs(REGOP).^2;
H2 = abs(otf).^2;

% ����LAGRAֵ
if (numel(LR)==1) || isequal(diff(LR),0),% LAGRA is given
  LAGRA = LR(1);
else % ����fminbnd��[1e-9,1e9]�Ż������ټ���
  R4G2 = (R2.*abs(fftnI)).^2;
  H4 = H2.^2;
  R4 = R2.^2;
  H2R22 = 2*H2.*R2;
  ScaledNP = NP*prod(sizeI);
  LAGRA = fminbnd(@ResOffset,LR(1),LR(2),[],R4G2,H4,R4,H2R22,ScaledNP);
end;

% �ع�ͼ��
Denom = H2 + LAGRA*R2;
Nomin = conj(otf).*fftnI;

% ��֤Denom�е���СֵȡΪsqrt(eps)
Denom = max(Denom, sqrt(eps));
J = real(ifftn(Nomin./Denom));   % ȡʵ��
end

function f = ResOffset(LAGRA,R4G2,H4,R4,H2R22,ScaledNP)
% ���㷴�����в�-��������
% Parseval's theorem 
Residuals = R4G2./(H4 + LAGRA*H2R22 + LAGRA^2*R4 + sqrt(eps));
f = abs(LAGRA^2*sum(Residuals(:)) - ScaledNP);
end

