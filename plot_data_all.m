%% Carlo Radice 807159
% preliminary operations 
clc;
clear;

% matrices by dimension
matrices = {'ex15'; 'cfd1'; 'shallow water1'; 'cfd2'; 'parabolic fem'; 'apache2'; 'G3 circuit'};       

%% matlab comparison
%             time               memory after                        memory end                              error
M = [0.017734521, 0.014318337, 640.586, 1167.16, 1060.609, 8368.922, 640.723, 1210.34, 1060.734, 8467.94, 6.80e-07, 6.65e-07;
     1.180708364, 0.948813678, 673.504, 1203.879, 1188.191, 8439.223, 678.957, 1326.988, 1190.914, 8603.242, 9.45e-14, 1.25e-13;
     0.233167121, 0.191328558, 659.426, 1154.887, 1067.75,  8369.738,   674.418, 1249.629, 1128.102, 8532.758,    2.38e-16, 2.38e-16;
     2.894299349, 2.186816678, 671.32,  1251.707, 1208.695, 8425.957,  679.312, 1351.543, 1216.137, 8653.977, 4.13e-13, 3.93e-13;
     1.701053164, 1.696192678, 733.047, 1199.938,  1218.625, 8414.809, 745.199, 1383.32,   1230.613, 8707.828, 1.09e-12, 1.09e-12;
     7.160670664, 8.641368678, 756.008, 1206.59, 1227.652, 8446.266,  772.77, 1363.172,  1244.387, 8673.285, 4.37e-11, 4.37e-11;
     9.678053964, 8.396894678, 782.277, 1283.52,   1286.98,  8486.637, 803.984, 1442.832, 1322.277, 8713.695, 3.52e-12, 3.52e-12];
 
figure(1)
bar(M);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('time/memory/error', 'FontSize', 14);
title('Comparison of all data in matlab', 'FontSize', 14);
legend('windows time', 'ubuntu time', ...
       'windows physical after loading matrix', 'ubuntu physical after loading matrix', ...
       'windows virtual after loading matrix', 'ubuntu virtual after loading matrix', ...
       'windows physical after solving the system', 'ubuntu physical after solving the system', ...
       'windows virtual after solving the system', 'ubuntu virtual after solving the system', ...
       'windows relative error', 'ubuntu relative error')
grid

%% eigen comparison 
%             time               memory after               memory end                   error
E = [0.117758,    0.179619,   4.592,  4.824, 1.700, 15.592, 7.676,   7.628, 4.884,   18.48, 8.85e-07, 8.85e-07;
   105.131138,  142.35,      16.164, 26.568, 13.536, 37.332, 442.004, 464.432, 440.088,  475.212, 2.53e-12, 2.53e-12;
     2.979669,    3.525138,   7.736,  9.296, 5.780, 34.332,   37.124,  39.988,  20.008,   50.896,  2.78e-16, 2.78e-16;
   334.027758,  640,         24.680, 42.508, 22.088, 53.328, 893.140, 913.424,  892.568,  924.128, 5.58e-12, 5.59e-12;
    55.008611,   77.029069,  31.612, 42.360,   28.800, 53.232, 477.380, 523.956, 475.396,  534.704, 2.77e-12, 2.77e-12;
  1321.005847, 1792.47654,   40.120, 55.100, 37.276, 65.860, 2630.880, 2716.200, 2679.030, 2729.776, 7.66e-11, 7.66e-11;
   633.13135,   841.002646,  65.320, 82.420,  62.572, 93.204, 2120.600, 2148.580, 2120.600, 2165.336, 7.57e-12, 7.57e-12];

figure(2)
bar(E);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('time/memory/error', 'FontSize', 14);
title('Comparison of all data in eigen', 'FontSize', 14);
legend('windows time', 'ubuntu time', ...
       'windows physical after loading matrix', 'ubuntu physical after loading matrix', ...
       'windows virtual after loading matrix', 'ubuntu virtual after loading matrix', ...
       'windows physical after solving the system', 'ubuntu physical after solving the system', ...
       'windows virtual after solving the system', 'ubuntu virtual after solving the system', ...
       'windows relative error', 'ubuntu relative error')
