function M2SSEmod_001_23(cc, cn, hc, hn)
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
%   Assignment:       	PS ##, Problem #
%   Author:             Name, login@purdue.edu
%   Team ID:            ###-##      
%  	Contributor: 		Name, login@purdue [repeat for each]
% did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% CALCULATIONS & FORMATTED TEXT & FIGURE DISPLAYS

cc_diff = cc(:,1) - cc(:,2); %distance between each data
cc_sse = sum(cc_diff .^ 2) / length(cc);   %caclulate sse value

cn_diff = cn(:,1) - cn(:,2);
cn_sse = sum(cc_diff .^ 2) / length(cn); 

hc_diff = hc(:,1) - hc(:,2);
hc_sse = sum(hc_diff .^ 2) / length(hc);

hn_diff = hn(:,1) - hn(:,2);
hn_sse = sum(hn_diff .^ 2) / length(hn);

% Print statments
fprintf("The SSE MOD value for the Clean Cooling data is:\t %0.4f\n", cc_sse);
fprintf("The SSE MOD value for the Noisy Cooling data is:\t %0.4f\n", cn_sse);
fprintf("The SSE MOD value for the Clean Heating data is:\t %0.4f\n", hc_sse);
fprintf("The SSE MOD value for the Noisy Heating data is:\t %0.4f\n", hn_sse);

%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.

