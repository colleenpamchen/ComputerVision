%% Homework 2 DFT #5 

h = [zeros(1,49) 1 zeros(1,50)];
figure; plot(h) 
m= abs(fft(h));
figure; plot(m); 



x = [0 1:10 5.*ones(1,5) zeros(1,40)];
% y = conv(x,h);                          
p = unwrap(angle(y)); 

%%
fs = 10000;
t = 0:1/fs:1.5;
x1 = sawtooth(2*pi*50*t);
x2 = square(2*pi*50*t);
subplot(2,1,1)
plot(t,x1)
axis([0 0.2 -1.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude') 
title('Sawtooth Periodic Wave')
subplot(2,1,2)
plot(t,x2)
axis([0 0.2 -1.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude')
title('Square Periodic Wave')

%%
t = [zeros(1,49) 1 zeros(1,50)];                     % Time vector
x = sin(2*pi*15*t) + sin(2*pi*40*t);      % Signal
y = fft(x);                               % Compute DFT of x
m = abs(y);                               % Magnitude
f = (0:length(y)-1)*100/length(y);        % Frequency vector

figure;
subplot(2,1,1)
plot(f,m)
title('Magnitude')
ax = gca;
ax.XTick = [15 40 60 85];

subplot(2,1,2)
plot(f,p*180/pi)
title('Phase')
ax = gca;
ax.XTick = [15 40 60 85];




