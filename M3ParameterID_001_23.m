function [yl,yh,ts,t] = M3ParameterID_001_23(time, temp, type)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function calculate the prameters needed for futher development, y
% high, y low, ts and t
%
% Function Call
% function [yl,yh,ts,t] = M2ParameterID_001_23(data, type)
%
% Input Arguments
% time (the time tracking of the test(s))
% temp (the temperature of the test (C))
%
% Output Arguments
% yl (the cold water temperature when testing (C))
% yh (the hot water temperature when testing (C))
% ts (the start time when the test started (s))
% t  (the time constant for the system (s))
%
% Assignment Information
%   Assignment:       	PS ##, Problem #
%   Author:             Name, login@purdue.edu
%   Team ID:            ###-##      
%  	Contributor: 		Name, login@purdue [repeat for each]
% did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ____________________
%% INITIALIZATION 

[length,~] = size(time);    %length of the data

% clean the data by using moving average of 5 elements by looping thorough
% every elements, on the start and the end that the element is not enough
% for 2 left and 2 right, use as many as possible.
for i = 1:length
    if i < 3
        temp(i) = mean(temp(1:(2 * i - 1)));
    elseif i > (length - 2)
        temp(i) = mean(temp((length - 2 * (length - i)):length));
    else
        temp(i) = mean(temp((i - 2):(i + 2)));
    end
end

%% ____________________
%% CALCULATIONS & FORMATTED TEXT & FIGURE DISPLAYS

% Calculate y low and y high
cal_length = floor(0.01 * length);  %set the step to 1% of the size
% initial the array to store result
slope_start = zeros(1,10);
slope_end = zeros(1,10);   
% loop thorough half of the array calclulate the best fit line slope of i%
% of the data
for i = 0:50
    start_time = time(1:cal_length);
    start_temp = temp(1:cal_length);
    end_time = time((length - cal_length):length);
    end_temp = temp((length - cal_length):length);
    p = polyfit(start_time,start_temp,1);
    slope_start(i + 1) = p(1);
    p = polyfit(end_time,end_temp,1);
    slope_end(i + 1) = p(1);
    cal_length = cal_length + floor(0.01 * length);
end
% find the index that have the minimun slope which means they are almost
% horizontal line
start_i = find(abs(slope_start) == min(abs(slope_start)));
end_i = find(abs(slope_end) == min(abs(slope_end)));
% based on the index, find the corresponding time and temp for start & end
start_time = time(1: floor(0.01 * start_i * length));
start_temp = temp(1: floor(0.01 * start_i * length));
end_time = time((length - floor(0.01 * end_i * length)):length);
end_temp = temp((length - floor(0.01 * end_i * length)):length);
% find the best fit line of the start and end's time and temp to eliminate
% the noise
start = polyfit(start_time,start_temp,1);
last = polyfit(end_time,end_temp,1);
start_temp = polyval(start,start_time);
end_temp = polyval(last,end_time);
% get the mean of the predict temperature. The larger value is y high and
% smaller value is y low
y = [mean(start_temp),mean(end_temp)];
yl = min(y);    %low temperature (C)
yh = max(y);    %high temperature (C)

% Find ts
% loop parameter initialization
start_i = 1;
step = floor(0.01 * length); % set the step to 1% of the data
% loop thorough half of the data (assume time start before half of the
% data) find the slope, assume the change is fastest at ts
while start_i <= floor(0.5 * length) 
    array_temp = temp(start_i:(start_i + step));
    array_time = time(start_i:(start_i + step));
    p = polyfit(array_time,array_temp,1);
    slope(start_i) = p(1);
    start_i = start_i + 1;  %change the index here to make the program faster
end
ts_i = (abs(slope) == max(abs(slope))); %find the largest slope index
ts = time(ts_i);    %time start (s)

% Find tau
% Generate tau function based on the type
if type == 'cooling'
    yt = yh - 0.632 * (yh - yl);
else
    yt = yl + 0.632 * (yh - yl);
end
diff = abs(temp - yt);  %calculate the distance between temp and yt
[~, sortIDX] = sort(diff);  %sort the diff from low to high
time = time(sortIDX);   %sort the time based on diff array
t = mean(time(1:50)) - ts;  %estimate tau by the average of 50 times that is closest to tau


%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.

