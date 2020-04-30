function m=inversefilter(T,w1,w2,n)
m=(w1/2*pi*((T*w1)/log(w2/w1))/((T/log(w2/w1))))*exp(n/(T/log(w2/w1)));
end