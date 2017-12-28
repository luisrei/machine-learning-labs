%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Lasso Fitting function                                                %
%                                                                         %
%   v1.1    Last edited: 2017/10/04                                       %
%                                                                         %
%   Made by:                                                              %
%       Luís Rei nº 78486                                                 %
%       João Girão nº 78761                                               %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function Question2_2
 
    close all; % Delete all figures
    
    data = load('data3.mat'); % Load data
 
    [feature,FitInfo] = lasso(data.X, data.Y);
    
    % Plot coefficients agains lambda.
    x = linspace(min(FitInfo.Lambda), max(FitInfo.Lambda));
    lassoPlot(feature, FitInfo, 'PlotType', 'Lambda', 'XScale', 'log');
    hold on;
    
    %% Compare with LS coefficients (LSCo)
    LSCo = lasso(data.X, data.Y, 'Lambda', 0);
    
    % Plot horizontal lines with value LSCo
    LSCoVector(1,:) = LSCo(1,1)* ones(1,100);
    LSCoVector(2,:) = LSCo(2,1)* ones(1,100);
    LSCoVector(3,:) = LSCo(3,1)* ones(1,100);
    plot(x, LSCoVector(1,:), '- k','DisplayName', ['' num2str(LSCo(1,1)) '']);   
    plot(x, LSCoVector(2,:), '--b','DisplayName', ['' num2str(LSCo(2,1)) '']);
    plot(x, LSCoVector(3,:), '--k','DisplayName', ['' num2str(LSCo(3,1)) '']);
    legend('show');
    
end