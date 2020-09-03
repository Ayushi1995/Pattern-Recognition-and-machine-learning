function semitones = semitoneCalc_outlier(frIsequence, time, verbose, melodyNumber)
property = cell(1,3);

%Data processing of 3 properties
for i = 1:3
    x = time;
    if i==1
        prop='pitch';
        A = log(frIsequence(1,:));
        [TF,L,U,C] = isoutlier(A,'quartiles');
        m = mean(A);
    elseif i==2
        prop='Correlation';
        A = frIsequence(2,:);
        [TF,L,U,C] = isoutlier(A);
        m = mean(A);
    else
        prop='Intensity';
        A = log(frIsequence(3,:));
        m = mean(A);
        TF = logical(A<m);
    end
    l = length(x);
    property{i}= x(TF);
    if(verbose== true)
        figure()
        if i~=3
            plot(x,A,x(TF),A(TF),'x',x,L*ones(1,l),x,U*ones(1,l),x,C*ones(1,l),x,m*ones(1,l))
            legend('Original Data','Outlier','Lower Threshold','Upper Threshold','Center Value','mean')
        else
            disp('in intensity');
            plot(x,A,x(TF),A(TF),'x',x,m*ones(1,l))
            legend('Original Data','Outlier','mean')
        end
        title(append('Information extraction from',' ', prop,' ','for melody',' ',num2str(melodyNumber)));
        xlabel('Time'); ylabel(prop);
    end
end

%noise calculation
for j = 1:length(time)
    t = time(j);
    if ismember(t,property{1}) || (ismember(t,property{2}) && ismember(t,property{3}))
        noise(j) = 1;
    else
        noise(j) = 0;

    end
end
    
%semitone calculation
pitch = log(frIsequence(1,:));
basePitch = min(pitch(find(noise==0)));
semitones = 12*log2(pitch/basePitch) + 1;
semitones(find(noise==1)) = 0.5*rand(size(find(noise==1)));


        




