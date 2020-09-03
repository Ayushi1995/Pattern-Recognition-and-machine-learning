q = [1; 0];
%A = [0.9 0.1 0; 0 0.9 0.1];
A = [0.9 0.1; 0 0.9];
x = [-0.2 2.6 1.3];
B1 = GaussD('Mean', 0, 'StDev', 1);
B2 = GaussD('Mean', 3, 'StDev', 2);
mc = MarkovChain(q, A);
h=HMM(mc, [B1; B2]);
%x=rand(h, 100);
pX = prob([B1 B2], x);
if finiteDuration(mc)
    disp('Values from the code for finite duration');
else
    disp('Values from the code for infinite duration');
end
[alfaHat, c] = forward(mc, pX)
disp('Output of logprob function')
logP=logprob(h,x)

%disp
% if finiteDuration(mc)
%     disp('Values from the code for finite duration');
%     disp("alfaHat "+alfaHat);
%     disp("c "+c);
% else
%     disp('Values from the code for infinite duration');
%     disp("alfaHat "+alfaHat);
%     disp("c "+c);
% end
% disp('Output of logprob function')
% disp(logP);
%disp('alfaHat'+alfaHat);
