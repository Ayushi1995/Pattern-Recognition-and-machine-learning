function R=rand(pD,nData)
%R=rand(pD,nData) returns random scalars drawn from given Discrete Distribution.
%
%Input:
%pD=    DiscreteD object
%nData= scalar defining number of wanted random data elements
%
%Result:
%R= row vector with integer random data drawn from the DiscreteD object pD
%   (size(R)= [1, nData]
%
%----------------------------------------------------
%Code Authors:
%----------------------------------------------------

if numel(pD)>1
    error('Method works only for a single DiscreteD object');
end
cdf = cumsum(pD.ProbMass);
uni = rand(1,nData);
cmp = uni < cdf;
for i = 1: nData
    R(i) = find(cmp(:,i)>0,1);
end
%*** Insert your own code here and remove the following error message 

%error('Not yet implemented');
