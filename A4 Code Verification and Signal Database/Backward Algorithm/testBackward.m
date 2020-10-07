q = [1;0];
%A = [0.9 0.1 0; 0 0.9 0.1];
A= [0.9 0.1 ; 0 0.9];
mc=MarkovChain(q, A);%State generator
g1=GaussD("Mean",0,"StDev",1); %Distribution for state=1
g2=GaussD("Mean",3,"StDev",2); %Distribution for state=2
h=HMM(mc, [g1; g2]);
x = [-0.2,2.6,1.3];
pX = prob([g1,g2],x);
%[alfaHat, c]=forward(mc,pX);
c = [1,0.1625,0.8266,0.0581];
betaHat=backward(mc,pX,c)