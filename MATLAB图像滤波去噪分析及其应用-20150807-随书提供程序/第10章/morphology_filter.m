function Iobrcbr = morphology_filter(im,sca)
% ��̬ѧ�˲���
%��������: 
%         im:   ����Ķ�άͼ�����
%         sca : �ṹԪ�سߴ����
%�������: 
%         Iobrcbr: ��̬ѧ�˲�ͼ��
% ��̬ѧ�˲�
% sca = 5;                       % �ṹԪ�سߴ�
se=strel('diamond',(sca-1)/2); % ��̬ѧ�ṹԪ��
Io=imopen(im,se);              % ������
Ioc=imclose(Io,se);            % �ղ���
Iobr=imreconstruct(Io,Ioc);    % �ṹ�ؽ�

Iobrd = imdilate(Iobr,se);   % ����
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr)); % �ṹ�ؽ�
Iobrcbr = imcomplement(Iobrcbr);                                 % ��ǿͼ������


