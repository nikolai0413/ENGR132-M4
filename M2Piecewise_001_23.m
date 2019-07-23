function modeledValues = M2Piecewise_001_23(t, responseType, ts, yl, yh, tau)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Calculates the modeled values y(t) for each value of time and the four parameters
% using a piecewise equation
%
% Function Call
% modeledValues = M2Piecewise_001_23(t, type, ts, yl, yh, tau);
%
% Input Arguments
% t, a vector containing the time values to be modeled, seconds
% responseType, a string equal to either "heating" or "cooling"
% ts, the parameter ts, seconds
% yl, the "y low" parameter, Celcius
% yh, the "y high" parameter, Celcius
% tau, the tau parameter
%
% Output Arguments
% modeledValues, a vector containing the modeled values of temperature according to the equation
%
% Assignment Information
%   Assignment:       	M1
%   Author:             Nicolas Fransen, nfransen@purdue.edu
%   Team ID:            001-23      
%  	Contributor: 		    None
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% CALCULATIONS

% Create first part of piecewise function
[~, tsIdx] = min(abs(t - ts));
modelPiece1 = zeros(tsIdx - 1, 1);

if (responseType == "heating")
  modelPiece1 = modelPiece1 + yl;
elseif (responseType == "cooling")
  modelPiece1 = modelPiece1 + yh;
else 
  fprintf("ERROR: responseType was not either 'heating' or 'cooling'.\n");
end

% t values for second portion of piecewise function
tPiece2 = t(tsIdx:length(t));

term1 = exp(-(tPiece2 - ts)/tau);
term2 = yh - yl;

if (responseType == "heating")
  modelPiece2 = yl + term2 .* (1 - term1);
elseif (responseType == "cooling")
  modelPiece2 = yl + term2 .* term1;
else 
  fprintf("ERROR: responseType was not either 'heating' or 'cooling'.\n");
end

modeledValues = [modelPiece1 ; modelPiece2];

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The project I am submitting
% is my own original work.



