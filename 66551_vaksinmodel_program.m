clear;
clc;

to = 0;
tf =90;
inputso = input('masukan initial value S=');
inputio = input('masukan initial value I=');
inputro = input('masukan initial value R=');
a = input('masukan rate infeksi(beta)=');
b = input('masukan rate kesembuhan(mu)=');
v = input('masukan rate vaksin(v)=');

yo = [inputso;inputio;inputro];

[t y] = ode45('basicmodel_function',[to tf],yo);
figure('Name','Output Dinamika Virus Ebola Tanpa Vaksin','NumberTitle','off');
plot(t,y(:,1),'b',t,y(:,2),'r-.',t,y(:,3),'g--','LineWidth', 5)
title('output model SIR tanpa vaksin')
xlabel('time')
ylabel('susceptible, infected, recovered')
legend('Susceptible','Infectious','Recovered');
grid on
figure('Name','Output Dinamika Virus Ebola dengan Vaksin','NumberTitle','off');

[t y] = ode45('vaksinmodel_function',[to tf],yo);
plot(t,y(:,1),'b',t,y(:,2),'r-.',t,y(:,3),'g--','LineWidth', 5)
title('Output model SIR dengan vaksin');
xlabel('time');
ylabel('susceptible, infected, recovered');
legend('Susceptible','Infectious','Recovered');
grid on

figure('Name','Permandingan kompartemen S, I, R. Sebelum & Sesudah','NumberTitle','off');
subplot(2,2,1)
[t y] = ode45('basicmodel_function',[to tf],yo);
plot(t,y(:,1),'m','LineWidth', 5)
title('Kompartemen S Sebelum & Sesudah');
xlabel('time');
ylabel('susceptible');
grid on

hold on
[t y] = ode45('vaksinmodel_function',[to tf],yo);
plot(t,y(:,1),'k','LineWidth', 5)
legend('without vaccines','with vaccines');
hold off
grid on

subplot(2,2,2)
[t y] = ode45('basicmodel_function',[to tf],yo);
plot(t,y(:,2),'m','LineWidth', 5)
title('Kompartemen I Sebelum & Sesudah');
xlabel('time');
ylabel('Infectious');


hold on
[t y] = ode45('vaksinmodel_function',[to tf],yo);
plot(t,y(:,2),'k','LineWidth', 5)
legend('without vaccines','with vaccines');
hold off
grid on

subplot(2,2,3)
[t y] = ode45('basicmodel_function',[to tf],yo);
plot(t,y(:,3),'m','LineWidth', 5)
title('Kompartemen R Sebelum & Sesudah');
xlabel('time');
ylabel('Recovered');

hold on
[t y] = ode45('vaksinmodel_function',[to tf],yo);
plot(t,y(:,3),'k','LineWidth', 5)
legend('without vaccines','with vaccines');
hold off
grid on