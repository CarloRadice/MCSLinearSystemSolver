% Carlo Radice 807159

% preliminary operations
clc;
clear;

disp('Memory before loading matrix');
memory
% load matrix in windows
load('C:\Users\carloradice\Documents\MCSLinearSystemSolverMatrici\matrici\shallow_water1\shallow_water1.mat');
%load matrix in ubuntu
%load('/home/carloradice/Documents/magistrale/metodi_del_calcolo_scientifico/MCSLinearSystemSolverMatrici/matrici/shallow_water1/shallow_water1.mat')
disp('Memory after loading matrix');
memory

A = Problem.A;
% exact solution
xe = ones(size(A, 1), 1);
b = A * xe;

%time to calculate b
f = @() A * xe; 
t_b = timeit(f);

% calculate x from A and b
x = A \ b;

% time to calculate x 
f = @() A \ b;
t_x = timeit(f);

% calculate relative error
rel_error = norm(x - xe) / norm(xe);