filename = {'melody_1.wav','melody_2.wav','melody_3.wav'};
frIsequence = cell(1,3);
signal = cell(1,3);
Fs = cell(1,3);
time = cell(1,3); 
for i = 1:3
    [y,f] = audioread(char(filename(i)));
    signal{i} = y;
    Fs{i} = f;
    frIsequence{i} = GetMusicFeatures(signal{i},Fs{i});
    len = length(frIsequence{i});
    time{i} = (0:0.03: (len-1)*0.03); 
end

figure(1)
sb1=subplot(3,1,1); %pitch
plot(time{1},frIsequence{1}(1,:));
title('Pitch of the Melody 1');
xlabel('time'); ylabel('Pitch');
set(gca,'YScale','log')

sb2=subplot(3,1,2);
plot(time{2},frIsequence{2}(1,:));
title('Pitch of the Melody 2');
xlabel('time'); ylabel('Pitch');
set(gca,'YScale','log')

sb3=subplot(3,1,3);
plot(time{3},frIsequence{3}(1,:));
title('Pitch of the Melody 3');
xlabel('time'); ylabel('Pitch');
set(gca,'YScale','log')
set([sb1 sb2 sb3], 'YLim', [100 300]);

figure(2)
subplot(3,1,1);%r
plot(time{1},frIsequence{1}(2,:));
set(gca,'YScale','log')
title('Correlation of the Melody 1');
xlabel('time'); ylabel('correlation');

subplot(3,1,2);
plot(time{2},frIsequence{2}(2,:));
title('Correlation of the Melody 2');
xlabel('time'); ylabel('correlation');
set(gca,'YScale','log')

subplot(3,1,3);
plot(time{3},frIsequence{3}(2,:));
title('Correlation of the Melody 3');
xlabel('time'); ylabel('correlation');
set(gca,'YScale','log')

figure(3)%I
subplot(3,1,1);
plot(time{1},frIsequence{1}(3,:));
title('Intensity of the Melody 1');
xlabel('time'); ylabel('Intensity');
set(gca,'YScale','log')

subplot(3,1,2);
plot(time{2},frIsequence{2}(3,:));
title('Intensity of the Melody 2');
xlabel('time'); ylabel('Intensity');
set(gca,'YScale','log')

subplot(3,1,3);
plot(time{3},frIsequence{3}(3,:));
title('Intensity of the Melody 3');
xlabel('time'); ylabel('Intensity');
set(gca,'YScale','log')