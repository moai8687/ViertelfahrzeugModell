%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IRT Regelunsgtechnisches Labor
% Aufgabe 9 - Vorlage
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

%--------------------------------------------
% Reglerauslegung mit dem SISO-Tool
sisotool(Gsu);


%% Aufgabe 

%--------------------------------------------
% G_(z,u)(s)

% Koeffizienten des Zählerpolynoms
b1_z = d_s*c_u;
b0_z = c_s*c_u;

% Koeffizienten des Nennerpolynoms
a4_z = m_u*m_s;
a3_z = (m_u+m_s)*d_s;
a2_z = m_s*(c_s+c_u)+m_u*c_s;
a1_z = d_s*c_u;
a0_z = c_s*c_u;

Gsz = tf([b1_z,b0_z],[a4_z,a3_z,a2_z,a1_z,a0_z]);

%--------------------------------------------
% Reglerauslegung mit dem SISO-Tool
sisotool(Gsu,1,1,Gsz);
% sisotool(Gsz)
