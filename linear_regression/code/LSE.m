%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Function - Least Squares Estimation                                   %
%                                                                         %
%   Estimates the parameters of a polynomial of degree P so that it fits  %
%     to given variables 'x' and 'y'.                                     %
%                                                                         %
%   Usage: Write LSE(p, file) to call function.                           %
%                                                                         %
%   Valid for Question 1 of lab 1 of the Machine Learning Course.         %
%                                                                         %
%   INPUT:                                                                %
%       - Integer 'p': order of the polynomial to fit to the data;        %
%       - Integer 'file': load data set containing 'x' and 'y'            %
%           - 1 to load data1.map,                                        %
%           - 2 to load data2.map and                                     %
%           - 3 to load data2a.map.                                       %
%                                                                         %
%   OUTPUT:                                                               %
%       - Plots of the data set and respective fit;                       %
%       - Parameters beta, error vector and squared error value           %
%         associated with the fit                                         % 
%                                                                         %
%   v1.2    Last edited: 2017/10/04                                       %
%                                                                         %
%   Made by:                                                              %
%       Luís Rei nº 78486                                                 %
%       João Girão nº 78761                                               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [beta, error, e] = LSE(p, file)
    
    close all; % Deletes all figures
    
    %% Checking arguments validity
    if file ~= 1 && file ~= 2 && file ~= 3
        error = 'The variable file must be an Integer from 1 to 3. E.g: LSE(4, 3).'
        return
     elseif p <= 0 || ~(isnumeric(p) && (rem(p, round(p)) == 0) && length(p) == 1)
         if p ~= 0
            error = 'The variable p must be an Integer bigger than 0. E.g: LSE(1, 1).'
            return
         end
    end
        
    %% Loads variables from file
    if file == 3
        data = load('data2a.mat');
    else
        data = load(['data' num2str(file) '.mat']);
    end
    
    % Auxiliary variables
    x = data.x(:,1);               % Sample set
    X = zeros(length(x), p+1);      
    y = data.y(:,1);               % Sample results
    
    %% Determining Beta
    % Creates X matrix
    for i = 0:p
        X(:,i+1) =  x.^i; 
    end
    
    % Computes estimated Beta parameters. 
    % Parameter estimation derived from the normal equations.
    beta = inv(X.'*X)*X.'*y;
     
    % Checking if the second derivate of SSE is positive definite
    [~,q] = chol(X.'*X);
    if q ~= 0
        error = 'The total cost is not minimum. X is not definite positive.'
        return
    end
    
    %% Plotting results
    % Creates test points
    xInterval = linspace(min(x), max(x));   % Sample for plotting purposes
    xSample = ones(100,p+1);                % Sample matrix
    for i = 1:p
        xSample(:,i+1) =  xInterval.^i;
    end
    
    % Computes predicted result y
    yHat = xSample*beta;
    
    % Plots results
    p1 = plot(xInterval, yHat);
    hold on;
    p2 = plot(x,y,'.');
    
    % Legend
    xlabel('x');
    ylabel('y');
    ttl = title(['Fitting of polynomial equation of degree ' num2str(p) ' using LS']);
    
    if file == 3
        lgd = legend([p1, p2], 'LS fit', 'Data set from data2a.mat', 'Location', 'South');
    else
        lgd = legend([p1, p2], 'LS fit', ['Data set from data' num2str(file) '.mat'], 'Location',  'South');
    end
    
    ttl.FontSize = 14; % For legibility purposes
    lgd.FontSize = 13;
    
    %% Computing error vector and value
    % Predicted test values
    yTest = X*beta;
    error = yTest - y;  % Error vector
    e = error.'*error;  % Squared error
end
