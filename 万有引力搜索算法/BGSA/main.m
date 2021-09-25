% Main function for using BGSA algorithm.
clear all;clc
%  inputs:
% N:  Number of agents.
% max_it: Maximum number of iterations (T).
% ElitistCheck: If ElitistCheck=1, algorithm runs with Kbest.
% F_index: The index of the test function. See tables 1,2,3 of the mentioned article.
%          Insert your own objective function with a new F_index in 'test_functions.m'
%          and 'test_functions_range.m'.
%  outputs:
% Fbest: Best result. 
% Lbest: Best solution. The location of Fbest in search space.
% BestChart: The best so far Chart over iterations. 
% MeanChart: The average fitnesses Chart over iterations.

 
 %-------------maximization of max-ones and royal-road--------------
 N=50; 
 max_it=1000; 
 ElitistCheck=1; Rpower=1;
 F_index=25  % 24: max-ones, 25: royal-road
 min_flag=0; % 1: minimization, 0: maximization

 [Fbest,Lbest,BestChart,MeanChart]=BGSA(F_index,N,max_it,ElitistCheck,min_flag,Rpower);
 
 Fbest
 
 figure;plot(BestChart,'--k');
 title(['\fontsize{12}\bf F',num2str(F_index)]);
 xlabel('\fontsize{12}\bf Iteration');ylabel('\fontsize{12}\bf Best-so-far');
 legend('\fontsize{10}\bf BGSA',1);
 
 


