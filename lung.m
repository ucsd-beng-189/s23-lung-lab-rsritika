%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;

M_all = [];
beta_all = [];

for beta = 0:0.1:1
    setup_lung
    cvsolve
    outchecklung

    % Task 3
    figure(4)
    hold on
    plot(beta,Pv, 'ro') % oxygen partial pressure in venous blood
    plot(beta,Pabar, 'go') % mean arterial oxygen partial pressure
    plot(beta,PAbar, 'bo') % mean alveolar oxygen partial pressure
    plot(beta,PI, 'mo') % oxygen partial pressure in the inspired air

    % Task 4
    Md=M-Q'*(carterial(cv,r)-cv)
    M_all(end+1) = Md;
    beta_all(end+1) = beta;

end
title('Beta vs Partial Pressure of Oxygen')
xlabel('Beta')
ylabel('Partial Pressure')

% Task 4
figure(5)
plot(beta_all, M_all, 'bo')
title('Beta vs Rate of Oxygen Consumption')
xlabel('Beta')
ylabel('Rate of Oxygen Consumption')
