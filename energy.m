
function energy = energy (T,w1,w2,n)

energy = 1./(((T/log(w2/w1))^2)/((T*w1)/log(w2/w1)) * (exp(-n/(T/log(w2/w1)))));

end

