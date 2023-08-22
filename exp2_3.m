[y, Fs] = audioread('Track003.wav');
%sound(y, Fs);
%pause(18);

%downsample

y1 = downsample(y, 3);
audiowrite("audio.wav",y1,Fs/3);
[y1, Fs1] = audioread('audio.wav');
%sound(y1, Fs1);
%pause(18);
y2 = downsample(y, 10);
audiowrite("audio2.wav",y2,Fs/10);
[y2, Fs2] = audioread('audio2.wav');
%sound(y2, Fs2);

%upsample

y10 = upsample(y, 3);
audiowrite("audio01.wav",y10,3*Fs);
[y10, Fs1] = audioread('audio.wav');
%sound(y1, Fs1);
%pause(18);
y20 = upsample(y, 10);
audiowrite("audio02.wav",y20,10*Fs);
[y20, Fs2] = audioread('audio2.wav');
%sound(y2, Fs2);
t1 = 1/Fs:1/Fs1:length(y1)/Fs1;
t2 = 1/Fs:1/Fs2:length(y2)/Fs2;
subplot(2,1,1);
plot(t1, y1);
subplot(2,1,2);
plot(t2,y2);