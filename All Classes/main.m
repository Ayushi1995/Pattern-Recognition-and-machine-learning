%HMM Implementation
q = [0.75; 0.25];
A = [0.99,0.01; 0.03,0.97];
T = 10000;

mc=MarkovChain(q,A);
S = rand(mc,T);

% frequencies of states to verify the probabilties
s1=0;
s2=0;
for i = 1:T
    if S(i)==1
        s1 = s1+1;
    else
        s2 = s2+1;
    end
end
fprintf("State1 = %i \n",s1);
fprintf("State2 = %i \n",s2);

%Generating HMM sequence and finding its mean and variance to verify
Bh(1)=GaussD('Mean',[0],'StDev',[1]);
Bh(2)=GaussD('Mean',[3],'StDev',[2]);
h1=HMM(mc,Bh);
[X1,SS1]=rand(h1,500);

xmean = mean(X1);
xvar = var(X1);
fprintf("mean = %f \n",xmean);
fprintf("var = %f \n",xvar);

%plotting 500 samples of Xt against time
t = linspace(1,500,500);
figure
area(t,X1);
title("Plot of 500 Xt samples from HMM versus time");
xlabel("time");
ylabel("Xt samples");

%plotting 500 samples of Xt with output distributions having mean 0
B(1)=GaussD('Mean',[0],'StDev',[1]);
B(2)=GaussD('Mean',[0],'StDev',[2]);
h2=HMM(mc,B);
[X2,SS2]=rand(h2,500);

figure
area(t,X2);
title("Plot of Xt samples verus time with both mean zero");
xlabel("time");
ylabel("Xt samples");

%%
%finite Duration HMM

qfin = [1.0;0.0];
Afin = [0.65,0.25,0.1; 0.3,0.6,0.1];
T=10000;
mcfin = MarkovChain(qfin,Afin);
Sfin = rand(mcfin,T);
Bfin(1)=GaussD('Mean',[0],'StDev',[1]);
Bfin(2)=GaussD('Mean',[+3],'StDev',[2]);
hfin=HMM(mcfin,Bfin);
[Xfin,SSfin] = rand(hfin,T);


%%
%Gaussian vector Distributions

q = [0.75; 0.25];
A = [0.99,0.01; 0.03,0.97];
T = 10000;

mc=MarkovChain(q,A);
S = rand(mc,T);


Cm=[2,1; 1,4];
Bh(1)=GaussD('Mean',[0 1],'Covariance',Cm);
Bh(2)=GaussD('Mean',[+3 1],'Covariance',Cm);
h=HMM(mc,Bh);
[X,SS] = rand(h,500);


%------------------------END----------------------------------







 