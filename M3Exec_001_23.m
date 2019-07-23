
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Executive function
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

% load data
coolingData = load("M3_Data_CoolingTimeHistories.csv");
heatingData = load("M3_Data_HeatingTimeHistories.csv");

% get times
coolingTime = coolingData(:,1);
heatingTime = heatingData(:,1);

% create matrix with row indicating fos number, and columns indicating
%     column numbers used in raw data
fosNumColumn = [2:11; 12:21; 22:31; 32:41; 42:51];

meanSSEs = []; % will be 1x5 array of mean sses
taus = []; % will be 20x5 matrix of tau values

for fosNum = 1:5 % iterate through each device
  fosColumns = fosNumColumn(fosNum, :);

  % Variable to hold combined time histories, heating and cooling, for one device
  deviceTimeHistories = []; 

  % Variable to hold combined calculated models, heating and cooling, for one device
  deviceModels = [];

  for responseType = ["heating", "cooling"] % repeat once for heating once for cooling
    if (responseType == "heating")
      time = heatingTime;
      data = heatingData;
      idxOffset = 0;
    else
      time = coolingTime;
      data = coolingData;
      idxOffset = 10;
    end

    for idx = 1:length(fosColumns)
      column = fosColumns(idx);

      % Push data for this trial to matrix
      deviceTimeHistories(:, idx + idxOffset) = data(:, column);

      % calculate parameters and modelValue
      [yl,yh,ts,tau] = M3ParameterID_001_23(time, data(:, column), responseType);
      modeledValues = M2Piecewise_001_23(time, responseType, ts, yl, yh, tau);

      % Push modeled values for this trial to matrix
      deviceModels(:, idx + idxOffset) = modeledValues;
      
      taus(idx + idxOffset, fosNum) = tau;
      
    end % end individual column 
  end % end heating / cooling loop

  meanSSE = M3MeanSSEmod_001_23(deviceTimeHistories, deviceModels);

  % Print out Mean SSEs. Could not include in SSE function for practical
  % reasons (approved by instructor)
  fprintf("The mean SSEmod value for FOS%d is %6.4f.\n", fosNum, meanSSE);

  meanSSEs(fosNum) = meanSSE;

end % end fosNum loop

% Call other functions with matrix, columns is model, rows is tau
M3Stats_001_23(taus);
M3Regression_001_23(taus);


%% ____________________
%% CALCULATIONS & FORMATTED TEXT & FIGURE DISPLAYS


  
%% ANALYSIS

%% -- Q1
% The algorithm we created works pretty well with thermocouple model 1 that
% all of the parameters including SSEmod, mean value for tau and std are
% within the expexted range provided by the instruction
% 
%% -- Q2
% The algorithm we created works pretty well with thermocouple model 2 that
% all of the parameters including SSEmod, mean value for tau and std are
% within the expexted range provided by the instruction
% 
%% -- Q3
% The algorithm we created works pretty well with thermocouple model 3 that
% all of the parameters including SSEmod, mean value for tau and std are
% within the expexted range provided by the instruction
% 
%% -- Q4
% The algorithm we created is working with thermocouple model 4 that
% most of the parameters including SSEmod and mean value for tau are
% within the expexted range provided by the instruction, but the std value
% exceed what we expect, that means the model we generated is not accurate
% enough for this model
%
%% -- Q5
% The algorithm we created is working with thermocouple model 5 that
% most of the parameters including SSEmod and mean value for tau are
% within the expexted range provided by the instruction, but the std value
% exceed what we expect, that means the model we generated is not accurate
% enough for this model
%
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.

