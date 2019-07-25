function M2SSEmod_001_23(cn, hn)
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
% cc, cc [data, pred]. NOTE: all variables expected to have data in the first column,
%     predicted data in the second column
% cn, cn [data, pred]
% hc, hc [data, pred]
% hn, hn [data, pred]
%
% Output Arguments
% sse (sum of square due to error)
%
% Assignment Information
%   Assignment:       	M2
%   Author:             Zhibo Hou, hou70@purdue.edu
%                       Charlie Wu, wu1292@purdue.edu
%                       Nicolas Fransen, nfransen@purdue.edu
%   Team ID:            001-23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% CALCULATIONS & FORMATTED TEXT & FIGURE DISPLAYS 

cn_diff = cn(:,1) - cn(:,2);              % distance between each data
cn_sse = sum(cn_diff .^ 2) / length(cn);  % caclulate sse value

hn_diff = hn(:,1) - hn(:,2);
hn_sse = sum(hn_diff .^ 2) / length(hn);

% Print statments
fprintf("The SSE MOD value for the M4 Heating data is: %0.4f\n", hn_sse);
fprintf("The SSE MOD value for the M4 Cooling data is: %0.4f\n", cn_sse);

%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.

