% Carlo Radice 807159

% preliminary operations
clc;
clear;

disp('Memory before loading matrix');
memory
% load matrix
load('C:\Users\carloradice\Documents\MCSLinearSystemSolverMatrici\matrici\flan_1565\Flan_1565.mat');
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