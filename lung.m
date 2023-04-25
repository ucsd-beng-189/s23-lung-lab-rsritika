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

%% Task 5

c_all = [];

for cI = linspace(cref/1.5,cref,5)
    setup_lung
    cvsolve
    outchecklung

    figure(6)
    subplot (2,1,1)
    hold on
    plot(cI,Pv,'ro') % oxygen partial pressure in venous blood
    plot(cI,Pabar,'go') % mean arterial oxygen partial pressure
    plot(cI,PAbar,'bo') % mean alveolar oxygen partial pressure
    xlabel('Oxygen Concentration in the Inspired Air')
    ylabel('Oxygen Pressure')

    subplot (2,1,2)
    hold on
    plot(cI,cv,'ro') % concentrations of oxygen in venous blood
    plot(cI,cabar,'go') % mean arterial oxygen concentration
    plot(cI,cAbar,'bo') % mean alveolar oxygen concentration
    xlabel('Oxygen Concentration in the Inspired Air')
    ylabel('Oxygen Concentration')

    c_all(end+1) = cI;
end

%% Task 6

alt = 0:5:3360;

for i = 1:5
    setup_lung
    cvsolve
    outchecklung

    figure(7)
    subplot (2,1,1)
    hold on
    plot(alt(i),Pv,'ro') % oxygen partial pressure in venous blood
    plot(alt(i),Pabar,'go') % mean arterial oxygen partial pressure
    plot(alt(i),PAbar,'bo') % mean alveolar oxygen partial pressure
    xlabel('Altitude (m)')
    ylabel('Oxygen Pressure')

    subplot (2,1,2)
    hold on
    plot(alt(i),cv,'ro') % concentrations of oxygen in venous blood
    plot(alt(i),cabar,'go') % mean arterial oxygen concentration
    plot(alt(i),cAbar,'bo') % mean alveolar oxygen concentration
    xlabel('Altitude (m)')
    ylabel('Oxygen Concentration')
end

%% Task 8

for beta = 0:0.1:1
    setup_lung
    cvsolve
    outchecklung

    figure(8)
    hold on
    plot(beta,r, 'ro') 
end
title('Beta vs Ventilation/Perfusion Matching')
xlabel('Beta')
ylabel('Ventilation/Perfusion')

%% Task 9

cstar_all = [];

for cstar = linspace(cref/2,cref,5)
    setup_lung
    cvsolve
    outchecklung

    figure(9)
    subplot (2,1,1)
    hold on
    plot(cstar,Pv,'ro') % oxygen partial pressure in venous blood
    plot(cstar,Pabar,'go') % mean arterial oxygen partial pressure
    plot(cstar,PAbar,'bo') % mean alveolar oxygen partial pressure
    xlabel('Blood Oxygen Concentration at full Hemoglobin Saturation')
    ylabel('Oxygen Pressure')

    subplot (2,1,2)
    hold on
    plot(cstar,cv,'ro') % concentrations of oxygen in venous blood
    plot(cstar,cabar,'go') % mean arterial oxygen concentration
    plot(cstar,cAbar,'bo') % mean alveolar oxygen concentration
    xlabel('Blood Oxygen Concentration at full Hemoglobin Saturation')
    ylabel('Oxygen Concentration')

    cstar_all(end+1) = cstar
end


%% Task 10

alt = 0:5:4400;

for i = 1:5
    setup_lung
    cvsolve
    outchecklung

    figure(10)
    subplot (2,1,1)
    hold on
    plot(alt(i),Pv,'ro') % oxygen partial pressure in venous blood
    plot(alt(i),Pabar,'go') % mean arterial oxygen partial pressure
    plot(alt(i),PAbar,'bo') % mean alveolar oxygen partial pressure
    xlabel('Altitude (m)')
    ylabel('Oxygen Pressure')

    subplot (2,1,2)
    hold on
    plot(alt(i),cv,'ro') % concentrations of oxygen in venous blood
    plot(alt(i),cabar,'go') % mean arterial oxygen concentration
    plot(alt(i),cAbar,'bo') % mean alveolar oxygen concentration
    xlabel('Altitude (m)')
    ylabel('Oxygen Concentration')
end
