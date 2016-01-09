function [] = feature_audio( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
figure_index = 1;
frame_len = 1024;
frame_inc = frame_len / 4;
[data,fs] = wavread(filename);

%%%%%%  ��Ƶ����Ԥ����  %%%%%%
data = data - mean(data);%ȥ��ֱ������
data = data ./ max(abs(data));%���ݹ�һ������

sound(data,fs);

frames = enframe(data,frame_len,frame_inc);
[frame_rows,frame_cols] = size(frames);

%%%%%% ��ʱ���� ��֡��� Start%%%%%%
energy = zeros(frame_rows,1);
for i = 1 : frame_rows
    frame = frames(i,:);
    energy(i) = sum(frame .^ 2);
end
figure(figure_index);
figure_index = figure_index + 1;
plot(energy);title('��ʱ����ֵ');xlabel('bins/num');ylabel('energy/mag');
%%%%%% ��ʱ���� ��֡��� Over %%%%%%

%%%%%% ƽ�����Ȳ� ��֡��� Start%%%%%%
amdfs = zeros(frame_rows,1);
for i = 1 : frame_rows
    frame = frames(i,:);
    amdfs(i) = sum(abs(frame));
end
figure(figure_index);
figure_index = figure_index + 1;
plot(amdfs);title('ƽ�����Ȳ�');xlabel('bins/num');ylabel('energy/mag');
%%%%%% ��ʱ���� ��֡��� Over %%%%%%

%%%%%% �����ʼ��� ��֡��� Start%%%%%%
zerocross =  zeros(frame_rows,1);
for i = 1 : frame_rows
    frame = frames(i,:);
    frame_num = length(frame);
    k = 1;
    zerocronum = 0;
    while k < frame_num - 1
        if (frame(k) * frame(k + 1) < 0)
            zerocronum = zerocronum + 1;
        end
        k = k + 1;
    end
    zerocross(i) = zerocronum;
end
figure(figure_index);
figure_index = figure_index + 1;
plot(zerocross);title('��ʱ������');xlabel('bins/num');ylabel('zerocross/mag');
%%%%%% �����ʼ��� ��֡��� Over%%%%%%

end

