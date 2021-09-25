clc;clear all;close all
% % ===================================================================== %
% % A Gravitational Search Algorithm (demo)                               %
% % ===================================================================== %

help GSA.m
path = pwd;
path = path(1:end);

%% Problem Definition
funcNum =2;
[Lb, Ub, dim] = funcRange(funcNum);  % for objFunc: twenty-three benchmark functions   

%% GSA Parameters
para = struct;
para.NGen=10000;        % Maximum Number of Iterations
para.NP = 100;          % Population Size
para.G0 = 100;         % GSA G0
para.alfa = 20;        % GSA alfa
para.Rpower = 1;       % GSA power of 'R'
para.ElitistCheck=1; 

%% Main function
Nr = 1;
for run = 1:Nr
    rand('state',sum(100*clock))
    tic;
    BestChart = GSA_func('objFunc',para,Lb, Ub, dim,funcNum);       
    t = toc;
    fprintf('R = %2d, time = %3.5f, error = %10.3e\n', run, t, BestChart(end))        
end 


