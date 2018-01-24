function prob = mprob( x, Em )
% mprob calculates the probability that the number of clusters is x.
%--------------------------------------------------------------------------
% ARGUMENTS
% x     an integer that is number of clusters
% Em    the expected value of m
%--------------------------------------------------------------------------
% OUTPUT
% prob  the probability that the cluster size takes the value x
%--------------------------------------------------------------------------
% EXAMPLES
% 
%--------------------------------------------------------------------------
% SEE ALSO
% 

prob = 1/factorial(x)*Em^x * e^(-Em);


end

