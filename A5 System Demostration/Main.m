class = {'Class_1','Class_2','Class_3','Class_4','Class_5','Class_6','Class_7','Class_8','Class_9','Class_10'};
%class = {'Class_1_own','Class_2_own'};
%directory = {'D:\EQ2341_Pattern_Recognition_ML\Project\Class_1','D:\EQ2341_Pattern_Recognition_ML\Project\Class_2'};

for k = 1:10
    numClasses = length(class);
    xtest = {};
    classification = [];
    classes = [];
    for i = 1:numClasses
        classDirectory = dir(char(class(i)));
        files = struct2cell(classDirectory);
        filename = files(1,3:end);
        a = [1:1:15];
        ran = randperm(15,10);
        idx = ~ismember(a', ran', 'rows');
        c = 1:size(a, 2);
        d = c(idx);
        train = filename(ran);
        test = filename(d);
        classes = [classes i*ones(1,5)];
        [frIsequence_train, st_train, time_train] = FeatureExtractor(train);
        [frIsequence_test, st_test, time_test] = FeatureExtractor(test);
        xtest = [xtest st_test];
        nStates = 5;
        pD = GaussD;
        obsData = cell2mat(st_train);
        lData = cellfun('length', st_train);
        hmm(i)=MakeLeftRightHMM(nStates,pD,obsData,lData);
    end
    count =0;
    for j = randperm(length(xtest))
        P = logprob(hmm,cell2mat(xtest(j)));
        [~, index] =max(P);
        classification(j) = index;
        if(index == classes(j))
            count = count+1;
        end
    end
    
    test_accuracy(k) = count/length(xtest);
    disp(test_accuracy(k));

end
