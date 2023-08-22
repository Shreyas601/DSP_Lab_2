% Q1 part1 
alpha = 1+ mod(235, 3);

% Time values
duration = 1 / alpha;
sampling_rate = 1000
time = linspace(0, duration-1/(duration*1000), (duration * sampling_rate - 1));

% Frequencies
freq_1 = 5 * alpha
freq_2 = 6 * alpha
freq_3 = 10 * alpha

% Generate signals α
signal_1 = alpha * cos(2 * pi * freq_1 * time);
signal_2 = (alpha / 2) * cos(2 * pi * freq_2 * time);
signal_3 = (alpha / 4) * cos(2 * pi * freq_3 * time);

% Plot signals
figure;
plot(time, signal_1, 'DisplayName', sprintf('%d Hz', freq_1));
hold on;
plot(time, signal_2, 'DisplayName', sprintf('%d Hz', freq_2));
plot(time, signal_3, 'DisplayName', sprintf('%d Hz', freq_3));
xlabel('Time');
ylabel('Amplitude');
legend;
hold off;

% question 1 part 2 
figure;
signal_4 = signal_1 + signal_2 + signal_3;
plot(time,signal_4)
xlabel('Time');
ylabel('Amplitude');

%question 1 part 3

time = linspace(0, duration - 1/(duration*1000), (duration*1000 - 1)); % High-resolution time for accurate plotting

% Sampling frequencies
Fs_a = 14 * alpha; % Fs = 14alpha samples/second
Fs_nyquist = 2 * max([freq_1, freq_2, freq_3]); % Nyquist rate
Fs_aliasing = 9 * alpha; % Aliasing scenario

% Sample the cumulative signal at different sampling frequencies
samples_a = signal_4(1 : round(Fs_a * duration) : end)
samples_nyquist = signal_4(1 : round(Fs_nyquist * duration) : end);
samples_aliasing = signal_4(1 : round(Fs_aliasing * duration) : end);

% Discrete-time waveforms using stem
time_a = linspace(0, duration-1/(duration*1000), length(samples_a));
time_nyquist = linspace(0, duration-(duration*1000), length(samples_nyquist));
time_aliasing = linspace(0, duration-(duration*1000), length(samples_aliasing));

% Plot discrete-time waveforms in subplots
figure;

subplot(3, 1, 1);
stem(time_a, samples_a);
xlabel('Samples');
ylabel('Amplitude');
%title('Discrete-Time Waveform (Fs = 14alpha samples/second)');
grid on;

subplot(3, 1, 2);
stem(time_nyquist, samples_nyquist);
xlabel('Samples');
ylabel('Amplitude');
%title('Discrete-Time Waveform (Nyquist Rate)');
grid on;

subplot(3, 1, 3);
stem(time_aliasing, samples_aliasing);
xlabel('Samples');
ylabel('Amplitude');
%title('Aliasing');
grid on;

%question 4

% Plot interpolated signals
figure;

subplot(3, 1, 1);
plot(time_a, samples_a, 'r');
%title('Fs = 14\alpha samples/second');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(time_nyquist, samples_nyquist, 'g');
%title('Nyquist rate');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(time_aliasing, samples_aliasing, 'b');
%title('Linear Interpolation: Aliasing (6\alpha Hz aliased to 3\alpha Hz)');
xlabel('Time');
ylabel('Amplitude');

%question 5

Ta = 1/Fs_a;       
La = length(samples_a);
time_a = (0:La-1)*Ta;
Tn = 1/Fs_aliasing;       
Ln = length(samples_aliasing);
time_n = (0:Ln-1)*Tn;
y0 = fft(samples_a);
s0 = fft(samples_aliasing);
fa = Fs_a*(0:(La-1))/La;
fn = Fs_aliasing*(0:((Ln-1)))/Ln;
P2 = abs(y0/La);
P1 = P2(1:La/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Q2 = abs(s0/Ln);
Q1 = Q2(1:Ln/2+1);
Q1(2:end-1) = 2*Q1(2:end-1);
figure;
stem(fa, P2,'blue');
ylabel('amplitude');
xlabel('frequency');
figure;
stem(fn, Q2,'red');
ylabel('amplitude');
xlabel('frequency');