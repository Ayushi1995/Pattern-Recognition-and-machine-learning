testFiles = {'T1.wav','T2.wav','T3.wav','T4.wav','T5.wav','T6.wav'};
[frIsequence, st, time] = FeatureExtractor(testFiles);
testClasses = [3, 3, 10, 10, 7, 4];
for m = 1:10 
    correct = 0;
    for l = randperm(length(st))
        Prob = logprob(hmm,cell2mat(st(l)));
        [~, ind] =max(Prob);
        result(l) = ind;
        disp(result(l))
        if(ind == testClasses(l))
            correct = correct+1;
        end
        disp(testClasses(l));
    end
    accuracy(m) = correct/length(st);
    disp(accuracy(m));
end