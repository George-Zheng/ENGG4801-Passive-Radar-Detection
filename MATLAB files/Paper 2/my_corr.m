function r = my_corr(a,b)
an = a-mean(a);
bn = b-mean(b);

r = sum(an'*bn)/(norm(an) .* norm(bn));
