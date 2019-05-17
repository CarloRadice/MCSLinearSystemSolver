clc;
clear;

matrix = dir('/home/carloradice/Documents/magistrale/metodi_del_calcolo_scientifico/MCSLinearSystemSolverMatrici/matrici/ex15/ex15.mat');
size = matrix.bytes;
file = fopen('matlabData/ubuntu/ex15_01.txt');
s = textscan(file, '%f %f %f %f', 'headerlines', 1);
fclose(file);
time = s{1};
cpu = s{2};
real_memory = s{3};
virtual_memory = s{4};

figure
semilogy(size, 0.0143183365, size, 1286.875, size, 6.65E-07);
xlabel('size')
legend('time', 'memory', 'relErr')
