function im5 = freqfilter_ideal_lp(im,D0)
    if ~isa(im,'double')
        im1 = double(im)/255; 
    end
im2 = fft2(im1);      % ����Ҷ�任
im3 = fftshift(im2);  % ���Ļ�
[N1, N2] = size(im3);
for i = 1:N1
    for j = 2:N2
        if(im3(i,j) < D0)              % ���������ͨ�˲��˲���
            result(i,j) = 0;
        else
            result(i,j) = im3(i,j);
        end
    end
end
result = ifftshift(result); % �����Ļ�
im4 = ifft2(result);           % ���任
im5 = im2uint8(real(im4));

end
