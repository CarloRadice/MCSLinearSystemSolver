%% Carlo Radice 807159
%% Metodi del Calcolo Scientifico
%% A.A 2018/2019

% preliminary operations 
clc;
clear;

% matrices by dimension
matrices = {'ex15'; 'cfd1'; 'shallow water1'; 'cfd2'; 'parabolic fem'; 'apache2'; 'G3 circuit'};       

%% time comparison matlab
% matlab time
%    windows  ubuntu
MT = [0.0177, 0.0143; 
      1.1807, 0.9488;
      0.2331, 0.1913;
      2.8942, 2.1868;
      1.7010, 1.6961;
      7.1606, 8.6413; 
      9.6780, 8.3968];
  
figure(1)
hb = bar(MT);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
    text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(MT(:,1),'%.3f'),  'VerticalAlignment','bottom','horizontalalign','center');
    text(hb(i).XData+hb(i).XOffset, hb(2).YData, num2str(MT(:,2),'%.3f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('time', 'FontSize', 14);
title('Comparison of time required in matlab', 'FontSize', 14);
legend('windows', 'ubuntu')
grid

%% time comparison eigen (c++) 
% eigen time
%    windows  ubuntu
ET = [0.1796, 0.1177;
      105.13, 142.35;
      2.9796, 3.5251;
      334.02, 640;
      55.008, 77.029;
      1321.0, 1792.4;
      633.13, 841.00];

figure(2)
hb = bar(ET);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
    text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(ET(:,1),'%.3f'),  'VerticalAlignment','bottom','horizontalalign','center');
    text(hb(i).XData+hb(i).XOffset, hb(2).YData, num2str(ET(:,2),'%.3f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('time', 'FontSize', 14);
title('Comparison of the time required in eigen (c++)', 'FontSize', 14);
legend('windows', 'ubuntu')
grid

%% time comparison windows
% windows time
%     matlab  eigen (c++)
WT = [0.0177, 0.1796;
      1.1807, 105.13;
      0.2331, 2.9796;
      2.8942, 334.02;
      1.7010, 55.008;
      7.1606, 1321.0;
      9.6780, 633.13];
  
figure(3)
hb = bar(WT);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
    text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(WT(:,1),'%.3f'),  'VerticalAlignment','bottom','horizontalalign','center');
    text(hb(i).XData+hb(i).XOffset, hb(2).YData, num2str(WT(:,2),'%.3f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('time', 'FontSize', 14);
title('Comparison of the time required in windows', 'FontSize', 14);
legend('matlab', 'eigen (c++)')
grid

%% time comparison ubuntu
% ubuntu time 
%     matlab  eigen (c++)
UT = [0.0143, 0.1177;
      0.9488, 142.35;
      0.1913, 3.5251;
      2.1868, 640;
      1.6961, 77.029;
      8.6413, 1792.4;
      8.3968, 841.00];
 
figure(4)
hb = bar(UT);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
    text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(UT(:,1),'%.3f'),  'VerticalAlignment','bottom','horizontalalign','center');
    text(hb(i).XData+hb(i).XOffset, hb(2).YData, num2str(UT(:,2),'%.3f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('time', 'FontSize', 14);
title('Comparison of the time required in ubuntu', 'FontSize', 14);
legend('matlab', 'eigen (c++)')
grid