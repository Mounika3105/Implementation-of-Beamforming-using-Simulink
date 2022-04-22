close all;
clear all;
% d --> distance between the elements (lambda)
 % beta --> phase difference 
 % N --> Number of elements 
 N =10;   %% Number of antenna elements 
 fc=28e9; %% Carrier frequency
 lamda=3e8/fc
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%   Distance between element is lambda/4                      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 d=lamda/4; %% Distance between the elements 
 beta = -pi/2:.005*pi:pi/2;
 phy = 2*pi*d.*sin(beta)/lamda;
 plot(beta*180/pi,phy*180/pi)
 hold on;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%   Distance between element is lambda/2                     %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 d=lamda/2; %% Distance between the elements 
 beta = -pi/2:.005*pi:pi/2;
 phy = 2*pi*d.*sin(beta)/lamda;
 plot(beta*180/pi,phy*180/pi,'r')
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%   Distance between element is lambda/8                      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 d=lamda/8; %% Distance between the elements 
 beta = -pi/2:.005*pi:pi/2;
 phy = 2*pi*d.*sin(beta)/lamda;
 plot(beta*180/pi,phy*180/pi,'g')
 xlabel('beam steering direction(\theta)')
 ylabel('phase difference between the elements(\Delta\phi)')
 legend('\lambda/4','\lambda/2','\lambda/8');
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%  Simulation of array factor                                 %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d=lamda/2; %% Distance between the elements 
N =16;
theta = -pi/2:.005*pi:pi/2;
steering_angle = 0.01;
phy = 2*pi*d.*sin(steering_angle)/lamda;
% AF = 20*log10(abs(sin((N*pi*d/lamda)*(sin(theta)-sin(steering_angle)))./(N*sin(pi*d/lamda*(sin(theta)-sin(steering_angle))))))
Factor1 = pi*d/lamda*sin(theta);
AF = 20*log10(sin(N*(Factor1-phy/2))./(N*sin(Factor1-phy/2)))
AF_pol_0 = ((sin(N*(Factor1-phy/2))./(N*sin(Factor1-phy/2))))

figure
plot(theta*180/pi,AF)
hold on

%% For steering angle 10 degree

steering_angle =10*pi/180 ;
phy = 2*pi*d.*sin(steering_angle)/lamda;
% AF = 20*log10(abs(sin((N*pi*d/lamda)*(sin(theta)-sin(steering_angle)))./(N*sin(pi*d/lamda*(sin(theta)-sin(steering_angle))))))
Factor1 = pi*d/lamda*sin(theta);
AF = 20*log10(abs(sin(N*(Factor1-phy/2))./(N*sin(Factor1-phy/2))));
AF_pol_10 = ((sin(N*(Factor1-phy/2))./(N*sin(Factor1-phy/2))));

plot(theta*180/pi,AF,'g')

steering_angle =45*pi/180 ;
phy = 2*pi*d.*sin(steering_angle)/lamda;
% AF = 20*log10(abs(sin((N*pi*d/lamda)*(sin(theta)-sin(steering_angle)))./(N*sin(pi*d/lamda*(sin(theta)-sin(steering_angle))))))
Factor1 = pi*d/lamda*sin(theta);
AF = 20*log10(abs(sin(N*(Factor1-phy/2))./(N*sin(Factor1-phy/2))))
AF_pol_45 = ((sin(N*(Factor1-phy/2))./(N*sin(Factor1-phy/2))))
plot(theta*180/pi,AF,'y')


steering_angle =-50*pi/180 ;
phy = 2*pi*d.*sin(steering_angle)/lamda;
% AF = 20*log10(abs(sin((N*pi*d/lamda)*(sin(theta)-sin(steering_angle)))./(N*sin(pi*d/lamda*(sin(theta)-sin(steering_angle))))))
Factor1 = pi*d/lamda*sin(theta);
AF = 20*log10(abs(sin(N*(Factor1-phy/2))./(N*sin(Factor1-phy/2))))
plot(theta*180/pi,AF,'m')
xlabel('Angle(\theta)')
ylabel('Array Factor(dB)') 
AF_pol_m50 = ((sin(N*(Factor1-phy/2))./(N*sin(Factor1-phy/2))))
legend('\theta = 0','\theta = 10','\theta = 45','\theta =-50');
figure
%% Plotting the beams in polar plot 
subplot(2,2,1)
polarplot(theta,AF_pol_0);
title('0^{\circ} steering')
ax = gca;
d = ax.ThetaDir;
ax.ThetaDir = 'clockwise';
ax.ThetaTickLabel = {'0','30','60','90','120','150','180','-150','-120','-90','-60','-30'};

subplot(2,2,2)
polarplot(theta,AF_pol_10);
title('10^{\circ} steering')
ax = gca;
d = ax.ThetaDir;
ax.ThetaDir = 'clockwise';
ax.ThetaTickLabel = {'0','30','60','90','120','150','180','-150','-120','-90','-60','-30'};

subplot(2,2,3)
polarplot(theta,AF_pol_45);
title('45^{\circ} steering')
ax = gca;
d = ax.ThetaDir;
ax.ThetaDir = 'clockwise';
ax.ThetaTickLabel = {'0','30','60','90','120','150','180','-150','-120','-90','-60','-30'};

subplot(2,2,4)
polarplot(theta,AF_pol_m50);
title('-50^{\circ} steering')
ax = gca;
d = ax.ThetaDir;
ax.ThetaDir = 'clockwise';
ax.ThetaTickLabel = {'0','30','60','90','120','150','180','-150','-120','-90','-60','-30'};