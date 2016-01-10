%function [amp zcr] = double_threshold_detection( x, wlen, inc, NIS)
function [voiceseg,vs1,SF,NF] = double_threshold_detection( x, wlen, inc, NIS)
%DOUBLE_THRESHOLD_DETE Summary of this function goes here
%   ˫���������Ķ˵���
x = x(:)';
maxsilence = 8;%��Ĭ
minlen = 5;         %��С�������ȣ�5 * wlen / fs = 5 * 200 / 44100 ;0.022s��
status = 0;         %������״̬���λ
count = 0;          %ͳ������֡������ͨ������֡���������Լ������������ֹ��
silence = 0;

y = enframe(x,wlen,inc)';
fn = size(y,2);
zcr = zc2(y,fn);    %ƽ��������
amp = sum(y .^ 2);  %��ʱ����

ampth = mean(amp(1:NIS));
zcrth = mean(zcr(1:NIS));

amp1 = 4 * ampth;amp2 = 2 * ampth;
zcr2 = 2 * zcrth;

xn = 1;
for n = 1 : fn %��֡�ж�
    switch status
        case {0,1}
            if amp(n) > amp1 %������
                x1(n) = max(n - count(xn) - 1 , 1);
                status = 2;
                silence(xn) = 0;
                count(xn) = count(xn) + 1;
            elseif amp(n) > amp2 | zcr(xn) > zcr2
                status = 1;
                count(xn) = count(xn) + 1;
            else 
                status = 0;
                count(xn) = 0;
                x1(xn) = 0;
                x2(xn) = 0;
            end
        case 2,
            if amp(n) > amp2 & zcr(xn) > zcr2
                count(xn) = count(xn) + 1;
            else
                silence(xn) = silence(xn) + 1;
                if silence(xn) < maxsilence     %������������������δ����
                    count(xn) = count(xn) + 1;
                elseif count(xn) < minlen       %��������̫�̣���Ϊʱ������������
                    status = 0;
                    silence(xn) = 0;
                    count(xn) = 0;
                else
                    status = 3;
                    x2(xn) = x1(xn) + count(xn);
                end
            end
        case 3,%����������Ϊ��һ������֡׼��
            status = 0;
            xn = xn + 1;
            count(xn) = 0;
            silence(xn) = 0;
            x1(xn) = 0;
            x2(xn) = 0;
    end
end

e1 = length(x1);
if x1(e1) == 0,e1 = e1 - 1;
end
if x2(xn) == 0
    fprintf('Error: Not find endding point!\n');
    x2(e1) = fn;
end
SF = zeros(1,fn);
NF = ones(1,fn);
for i = 1 : e1
    SF(x1(i):x2(i)) = 1;
    NF(x1(i):x2(i)) = 0;
end
speechIndex = find(SF == 1);
voiceseg = findSegment(speechIndex);
vs1 = length(voiceseg);
end

