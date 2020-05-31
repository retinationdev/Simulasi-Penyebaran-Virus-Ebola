clear;
clc;

a = zeros(1,1);
b = zeros(1,1);
to = 0;
tf =90;
inputso = input('masukan initial value S=');
inputio = input('masukan initial value I=');
inputro = input('masukan initial value R=');
a = input('masukan rate infeksi(beta)=');
b = input('masukan rate kesembuhan(mu)=');

yo = [inputso;inputio;inputro];

[t y] = ode45('basicmodel_function',[to tf],yo);
figure('Name','Output Basic Model Dinamika Virus Ebola','NumberTitle','off');
plot(t,y(:,1),'m',t,y(:,2),'r-.',t,y(:,3),'g--','LineWidth', 5)
title('Output hasil simulasi Basic Model')
xlabel('time')
ylabel('susceptible, infected, recovered')
legend('Susceptible','Infectious','Recovered');
grid on

figure('Name','Basic Model kompartemen S, I, R','NumberTitle','off');
subplot(2,2,1)
[t y] = ode45('basicmodel_function',[to tf],yo);
plot(t,y(:,1),'m','LineWidth', 5)
title('Kompartemen S');
xlabel('time');
ylabel('susceptible');
legend('Susceptible');
grid on

subplot(2,2,2)
[t y] = ode45('basicmodel_function',[to tf],yo);
plot(t,y(:,2),'r-.','LineWidth', 5)
title('Kompartemen I');
xlabel('time');
ylabel('Infectious');
legend('Infectious');
grid on


subplot(2,2,3)
[t y] = ode45('basicmodel_function',[to tf],yo);
plot(t,y(:,3),'g--','LineWidth', 5)
title('Kompartemen R');
xlabel('time');
ylabel('Recovered');
legend('Recovered');
grid on