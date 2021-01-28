%%%%%%%%%%%%% computation  of satellite CIS coordinates %%%%%%%%%%%%%%%%%%%
%
% This Program computes the positions of a satellite in an equetorial 
% inertial coordinate system using the orbital elements introduced.
%
% Inputs:
%       a=semi-major axis of the orbital ellipse in meter
%       e=eccentricity of the orbital ellipse
%       i=satellite inclination in degree
%       M=Mean Anomali
%       Gama=right ascension of ascending node in degree
%       w=perigee arguments in degree
%       
%     +-------------------+--------+-----------------+
%     | Semi Major Axis   |   A    |   28196.776 Km  |  
%     +-------------------+--------+-----------------+
%     | Eccentricity      |   e    |   0.7679436     | 
%     +-------------------+--------+-----------------+
%     | Inclination       |   i    |   20.3150       | 
%     +-------------------+--------+-----------------+
%     | RA ascending node |  gama  |   359.1450      |  
%     +-------------------+--------+-----------------+
%     | Arg. Of perigee   |   w    |   179.4250      | 
%     +-------------------+--------+-----------------+
%     | Mean Anomaly      |   M    |   29.2360       |
%     +-------------------+--------+-----------------+
%       
% Outputs:
%  satellite cartesian coordinates in equetorial inertial coordinate system
        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
format long
a=28196.776; 
e=0.7679436;
i=20.315*pi/180; 
Gama=359.145*pi/180;
w=179.425*pi/180;
M=29.236*pi/180;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
E0=M;
dE=e*sin(E0);
while dE>10^-16
    E1=M+e*sin(E0);
    f=E1-M-e*sin(E1);
    df=1-e*cos(E1);
    E2=E1-(f/df);
    dE=E2-E1;
    E0=E1;
    E1=E2;
end
E=E1;
E=E*180/pi;
v=atand((sqrt(1-e^2)*sind(E))/(cosd(E)-e));
v=v+180;
r=a*(1-e*cosd(E));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=r*cosd(v);
t=r*sind(v);
kX=(cos(w)*cos(Gama)-sin(w)*sin(Gama)*cos(i));
kY=(cos(w)*sin(Gama)+sin(w)*cos(Gama)*cos(i));
kZ=(sin(w)*sin(i));
tX=(-sin(w)*cos(Gama)-cos(w)*sin(Gama)*cos(i));
tY=(-sin(w)*sin(Gama)+cos(w)*cos(Gama)*cos(i));
tZ=(cos(w)*sin(i));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X=k*(kX)+t*(tX);
Y=k*(kY)+t*(tY);
Z=k*(kZ)+t*(tZ);
[THETA,PHI,R] = cart2sph(X,Y,Z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('\n\t\t\t\t\tX : ')
disp(X)
fprintf('\n\t\t\t\t\tY : ')
disp(Y)
fprintf('\n\t\t\t\t\tZ : ')
disp(Z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%