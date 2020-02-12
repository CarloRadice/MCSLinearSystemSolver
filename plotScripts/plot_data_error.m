%% Carlo Radice 807159
%% Metodi del Calcolo Scientifico
%% A.A 2018/2019

% preliminary operations 
clc;
clear;

% matrices by dimension
matrices = {'ex15'; 'cfd1'; 'shallow water1'; 'cfd2'; 'parabolic fem'; 'apache2'; 'G3 circuit'};       

%% relative error comparison matlab
% matlab relative error
%     windows    ubuntu
ME = [6.80e-07, 6.65e-07;
      9.45e-14, 1.25e-13;
      2.38e-16, 2.38e-16;
      4.13e-13, 3.93e-13;
      1.09e-12, 1.09e-12;
      4.37e-11, 4.37e-11;
      3.52e-12, 3.52e-12];

figure(1)
hb = bar(ME);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(ME(:,1),'%.1e'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(2).YData, num2str(ME(:,2),'%.1e'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('value', 'FontSize', 14);
title('Comparison of relative error values using matlab', 'FontSize', 14);
legend('windows relative error', 'ubuntu relative error')
grid

%% relative error comparison eigen (c++)
% eigen relative error 
%     windows    ubuntu
EE = [8.85e-07, 8.85e-07;
      2.53e-12, 2.53e-12;
      2.78e-16, 2.78e-16;
      5.58e-12, 5.59e-12;
      2.77e-12, 2.77e-12;
      7.66e-11, 7.66e-11;
      7.57e-12, 7.57e-12];
  
figure(2)
hb = bar(EE);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(EE(:,1),'%.1e'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(2).YData, num2str(EE(:,2),'%.1e'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('value', 'FontSize', 14);
title('Comparison of relative error values using eigen (c++)', 'FontSize', 14);
legend('windows relative error', 'ubuntu relative error')
grid

%% relative error comparison windows
% windows relative error
%      matlab     eigen
WE = [6.80e-07, 8.85e-07;
      9.45e-14, 2.53e-12;
      2.38e-16, 2.78e-16;
      4.13e-13, 5.58e-12;
      1.09e-12, 2.77E-12;
      4.37E-11, 7.66E-11;
      3.52E-12, 7.57E-12];

figure(3)
hb = bar(WE);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(WE(:,1),'%.1e'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(2).YData, num2str(WE(:,2),'%.1e'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('value', 'FontSize', 14);
title('Comparison of relative error values in windows', 'FontSize', 14);
legend('matlab relative error', 'eigen relative error')
%grid

%% relative error comparison ubuntu
% ubuntu relative error 
%      matlab     eigen
UE = [6.65E-07, 8.85E-07;
      1.25E-13, 2.53E-12;
      2.38E-16, 2.78E-16;
      3.93E-13, 5.59E-12;
      1.09E-12, 2.77E-12;
      4.37E-11, 7.66E-11;
      3.52E-12, 7.57E-12];
 
figure(4)
hb = bar(WE);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(WE(:,1),'%.1e'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(2).YData, num2str(WE(:,2),'%.1e'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('value', 'FontSize', 14);
title('Comparison of relative error values in ubuntu', 'FontSize', 14);
legend('matlab relative error', 'eigen relative error')
grid
