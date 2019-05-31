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
bar(M);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('time/memory/error', 'FontSize', 14);
title('Comparison of all data in matlab', 'FontSize', 14);
legend('windows time', 'ubuntu time', 'windows after loading matrix', 'ubuntu after loading matrix', ...
       'windows after solving the system', 'ubuntu after solving the system', 'windows relative error', 'ubuntu relative error')
grid

%% eigen comparison 
%             time               memory after       memory end          error
E = [0.117758,    0.179619,   4.592,  4.824,    7.676,   7.628,  8.85e-07, 8.85e-07;
   105.131138,  142.35,      16.164, 26.568,  442.004, 464.432,  2.53e-12, 2.53e-12;
     2.979669,    3.525138,   7.736,  9.296,   37.124,  39.988,  2.78e-16, 2.78e-16;
   334.027758,  640,         24.680, 42.508,  893.140, 913.424,  5.58e-12, 5.59e-12;
    55.008611,   77.029069,  31.612, 42.360,  477.380, 523.956,  2.77e-12, 2.77e-12;
  1321.005847, 1792.47654,   40.120, 55.100, 2630.880, 2716.200, 7.66e-11, 7.66e-11;
   633.13135,   841.002646,  65.320, 82.420, 2120.600, 2148.580, 7.57e-12, 7.57e-12];

figure(2)
bar(E);
set(gca,'YScale','log')
set(gca,'xticklabel', matrices)
xlabel('size', 'FontSize', 14);
ylabel('time/memory/error', 'FontSize', 14);
title('Comparison of all data in eigen', 'FontSize', 14);
legend('windows time', 'ubuntu time', 'windows after loading matrix', 'ubuntu after loading matrix', ...
       'windows after solving the system', 'ubuntu after solving the system', 'windows relative error', 'ubuntu relative error')
grid

%% windows comparison 



%% ubuntu comparison