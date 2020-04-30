function arg=arg(T,w1,w2,n)
arg= ((T*w1)/log(w2/w1))*(exp(n/(T/log(w2/w1)))-1);
end