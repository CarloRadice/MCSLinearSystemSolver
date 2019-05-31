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

%% virtual memory comparison matlab
% matlab virtual memory
% windows after - ubuntu after - windows end - ubuntu end
MV = [1060.609, 8368.922, 1060.734, 8467.941;
      1188.191, 8439.223, 1190.914, 8603.242;
      1067.75,  8369.738, 1128.102, 8532.758;
      1208.695, 8425.957, 1216.137, 8653.977;
      1218.625, 8414.809, 1230.613, 8707.828;
      1227.652, 8446.266, 1244.387, 8673.285;
      1286.98,  8486.637, 1322.277, 8713.695];
  
figure(2)
hb = bar(MV);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(MV(:,1),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(MV(:,2),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(MV(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(MV(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('virtual memory usage (MB)', 'FontSize', 14);
title('Comparison of virtual memory usage in matlab', 'FontSize', 14);
legend('windows after loading the matrix', 'ubuntu after loading the matrix', 'windows after solving the system', 'ubuntu after solving the system')
grid

%% physical and virtual memory comparison matlab
%      wpi     upi       wvi      uvi       wpe      upe      wve       uve
MPV = [640.57, 1167.16, 1060.609, 8368.922, 640.72,  1210.34, 1060.734, 8467.941;
      673.50, 1203.87, 1188.191, 8439.223, 678.96,  1326.99, 1190.914, 8603.242;
      659.43, 1154.89, 1067.75,  8369.738, 674.42,  1249.63, 1128.102, 8532.758;
      671.32, 1251.71, 1208.695, 8425.957, 679.31,  1351.54, 1216.137, 8653.977;
      733.05, 1199.94, 1218.625, 8414.809, 745.20,  1383.32, 1230.613, 8707.828;
      756.01, 1206.59, 1227.652, 8446.266, 772.77,  1363.17, 1244.387, 8673.285;
      782.28, 1283.52, 1286.98,  8486.637  803.98,  1442.83, 1322.277, 8713.695];
  
figure(3)
bar(MPV);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('memory usage (MB)', 'FontSize', 14);
title('Comparison of memory usage in matlab', 'FontSize', 14);
legend('windows physical after loading the matrix', 'ubuntu physical after loading the matrix', ...
       'windows virtual after loading the matrix', 'ubuntu virtual after loading the matrix', ...
       'windows physical after solving the system', 'ubuntu physical after solving the system', ...
       'windows virtual after solving the system', 'ubuntu virtual after solving the system')
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

figure(4)
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

%% virtual memory comparison eigen (c++)
% eigen virtual memory 
% windows after - ubuntu after - windows end - ubuntu end
CV = [1.700, 15.592,    4.884,   18.488;
     13.536, 37.332,  440.088,  475.212;
      5.780, 34.332,   20.008,   50.896;
     22.088, 53.328,  892.568,  924.128;
     28.800, 53.232,  475.396,  534.704;
     37.276, 65.860, 2679.030, 2729.776;
     62.572, 93.204, 2120.600, 2165.336];

figure(5)
hb = bar(CV);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(CV(:,1),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(CV(:,2),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(CV(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(CV(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('virtual memory usage (MB)', 'FontSize', 14);
title('Comparison of virtual memory usage in eigen (c++)', 'FontSize', 14);
legend('windows after loading the matrix', 'ubuntu after loading the matrix', 'windows after solving the system',  'ubuntu after solving the system')
grid
   
%% physical and virtual memory comparison eigen (c++)
CPV = [4.59,  4.82, 1.700, 15.592, 7.68, 7.63, 4.884,   18.488;
     16.164, 26.568, 13.536, 37.332, 442.004, 464.432, 440.088,  475.212;
      7.736,  9.296, 5.780, 34.332, 37.124,  39.988, 20.008,   50.896;
     24.680, 42.508,  22.088, 53.328, 893.140, 913.424, 892.568,  924.128;
     31.612, 42.360,  28.800, 53.232,  477.380, 523.956, 475.396,  534.704;
     40.120, 55.100, 37.276, 65.860, 2630.00, 2716.20, 2679.030, 2729.776;
     65.320, 82.420, 62.572, 93.204,  2120.00, 2148.58, 2120.600, 2165.336];

figure(6)
bar(CPV);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('memory usage (MB)', 'FontSize', 14);
title('Comparison of memory usage in eigen (c++)', 'FontSize', 14);
legend('windows physical after loading the matrix', 'ubuntu physical after loading the matrix', ...
       'windows virtual after loading the matrix', 'ubuntu virtual after loading the matrix', ...
       'windows physical after solving the system', 'ubuntu physical after solving the system', ...
       'windows virtual after solving the system', 'ubuntu virtual after solving the system')
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

figure(7)
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

%% virtual memory comparison windows
WV = [1060.609,  1.700, 1060.734,   4.884;
      1188.191, 13.536, 1190.914, 440.088;
      1067.75,   5.780, 1128.102,  34.332;
      1208.695, 22.088, 1216.137, 892.568;
      1218.625, 28.800, 1230.613, 475.396;
      1227.652, 37.276, 1244.387, 2679.03;
      1286.98,  62.572, 1322.277, 2120.60];

figure(8)
hb = bar(WV);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(WV(:,1),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(WV(:,2),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(WV(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(WV(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('virtual memory usage (MB)', 'FontSize', 14);
title('Comparison of virtual memory usage in Windows', 'FontSize', 14);
legend('matlab after loading the matrix', 'eigen after loading the matrix', 'matlab after solving the system',  'eigen after solving the system')
grid

%% physical and virtual memory comparison in windows 
WPV = [640.586,  4.592, 1060.609,  1.700, 640.723,   7.676, 1060.734,   4.884;
      673.504, 16.164,  1188.191, 13.536, 678.957, 442.004, 1190.914, 440.088;
      659.426,  7.736,  1067.75,   5.780, 674.418,  37.124,  1128.102,  34.332;
      671.32,  24.680, 1208.695, 22.088,  679.312, 893.140,1216.137, 892.568;
      733.047, 31.612,  1218.625, 28.800,745.199, 477.380, 1230.613, 475.396;
      756.008, 40.120,  1227.652, 37.276, 772.77, 2630.880, 1244.387, 2679.03;
      782.277, 65.320,  1286.98,  62.572, 803.98, 2120.600, 1322.277, 2120.60];

figure(9)
bar(WPV);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('memory usage (MB)', 'FontSize', 14);
title('Comparison of memory usage in Windows', 'FontSize', 14);
legend('matlab physical after loading the matrix', 'eigen physical after loading the matrix', ...
       'matlab virtual after loading the matrix', 'eigen virtual after loading the matrix', ...
       'matlab physical after solving the system', 'eigen physical after solving the system', ...
       'matlab virtual after solving the system', 'eigen virtual after solving the system')
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

figure(10)
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

%% virtual memory comparison ubuntu
UV = [8368.922, 15.592, 8467.941,   18.488;
      8439.223, 37.332, 8603.242,  475.212;
      8369.738, 20.008, 8532.758,   50.896;
      8425.957, 53.328, 8653.977,  924.128;
      8414.809, 53.232, 8707.828,  534.704;
      8446.266, 65.860, 8673.285, 2729.776;
      8486.637, 93.204, 8713.695, 2165.336];

figure(11)
hb = bar(UV);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)

for i=length(hb)
     text(hb(i).XData-hb(i).XOffset, hb(1).YData, num2str(UV(:,1),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData-(hb(i).XOffset/3), hb(2).YData, num2str(UV(:,2),'%.1f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+(hb(i).XOffset/3), hb(3).YData, num2str(UV(:,3),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
     text(hb(i).XData+hb(i).XOffset, hb(4).YData, num2str(UV(:,4),'%.f'),  'VerticalAlignment','bottom','horizontalalign','center');
end

xlabel('size', 'FontSize', 14);
ylabel('virtual memory usage (MB)', 'FontSize', 14);
title('Comparison of virtual memory usage in Ubuntu', 'FontSize', 14);
legend('matlab after loading the matrix', 'eigen after loading the matrix', 'matlab after solving the system',  'eigen after solving the system')
grid

%% physical and virtual memory comparison in ubuntu
UPV = [1167.16,  4.824, 8368.922, 15.592, 1210.34,   7.628, 8467.941,   18.488;
     1203.879, 26.568, 8439.223, 37.332, 1326.988, 464.432, 8603.242,  475.212;
     1154.887,  9.296,  8369.738, 20.008, 1249.629,  39.988, 8532.758,   50.896;
     1251.707, 42.508, 8425.957, 53.328, 1351.543, 913.424, 8653.977,  924.128;
     1199.938, 42.360, 8414.809, 53.232, 1383.32,  523.956, 8707.828,  534.704;
      1206.59, 55.100,  8446.266, 65.860, 1363.172, 2716.20, 8673.285, 2729.776;
      1283.52, 82.420,  8486.637, 93.204, 1442.832, 2148.580, 8713.695, 2165.336];

figure(12)
bar(UPV);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('memory usage (MB)', 'FontSize', 14);
title('Comparison of memory usage in Ubuntu', 'FontSize', 14);
legend('matlab physical after loading the matrix', 'eigen physical after loading the matrix', ...
       'matlab virtual after loading the matrix', 'eigen virtual after loading the matrix', ...
       'matlab physical after solving the system', 'eigen physical after solving the system', ...
       'matlab virtual after solving the system', 'eigen virtual after solving the system')
grid
