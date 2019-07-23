function[] = M3Regression_001_23(taumatrix)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%
% Function Call
%%
% Input Arguments
%
% Output Arguments
%
% Assignment Information
%   Assignment:       	PS ##, Problem #
%   Author:             Name, login@purdue.edu
%   Team ID:            ###-##      
%  	Contributor: 		Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ____________________
%% INITIALIZATION 
fos1 = taumatrix(:,1); %FOS1 tau data
fos2 = taumatrix(:,2); %FOS2 tau data
fos3 = taumatrix(:,3); %FOS3 tau data
fos4 = taumatrix(:,4); %FOS4 tau data
fos5 = taumatrix(:,5); %FOS5 tau data

fos1price = 15.83 + zeros(length(fos1),1); %Price of FOS1
fos2price = 8.52 + zeros(length(fos2),1); %Price of FOS2
fos3price = 3.50 + zeros(length(fos3),1); %Price of FOS3
fos4price = 2.03 + zeros(length(fos4),1); %Price of FOS4
fos5price = 0.65 + zeros(length(fos5),1); %Price of FOS5

tau = [fos1;fos2;fos3;fos4;fos5]; %All tau data merged into one vector
price = [fos1price;fos2price;fos3price;fos4price;fos5price]; %all price data merged into one vector
%% ____________________
%% FIGURE DISPLAY (1)
figure;
sgtitle('Regression Analysis for Price vs. \tau');
subplot(2,2,1)
plot(fos1,fos1price,'bo',fos2,fos2price,'go',fos3,fos3price,'ro',fos4,fos4price,'mo',fos5,fos5price,'yo');
xlabel('\tau');
ylabel('Price (Dollars)');
grid on;

subplot(2,2,2)
semilogx(fos1,fos1price,'bo',fos2,fos2price,'go',fos3,fos3price,'ro',fos4,fos4price,'mo',fos5,fos5price,'yo');
xlabel('\tau');
ylabel('Price (Dollars)');
grid on;
legend('FOS1','FOS2','FOS3','FOS4','FOS5','Location','northeast');

subplot(2,2,3)
semilogy(fos1,fos1price,'bo',fos2,fos2price,'go',fos3,fos3price,'ro',fos4,fos4price,'mo',fos5,fos5price,'yo');
xlabel('\tau');
ylabel('Price (Dollars)');
grid on;

subplot(2,2,4)
loglog(fos1,fos1price,'bo',fos2,fos2price,'go',fos3,fos3price,'ro',fos4,fos4price,'mo',fos5,fos5price,'yo');
xlabel('\tau');
ylabel('Price (Dollars)');
grid on;

%% ____________________
%% CALCULATIONS
regress = polyfit(log10(tau),price,1);
slope = regress(1);
yint = regress(2);
pricelinear = (slope .* log10(tau)) + yint;
sse = sum((price - pricelinear) .^ 2);
sst = sum((price - mean(price)) .^ 2);
rsqr = 1 - sse / sst;
max_t = max(tau);
min_t = min(tau);
a_t = min_t:0.0001:max_t;
pricegeneral = (slope .* log10(a_t)) + yint;

%% ____________________
%% FIGURE DISPLAY (2)
figure; 
plot(log10(tau),price,'o',log10(tau),pricelinear,'r');
title('Linearized Data of Price vs. \tau');
xlabel('\tau');
ylabel('Price (Dollars)');
legend('Linearized Data','Trendline','Location','southwest');
%% ____________________
%% FIGURE DISPLAY (3)
figure;
plot(tau,price,'o',a_t,pricegeneral,'r');
title('Data with Best-Fit Curve of Price vs. \tau');
xlabel('\tau');
ylabel('Price (Dollars)');
legend('Data','Best-Fit Curve','Location','southwest');

%% ____________________
%% FORMATTED TEXT DISPLAYS
fprintf('A logarithmic function best represents the data.\n');
fprintf('The linearized form of the function is: Price = %0.3f * log(Tau) + %0.3f\n',slope,yint);
fprintf('The SSE is %0.3f, the SST is %0.3f, and the coefficient of determination is %0.3f.\n',sse,sst,rsqr);
fprintf('The general form of the function is Price = %0.3f * log(Tau) + %0.3f\n',slope,yint);

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
