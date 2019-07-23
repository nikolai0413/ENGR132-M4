function[] = M3Stats_001_23(taumatrix)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Calculates the mean and standard deviation of the time constants for each
% thermocouple model.
%
% Function Call
% M3Stats_001_23
%
% Input Arguments
% taumatrix, a matrix of time constants for each model
%
% Output Arguments
% none
%
% Assignment Information
%   Assignment:       	Milestone 3
%   Authors:            Charlie Wu, wu1292@purdue.edu
%                       Nicolas Fransen, nfransen@purdue.edu
%                       Zhibo Hou, hou70@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ____________________
%% INITIALIZATION 
fos1 = taumatrix(:,1); %time constant info for FOS1
fos2 = taumatrix(:,2); %time constant info for FOS2
fos3 = taumatrix(:,3); %time constant info for FOS3
fos4 = taumatrix(:,4); %time constant info for FOS4
fos5 = taumatrix(:,5); %time constant info for FOS5

%% ____________________
%% CALCULATIONS
mean1 = mean(fos1);
mean2 = mean(fos2);
mean3 = mean(fos3);
mean4 = mean(fos4);
mean5 = mean(fos5);

std1 = std(fos1);
std2 = std(fos2);
std3 = std(fos3);
std4 = std(fos4);
std5 = std(fos5);

%% ____________________
%% FORMATTED TEXT DISPLAYS
fprintf('The mean for the FOS1 time constants is %0.3f and the standard deviation is %0.3f.\n',mean1,std1);
fprintf('The mean for the FOS2 time constants is %0.3f and the standard deviation is %0.3f.\n',mean2,std2);
fprintf('The mean for the FOS3 time constants is %0.3f and the standard deviation is %0.3f.\n',mean3,std3);
fprintf('The mean for the FOS4 time constants is %0.3f and the standard deviation is %0.3f.\n',mean4,std4);
fprintf('The mean for the FOS5 time constants is %0.3f and the standard deviation is %0.3f.\n',mean5,std5);
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
