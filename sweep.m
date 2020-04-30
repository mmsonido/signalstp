
    fs=44100; %Frecuencia de sampleo
    T=10; %Tiempo de duracion
    w1=10; %Frecuencia inicial
    w2=2000; %Frecuencia final
    
    n=[0:1/fs:T]; %Vector de muestras
    z = [w1:1:w2]; %Recorro el vector frecuencias

    subplot(2,1,1);
    y=sinesweep(T,w1,w2,n); %Aplico la funcion pre-definida
    plot(n,y)

    subplot(2,1,2);
    b = inversefilter(T,w2,w1,n) .* sinesweep(T,w2,w1,n); %Aplico el filtro inverso
    plot(n,b)

    audiowrite('sine.wav',y,44100)

    sound(0.02.*y,fs) 
