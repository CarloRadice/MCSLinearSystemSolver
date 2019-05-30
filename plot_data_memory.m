%% Carlo Radice 807159
% preliminary operations 
clc;
clear;

% matrices by dimension
matrices = {'ex15'; 'cfd1'; 'shallow water1'; 'cfd2'; 'parabolic fem'; 'apache2'; 'G3 circuit'};       

%% physical memory comparison matlab
% matlab physical memory
% windows after - ubuntu after - windows end - ubuntu end
MP = [640.57, 1167.16, 640.72,  1210.34;
      673.50, 1203.87, 678.96,  1326.99;
      659.43, 1154.89, 674.42,  1249.63;
      671.32, 1251.71, 679.31,  1351.54;
      733.05, 1199.94, 745.20,  1383.32;
      756.01, 1206.59, 772.77,  1363.17;
      782.28, 1283.52, 803.98,  1442.83];
  
figure(1)
hb = bar(MP);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(MP(:,1),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(MP(:,2),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(MP(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(MP(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('physical memory usage (MB)', 'FontSize', 14);
title('Comparison of physical memory usage in matlab', 'FontSize', 14);
legend('windows after loading the matrix', 'ubuntu after loading the matrix', 'windows after solving the system', 'ubuntu after solving the system')
grid
  
%% physical memory comparison eigen (c++)  
% eigen physical memory
% windows after - ubuntu after - windows end - ubuntu end
CP = [4.59,  4.82,   7.68,   7.63;
     16.164, 26.568, 442.004, 464.432;
      7.736,  9.296,  37.124,  39.988;
     24.680, 42.508, 893.140, 913.424;
     31.612, 42.360, 477.380, 523.956;
     40.120, 55.100, 2630.00, 2716.20;
     65.320, 82.420, 2120.00, 2148.58];

figure(2)
hb = bar(CP);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(CP(:,1),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(CP(:,2),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(CP(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(CP(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('physical memory usage (MB)', 'FontSize', 14);
title('Comparison of physical memory usage in eigen (c++)', 'FontSize', 14);
legend('windows after loading the matrix', 'ubuntu after loading the matrix', 'windows after solving the system',  'ubuntu after solving the system')
grid

%% physical memory comparison windows
% windows physical memory
% matlab after - eigen after - matlab end - eigen end 
WP = [640.586,  4.592, 640.723,   7.676;
      673.504, 16.164, 678.957, 442.004;
      659.426,  7.736, 674.418,  37.124;
      671.32,  24.680, 679.312, 893.140;
      733.047, 31.612, 745.199, 477.380;
      756.008, 40.120, 772.77, 2630.880;
      782.277, 65.320, 803.98, 2120.600];

figure(3)
hb = bar(WP);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(WP(:,1),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(WP(:,2),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(WP(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(WP(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('physical memory usage (MB)', 'FontSize', 14);
title('Comparison of physical memory usage in Windows', 'FontSize', 14);
legend('matlab after loading the matrix', 'eigen after loading the matrix', 'matlab after solving the system',  'eigen after solving the system')
grid

%% physical memory comparison ubuntu
% ubuntu physical memory
% matlab after - eigen after - matlab end - eigen end 
UP = [1167.16,  4.824,  1210.34,   7.628;
     1203.879, 26.568, 1326.988, 464.432;
     1154.887,  9.296, 1249.629,  39.988;
     1251.707, 42.508, 1351.543, 913.424;
     1199.938, 42.360, 1383.32,  523.956;
      1206.59, 55.100, 1363.172, 2716.20;
      1283.52, 82.420, 1442.832, 2148.580];

figure(4)
hb = bar(UP);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(UP(:,1),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(UP(:,2),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(UP(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(UP(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('physical memory usage (MB)', 'FontSize', 14);
title('Comparison of physical memory usage in Ubuntu', 'FontSize', 14);
legend('matlab after loading the matrix', 'eigen after loading the matrix', 'matlab after solving the system',  'eigen after solving the system')
grid
