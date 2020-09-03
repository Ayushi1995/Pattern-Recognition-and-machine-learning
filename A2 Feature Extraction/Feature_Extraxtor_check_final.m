filename = {'melody_1.wav','melody_2.wav','melody_3.wav'};
frIsequence = cell(1,3);
signal = cell(1,3);
Fs = cell(1,3);
time = cell(1,3); 
st=cell(1,3);
scaleFactor = [1.5; 1; 1];

for i = 1:3
    if(i==1)
        var=false;
    else
        var=false;
    end
    [y,f] = audioread(char(filename(i)));
    signal{i} = y;
    Fs{i} = f;
    frIsequence{i} = GetMusicFeatures(signal{i},Fs{i});   
    len = length(frIsequence{i});
    time{i} = (0:0.03: (len-1)*0.03);
    st{i} = semitoneCalc_outlier(frIsequence{i}.*repmat(scaleFactor, 1, size(frIsequence{i}, 2)),time{i},var, i);
end

% pitch profile
figure;
sb1 = subplot(3, 1, 1);
plot(time{1}, st{1}); grid on;
title('Semitones from melody 1');
xlabel('time'); ylabel('feature');
sb2 = subplot(3, 1, 2);
plot(time{2}, st{2}); grid on;
title('Semitones from melody 2');
xlabel('time'); ylabel('feature');
sb3 = subplot(3, 1, 3);
plot(time{3}, st{3}); grid on;
title('Semitones from melody 3');
xlabel('time'); ylabel('feature');
set([sb1 sb2 sb3], 'YLim', [0 4]);
