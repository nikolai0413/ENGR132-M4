function M3Exec_001_23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Loads heating and cooling data relevant to Milestone 4. Calls slightly
%     modified Parameter ID function from Milestone 3 to obtain the 
%     parameters for each time history. Calls the piecewise function from 
%     Milestone 2 to model each dataset based on the parameters. Finally calls
%     Plot and SSE functions from Milestone 2 to display the results of the
%     regression.
%
% Function Call
% M3Exec_001_23
%
% Input Arguments
% None
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:       	M3
%   Author:             Nicolas Fransen, nfransen@purdue.edu
%                       Zhibo Hou, hou70@purdue.edu
%                       Charlie Wu, wu1292@purdue.edu
%   Team ID:            001-23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION 

% Load data
coolNoisy = load("M4_Data_CoolingTimeHistory.csv");
heatNoisy = load("M4_Data_HeatingTimeHistory.csv");

cnType = "cooling";
hnType = "heating";

%% ____________________
%% CALCULATIONS & FORMATTED TEXT & FIGURE DISPLAYS

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
M2SSEmod_001_23([coolNoisy(:,2), cn_modeledValues], [heatNoisy(:,2), hn_modeledValues]);


%% ANALYSIS

% Table 1 - Identified Parameters from Heating Time History

    % yL       -4.55 F
    % yh       -3.15 F
    % ts        16 s
    % tau       0.4s 


% Table 2 - Identified Parameters from Cooling Time History

    % yL        0.5 F
    % yH        0.875 F
    % ts        7.9 s
    % tau       0.4 s



%% -- Q1 - Heating Data Analysis

% 1. Comparison of the actual identified parameter values with the target values

% yL: Our calculated yL value is -4.5467 F, rounded matching the target value of 
%     -4.55 F exactly
% yH: Our calculated yH value is -3.1488 F, rounded matching the target value of 
%     -3.15 F exactly
% ts: Our calculated value of ts is 16 s, matching the target value of 16 s
% tau: Our calculated tau value is 0.5 s, only 0.1 s off the target value of 0.4s 

% 2. Analysis of the SSE mod values

% The SSE mod value for our M4 Heating data model is 0.0560, a very small value
%     indicating a high level of accuracy. The value is especially small due to 
%     the very small range of temperature difference in the Calibration data

% 3. Analysis of output plots

% Looking at our output plot for M4 Heating data, the model line appears to represent the
%     data extremely well, following along inside the band of noise of the data and being
%     a good predictor of the function value. This is reinforced by our low SSE mod value.


%% -- Q2 - Cooling Data Analysis

% 1. Comparison of the actual identified parameter values with the target values

% yL: Our calculated yL value is 0.5129 F, rounded matching the target value of 
%     0.5 F exactly
% yH: Our calculated yH value is 0.8790 F, only 0.004 F away from the target 
%     value of 0.875 F
% ts: Our calculated value of ts is 7.9 s, matching the target value of 7.9 s
% tau: Our calculated tau value is 0.4 s, matching the target value of 0.4 s

% 2. Analysis of the SSE mod values

% The SSE mod value for our M4 Cooling data model is 0.0104, even smaller than the 
%     SSE mod value for M4 Heating data. This is unusual due to the appearence of more
%     noise on the Cooling data compared to the Heating data. However, this low value
%     further demonstrates the effectiveness of our algorithm in processing noisy data.

% 3. Analysis of output plots

% Looking at our output plot for M4 Cooling data, the model line appears to follow the
%     data very well, staying within the bounds of noise. The SSE mod value for this
%     dataset is lower than the value for M4 Heating data, which is unusual due to the 
%     appearance of more noise. 


%% IMPROVEMENTS

% A potential area of improvement for our algorithm is adding the ability to process and
%     eliminate clear outliers in the dataset. The parameters already exist to
%     automatically calculate whether a data point is an outlier, with only slight
%     modifications to the overall algorithm.

%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.