grid

%% windows comparison 
W = [0.0177, 0.1796, 640.586,  4.592, 1060.609,  1.700, 640.723,   7.676, 1060.734,   4.884, 6.80e-07, 8.85e-07;
     1.1807, 105.13, 673.504, 16.164,  1188.191, 13.536, 678.957, 442.004, 1190.914, 440.088, 9.45e-14, 2.53e-12;
     0.2331, 2.9796, 659.426,  7.736,  1067.75,   5.780, 674.418,  37.124,  1128.102,  34.332, 2.38e-16, 2.78e-16;
     2.8942, 334.02, 671.32,  24.680, 1208.695, 22.088,  679.312, 893.140,1216.137, 892.568,  4.13e-13, 5.58e-12;
     1.7010, 55.008, 733.047, 31.612,  1218.625, 28.800,745.199, 477.380, 1230.613, 475.396, 1.09e-12, 2.77E-12;
     7.1606, 1321.0, 756.008, 40.120,  1227.652, 37.276, 772.77, 2630.880, 1244.387, 2679.03, 4.37E-11, 7.66E-11;
     9.6780, 633.13, 782.277, 65.320,  1286.98,  62.572, 803.98, 2120.600, 1322.277, 2120.60, 3.52E-12, 7.57E-12];

figure(3)
bar(W);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('time/memory/error', 'FontSize', 14);
title('Comparison of all data in windows', 'FontSize', 14);
legend('matlab time', 'eigen time', ...
       'matlab physical after loading matrix', 'eigen physical after loading matrix', ...
       'matlab virtual after loading matrix', 'eigen virtual after loading matrix', ...
       'matlab physical after solving the system', 'eigen physical after solving the system', ...
       'matlab virtual after solving the system', 'eigen virtual after solving the system', ...
       'matlab relative error', 'eigen relative error')
grid 
 
%% ubuntu comparison
U = [0.0143, 0.1177, 1167.16,  4.824, 8368.922, 15.592, 1210.34,   7.628, 8467.941,   18.488, 6.65E-07, 8.85E-07;
    0.9488, 142.35, 1203.879, 26.568, 8439.223, 37.332, 1326.988, 464.432, 8603.242,  475.212, 1.25E-13, 2.53E-12;
    0.1913, 3.5251, 1154.887,  9.296,  8369.738, 20.008, 1249.629,  39.988, 8532.758,   50.896,  2.38E-16, 2.78E-16;
    2.1868, 640,  1251.707, 42.508, 8425.957, 53.328, 1351.543, 913.424, 8653.977,  924.128,  3.93E-13, 5.59E-12;
    1.6961, 77.029, 1199.938, 42.360, 8414.809, 53.232, 1383.32,  523.956, 8707.828,  534.704, 1.09E-12, 2.77E-12;
    8.6413, 1792.4, 1206.59, 55.100,  8446.266, 65.860, 1363.172, 2716.20, 8673.285, 2729.776, 4.37E-11, 7.66E-11;
    8.3968, 841.00, 1283.52, 82.420,  8486.637, 93.204, 1442.832, 2148.580, 8713.695, 2165.336, 3.52E-12, 7.57E-12];

figure(4)
bar(U);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('time/memory/error', 'FontSize', 14);
title('Comparison of all data in ubuntu', 'FontSize', 14);
legend('matlab time', 'eigen time', ...
       'matlab physical after loading matrix', 'eigen physical after loading matrix', ...
       'matlab virtual after loading matrix', 'eigen virtual after loading matrix', ...
       'matlab physical after solving the system', 'eigen physical after solving the system', ...
       'matlab virtual after solving the system', 'eigen virtual after solving the system', ...
       'matlab relative error', 'eigen relative error')
grid 
