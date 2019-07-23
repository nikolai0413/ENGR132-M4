function meanSSE = M3MeanSSEmod_001_23(data, model)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function calculate the sum of square due to error of the data and
% predict value
%
% Function Call
% sse = M2SSEmod_001_23(y_data, y_pred)
%
% Input Arguments
% data, matrix of all original time histories, heat and cool, for one device
%       - each column is one time history
% model, matrix of all generated models, heat and cool, for one device
%       - matching trials are lined up with data
%
% Output Arguments
% meanSSE (mean of sum of square due to error)
%
% Assignment Information
%   Assignment:       	PS ##, Problem #
%   Author:             Name, login@purdue.edu
%   Team ID:            ###-##      
%  	Contributor: 		Name, login@purdue [repeat for each]
% did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% CALCULATIONS & FORMATTED TEXT & FIGURE DISPLAYS

[length,num] = size(data);
sse = zeros(num,1);
for i = 1:num
    diff = data(:,i) - model(:,i);
    sse(i) = sum(diff .^ 2) / length;
end
meanSSE = mean(sse);



%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.

