% Carlo Radice 807159

% preliminary operations
clc;
clear;

% Allow to get the values of memory more easily
pause(10)

% load matrix in windows
load('C:\Users\carloradice\Documents\MCSLinearSystemSolverMatrici\matrici\cfd2\cfd2.mat');
%load matrix in ubuntu
%load('/home/carloradice/Documents/magistrale/metodi_del_calcolo_scientifico/MCSLinearSystemSolverMatrici/matrici/cfd2/cfd2.mat')

% Allow to get the values of memory more easily
pause(10)

A = Problem.A;
% exact solution
xe = ones(size(A, 1), 1);
b = A * xe;

% calculate x from A and b
x = A \ b;

% time to calculate x 
f = @() A \ b;
t_x = timeit(f);

% calculate relative error
rel_error = norm(x - xe) / norm(xe);