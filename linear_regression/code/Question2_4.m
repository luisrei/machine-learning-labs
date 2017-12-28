%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Lasso Fitting function                                                %
%                                                                         %
%   v1.0    Last edited: 2017/10/04                                       %
%                                                                         %
%   Made by:                                                              %
%       Luís Rei nº 78486                                                 %
%       João Girão nº 78761                                               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function Question2_4
    
    close all; % Delete all figures
    
    data = load('data3.mat');

    %% Coefficients calculation
    % LS fit coefficients
    [LSB,~] = lasso(data.X, data.Y, 'Lambda', 0);
    
    % lasso fit coefficients with lambda right before feature 2 gains
    % weight
    [B,FitInfo] = lasso(data.X, data.Y, 'Lambda', 0.0695);

    % Auxiliary variables used in the adjustments of the predicted y
    one = ones(length(data.X),1);
    beta0 = FitInfo.Intercept;
    
    yLasso = [one, data.X] * [beta0; B(:,1)];   % Lasso results
    yLS = [one, data.X] * [beta0; LSB(:,1)];    % LS results
    
    % Plot
    figure;
    p0 = plot(data.Y, '-b')
    hold on
    p1 = plot(yLasso, '-r');
    p2 = plot(yLS, '--xk');
    
    % Legend
    ttl = title(['Results for the LS and Lasso fit with Lambda = ' num2str(FitInfo.Lambda) '.']);
    xlabel('Input');
    ylabel('Output');
    lgd = legend([p0, p1, p2], 'Sample results', 'Lasso results', 'LS results', 'Location' ,'NorthEast');
    
    ttl.FontSize = 13; % For legibility purposes
    lgd.FontSize = 13;
    
    %% Computes squared error of both fits for comparison
    lassoError = (yLasso - data.Y).'*(yLasso - data.Y);
    LSError2_4 = (yLS - data.Y).'*(yLS - data.Y);
    
    % Save obtained data
    save('lassoError.mat');
    save('LSError2_4.mat');
    
end