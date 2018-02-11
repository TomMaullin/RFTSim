function out = ECplot(z, resel_count)
     %From Worsley 1992
     out =  resel_count * (4 * log(2)) * ((2*pi)^(-3/2)) * z * exp((z^2)*(-0.5));
end