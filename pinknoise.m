Nx=2^16; %Cantidad de muestras a sintetizar.
vNx=[1:Nx];
B=[0.049922035 -0.095993537 0.050612699 -0.004408786]; %Coeficientes de el filtro de 3db de caida.
A=[1 -2.494956002 2.017265875 -0.522189400];
nT60=round(log(1000)/1-max(abs(roots(A)))); %Tiempo que tarda la señal en caer 60dB.
v=randn(1,Nx+nT60); %Genero vector aleatorio.
x=filter(B,A,v); %Aplico el filtro de los coeficientes B y A en vector v.
x=x(nT60+1:end); %Elimina el transitorio

plot(vNx,x) 

sound(0.02.*v,fs)
