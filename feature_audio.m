function [] = feature_audio( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
figure_index = 1;
frame_len = 1024;
frame_inc = frame_len / 4;
[data,fs] = wavread(filename);

%%%%%%  音频数据预处理  %%%%%%
data = data - mean(data);%去除直流分量
data = data ./ max(abs(data));%数据归一化处理

sound(data,fs);

frames = enframe(data,frame_len,frame_inc);
[frame_rows,frame_cols] = size(frames);

%%%%%% 短时能量 逐帧求解 Start%%%%%%
energy = zeros(frame_rows,1);
for i = 1 : frame_rows
    frame = frames(i,:);
    energy(i) = sum(frame .^ 2);
end
figure(figure_index);
figure_index = figure_index + 1;
plot(energy);title('短时能量值');xlabel('bins/num');ylabel('energy/mag');
%%%%%% 短时能量 逐帧求解 Over %%%%%%

%%%%%% 平均幅度差 逐帧求解 Start%%%%%%
amdfs = zeros(frame_rows,1);
for i = 1 : frame_rows
    frame = frames(i,:);
    amdfs(i) = sum(abs(frame));
end
figure(figure_index);
figure_index = figure_index + 1;
plot(amdfs);title('平均幅度差');xlabel('bins/num');ylabel('energy/mag');
%%%%%% 短时能量 逐帧求解 Over %%%%%%

%%%%%% 过零率计算 逐帧求解 Start%%%%%%
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
plot(zerocross);title('短时过零率');xlabel('bins/num');ylabel('zerocross/mag');
%%%%%% 过零率计算 逐帧求解 Over%%%%%%

end

