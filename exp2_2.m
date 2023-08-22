a = 1 + mod(236,3);
f = [220,246.94,261.63,293.66,329.63,349.23,392]
fs = 44000
for freq=f
    t = 0:(1/fs):2
    y = sin(2*pi*freq*t)
    sound(y,fs)
end
pause(2);
fs = 70000
for freq=f
    t = 0:(1/fs):2
    y = sin(2*pi*freq*t)
    sound(y,fs)
end
pause(2);
fs = 10000
for freq=f
    t = 0:(1/fs):2
    y = sin(2*pi*freq*t)
    sound(y,fs)
end
%high sampling frequency gives a better audio quality but larger storage
%and faster converters. Low sampling frequency leads to low audio quality but
%easier storage and conversion.