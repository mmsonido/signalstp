%Este archivo es el previo al compartido a Maximiliano.

%Prueba de gitt desde Joaquin


t = 5;
fs=44100; %Frecuencia de sampleo
T=20; %Tiempo de duracion
w1=20; %Frecuencia inicial
w2=2000; %Frecuencia final
n = [0:1/fs:T];
A = ruidorosa(fs,t);
C = sinesweep(T,w1,w2,n);

function a=ruidorosa(fs,t)
%Ingres
Nx=fs*t; %Cantidad de muestras a sintetizar.
vNx=[1:Nx];
B=[0.049922035 -0.095993537 0.050612699 -0.004408786]; %Coeficientes de el filtro de 3db de caida.
A=[1 -2.494956002 2.017265875 -0.522189400];
nT60=round(log(1000)/1-max(abs(roots(A)))); %Tiempo que tarda la señal en caer 60dB.
v=randn(1,Nx+nT60); %Genero vector aleatorio.
x=filter(B,A,v); %Aplico el filtro de los coeficientes B y A en vector v.
a=x(nT60+1:end); %Elimina el transitorio
sound(a);

end

function m=inversefilter(T,w1,w2,n)
m=(w1/2*pi*((T*w1)/log(w2/w1))/((T/log(w2/w1))))*exp(n/(T/log(w2/w1)));
end
function P = arg(T,w1,w2,n)
P = ((T*w1)/log(w2/w1))*(exp(n/(T/log(w2/w1)))-1);
end
function b=argumento(T,w1,w2,n)
b= ((T*w1)/log(w2/w1))*(exp(n/(T/log(w2/w1)))-1);
end

function c = sinesweep(T,w1,w2,n)
b=sin(arg(T,w1,w2,n));
c = inversefilter(T,w2,w1,n) .* b; %Aplico el filtro inverso
subplot(2,1,1);
plot(n,c)
subplot(2,1,2);
plot(n,b)
end





% function y = sinesweep( fs,T,w1,w2 )
% %Ingresa frecuencia de sampleo, duracion, frecuencia inicial y final.
% %Devuelve un sine.wav
%     Play=1;
%     n=[0:1/fs:T]; %Vector de muestras
%     z = [w1:1:w2]; %Recorro el vector frecuencias
%     subplot(2,1,1);
%     y=sinesweep(T,w1,w2,n); %Aplico la funcion pre-definida
%     plot(n,y)
%     subplot(2,1,2);
%     b = inversefilter(T,w2,w1,n) .* sinesweep(T,w2,w1,n); %Aplico el filtro inverso
%     plot(n,b)
%     audiowrite('sine.wav',y,fs)
%     sound(0.02.*y,fs) 
% 
%       if Play == 1
%         sound(0.02.*y,fs) 
%       end
% 
% end
