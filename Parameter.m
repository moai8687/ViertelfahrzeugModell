m_s = 4.5; %[kg]
m_u = 0.9; %[kg]
d_s = 14.2; %[Ns/m]
c_s = 177; %[N/m]
c_u = 885; %[N/m]
%%
close all
figure()
plot(z_s)
hold on
plot(z_s_Kontrolle)
legend('z_s','z_{s Kontrolle}')

figure()
plot(z_u)
hold on
plot(z_u_Kontrolle)
legend('z_u','z_{u Kontrolle}')


figure()
plot(z_r)
hold on
plot(z_r_Kontrolle)
legend('z_r','z_{r Kontrolle}')