% Main function for using CKGSA algorithm.
clear all;clc

%  inputs:
% N:  Number of agents.
% max_it: Maximum number of iterations (T).
% ElitistCheck: If ElitistCheck=1, algorithm runs with modified Kbest and
% if =0, runs with Kbest = N.
% Rpower: power of 'R'
% F_index: The index of the test function. See tables I of the mentioned article.
%          Insert your own objective function with a new F_index in 'test_functions.m'
%          and 'test_functions_range.m'.
%            For demonstration, Rosenbrock Function is taken as example

%  outputs:
% Fbest: Best result. 
% Lbest: Best solution. The location of Fbest in search space.
% BestChart: The best so far Chart over iterations. 
% MeanChart: The average fitnesses Chart over iterations.

 N=50; 
 max_it=1000; 
 ElitistCheck=1; Rpower=1;
 min_flag=1; % 1: minimization, 0: maximization

 F_index=1; % Rosenbrock Function
 Variant = 1; % 1: CKGSA, 0: GSA

 [Fbest,Lbest,BestChart,MeanChart] = CKGSA (F_index ,N ,max_it, ElitistCheck, min_flag, Rpower, Variant);
 Fbest

 semilogy(BestChart,'--k');
 title(['\fontsize{12}\bf F',num2str(F_index)]);
 xlabel('\fontsize{12}\bf Iteration');ylabel('\fontsize{12}\bf Best-so-far');
 legend('\fontsize{10}\bf cKGSA',1);

