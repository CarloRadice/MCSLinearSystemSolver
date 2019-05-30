%% Carlo Radice 807159
% preliminary operations 
clc;
clear;

% matrices by dimension
matrices = {'ex15'; 'cfd1'; 'shallow water1'; 'cfd2'; 'parabolic fem'; 'apache2'; 'G3 circuit'};       

%% matlab comparison
%             time               memory after       memory end          error
M = [0.017734521, 0.014318337, 640.586, 1167.16,  640.723, 1210.34,  6.80e-07, 6.65e-07;
     1.180708364, 0.948813678, 673.504, 1203.879, 678.957, 1326.988, 9.45e-14, 1.25e-13;
     0.233167121, 0.191328558, 659.426, 1154.887, 674.418, 1249.629, 2.38e-16, 2.38e-16;
     2.894299349, 2.186816678, 671.32,  1251.707, 679.312, 1351.543, 4.13e-13, 3.93e-13;
     1.701053164, 1.696192678, 733.047, 1199.938, 745.199, 1383.32,  1.09e-12, 1.09e-12;
     7.160670664, 8.641368678, 756.008, 1206.59,  772.77, 1363.172,  4.37e-11, 4.37e-11;
     9.678053964, 8.396894678, 782.277, 1283.52,  803.984, 1442.832, 3.52e-12, 3.52e-12];
 
figure(1)
hb = bar(M);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

% for i=length(hb)
%      text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(M(:,1),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
%      text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(M(:,2),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
%      text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(M(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
%      text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(M(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
%      text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(M(:,5),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
%      text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(M(:,6),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
%      text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(M(:,7),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
%      text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(M(:,8),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
% end

xlabel('size', 'FontSize', 14);
ylabel('time/memory/error', 'FontSize', 14);
title('Comparison of all data in matlab', 'FontSize', 14);
legend('windows time', 'ubuntu time', 'windows after loading matrix', 'ubuntu after loading matrix', ...
       'windows after solving the system', 'ubuntu after solving the system', 'windows relative error', 'ubuntu relative error')
grid







%% eigen comparison 
%% windows comparison 
%% ubuntu comparison