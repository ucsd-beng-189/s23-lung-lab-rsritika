%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
for beta = 0:0.1:1
    setup_lung
    cvsolve
    outchecklung
    figure(4)
    hold on
    plot(beta,Pv, 'ro') % oxygen partial pressure in venous blood
    plot(beta,Pabar, 'go') % mean arterial oxygen partial pressure
    plot(beta,PAbar, 'bo') % mean alveolar oxygen partial pressure
    plot(beta,PI, 'mo') % oxygen partial pressure in the inspired air
end
title('Beta vs Partial Pressure of Oxygen')
xlabel('Beta')
ylabel('Partial Pressure')
