function M2Plots_001_23(coolNoisy, heatNoisy, cn_model, hn_model)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Plots calculated values alongside given calibration data.
%
% Function Call
% M2Plots_001_23
%
% Input Arguments
% noiseheat, the calibration data for noisy heating
% noisecool, the calibration data for noisy cooling
%
% Output Arguments
% none
%
% Assignment Information
%   Assignment:       	Milestone 2
%   Author:             Charlie Wu, wu1292@purdue.edu
%                       Zhibo Hou, hou70@purdue.edu
%                       Nicolas Fransen, nfrasen@purdue.edu
%   Team ID:            001-23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ____________________
%% INITIALIZATION 
figure;
sgtitle("Parameter Values Plotted with Calibration Data")

subplot(2,1,1)
plot(heatNoisy(:,1), heatNoisy(:,2), 'ro', heatNoisy(:,1), hn_model, 'k')
title('Noisy Heating')
xlabel('Time (s)')
ylabel('Temperature (C)')
grid on

subplot(2,1,2)
plot(coolNoisy(:,1), coolNoisy(:,2), 'bo', coolNoisy(:,1), cn_model, 'c')
title('Noisy Heating')
xlabel('Time (s)')
ylabel('Temperature (C)')
grid on

%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.