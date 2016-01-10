%function [amp zcr] = double_threshold_detection( x, wlen, inc, NIS)
function [voiceseg,vs1,SF,NF] = double_threshold_detection( x, wlen, inc, NIS)
%DOUBLE_THRESHOLD_DETE Summary of this function goes here
%   双门限语音的端点检测
x = x(:)';
maxsilence = 8;%静默
minlen = 5;         %最小语音长度，5 * wlen / fs = 5 * 200 / 44100 ;0.022s秒
status = 0;         %语音的状态标记位
count = 0;          %统计语音帧数量，通过语音帧的数量可以计算出语音的起止点
silence = 0;

y = enframe(x,wlen,inc)';
fn = size(y,2);
zcr = zc2(y,fn);    %平均过零率
amp = sum(y .^ 2);  %短时能量

ampth = mean(amp(1:NIS));
zcrth = mean(zcr(1:NIS));

amp1 = 4 * ampth;amp2 = 2 * ampth;
zcr2 = 2 * zcrth;

xn = 1;
for n = 1 : fn %逐帧判断
    switch status
        case {0,1}
            if amp(n) > amp1 %语音段
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
                if silence(xn) < maxsilence     %静音不够长，语音尚未结束
                    count(xn) = count(xn) + 1;
                elseif count(xn) < minlen       %语音长度太短，认为时静音或者噪音
                    status = 0;
                    silence(xn) = 0;
                    count(xn) = 0;
                else
                    status = 3;
                    x2(xn) = x1(xn) + count(xn);
                end
            end
        case 3,%语音结束，为下一个语音帧准备
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

