%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IRT Regelunsgtechnisches Labor
% Aufgabe 7 und 8 - Vorlage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
close all

% Parameter der Regelstrecke Viertelfahrzeug

% Massen
m_s = 4.5;             % Aufbaumasse [kg]
m_u = 0.9;             % Radmasse [kg]

% Federsteifigkeiten
c_s = 177;             % Federsteifigkeit c_s [N/m]
c_u = 885;             % Federsteifigkeit c_u [N/m]

% Dämpferkonstanten
d_s = 0.142*10^3*0.1;  % Dämpferkonstante d_s [Ns/m]


%% Teilübertragungsfunktion aufstellen

% Koeffizienten des Zählerpolynoms
b2_u = m_u;
b1_u = 0;
b0_u = c_u; 

% Koeffizienten des Nennerpolynoms
a4_u = m_u*m_s;
a3_u = (m_u+m_s)*d_s;
a2_u = m_s*(c_s+c_u)+m_u*c_s;
a1_u = d_s*c_u;
a0_u = c_s*c_u;

Gsu = tf([b2_u,b1_u,b0_u],[a4_u,a3_u,a2_u,a1_u,a0_u]);

%% Reglerauslegung

% P-Regler
Gr_P = 1;

% Offenen Regelkreis aufstellen
G0P = Gsu*Gr_P;

% Bode Plot für offenen Regelkreis
figure(1)
bode(G0P);

% Reglerauslegung ergänzen
% Aufagbe 7
G0P1 = Gsu*db2mag(43.5)
bode(G0P1)
margin(G0P1)

%% Aufgabe 8
pzmap(Gsu)

K_p = 1;
s = tf('s');
R_3 = K_p*33.67*(1/33.67*s^2 +  2.211/33.67*s+1)/( 2.211/33.67*s);
% pzmap(G0*R3)
bode(Gsu*R_3)
% sisotool(G0R3)

K_p = db2mag(32.5);
s = tf('s');
R_3 = K_p*33.67*(1/33.67*s^2 +  2.211/33.67*s+1)/( 2.211/33.67*s);

figure()
bode(Gsu*R_3)
GgR3 = feedback(Gsu*R_3,1);
step(GgR3)




