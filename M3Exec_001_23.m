function M2Exec_001_23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Loads data, distinguishes between heating and cooling, Calls UDFs
%
% Function Call
% M2Exec_001_23
%
% Input Arguments
% None
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:       	M1
%   Author:             Nicolas Fransen, nfransen@purdue.edu
%   Team ID:            001-23      
%  	Contributor: 		    Zhibo Hou, hou70@purdue.edu
%                       Charlie Wu, wu1292@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION 

% Load data
coolNoisy = load("M4_Data_CoolingTimeHistory.csv");
heatNoisy = load("M4_Data_HeatingTimeHistory.csv");

%% ____________________
%% CALCULATIONS & FORMATTED TEXT & FIGURE DISPLAYS


% calculate heating or cooling types for each dataset

cnType = mean(coolNoisy(1:10, 2)) > ...
  mean(coolNoisy((length(coolNoisy) - 10) : length(coolNoisy), 2));
if (cnType)
  cnType = 'cooling';
else
  cnType = 'heating';
end

hnType = mean(heatNoisy(1:10, 2)) > ...
  mean(heatNoisy((length(heatNoisy) - 10) : length(heatNoisy), 2));
if (hnType)
  hnType = "cooling";
else
  hnType = "heating";
end



% get parameters for each dataset
[cn_yl, cn_yh, cn_ts, cn_tau] = M3ParameterID_001_23(coolNoisy(:,1), coolNoisy(:,2), cnType);
[hn_yl, hn_yh, hn_ts, hn_tau] = M3ParameterID_001_23(heatNoisy(:,1), heatNoisy(:,2), hnType);

% get modeled values for each dataset
cn_modeledValues = M2Piecewise_001_23(coolNoisy(:,1), cnType, cn_ts, cn_yl, cn_yh, cn_tau);
hn_modeledValues = M2Piecewise_001_23(heatNoisy(:,1), hnType, hn_ts, hn_yl, hn_yh, hn_tau);

% Call Plot
M2Plots_001_23(coolNoisy, heatNoisy, ...
  cn_modeledValues, hn_modeledValues);

% Call SSE
cn_sse = M3MeanSSEmod_001_23(coolNoisy(:,2), cn_modeledValues)
hn_sse = M3MeanSSEmod_001_23(heatNoisy(:,2), hn_modeledValues)


%% ANALYSIS

%% -- Q1
% Our yh, yl, and ts values were within 0.1 of all of the givens,
% however our tau was slightly incorrect compared to the actual 1.5
%% -- Q2
% All values were calculated to within 0.1 of the actual for clean cooling
%% -- Q3
% Our noisy heating data was calculated to with 0.1 for all parameters besides
% once again the tau value, which was significatly off
%% -- Q4
% Our parameters for noisy cooling were calculated correctly for all values to within 0.1 degrees celcius
%% -- Q5
% We will focues on decreasing our SSE value which is too high for heating data.
%% -- Q6
% A second improvement is to apply more effort towards smoothing the data before running it through our algorithm, in order to minimize SSE 

%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.

