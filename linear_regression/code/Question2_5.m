%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Ridge Fitting function                                                %
%                                                                         %
%   v1.0    Last edited: 2017/10/04                                       %
%                                                                         %
%   Made by:                                                              %
%       Luís Rei nº 78486                                                 %
%       João Girão nº 78761                                               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function Question2_5
    
    close all;
    
    data = load('data3.mat');

    % Lambda scalar has the same value as in 2.4
    Lambda = 0.0695;
    
    % Additional column vector for mean value adjustments of the results
    one = ones(length(data.X),1);
    %% Ridle plot
    figure;
    k = 0:0.1:1000;
    B = ridge(data.Y, data.X, k);
    plot(k, B');
    
    % Legend
    ttl1 = title('Variance of the beta coefficients with Lambda');
    xlabel('Lambda');
    ylabel('Beta coefficients');
    lgd1 = legend('Feature 1', 'Feature 2', 'Feature 3');
    
    ttl1.FontSize = 13; % For legibility purposes
    lgd1.FontSize = 13;
    
    %% Comparison with LS fit coefficients
    % Get coefficients for both fits
    LSB = ridge(data.Y, data.X, 0, 0);
    RB = ridge(data.Y, data.X, Lambda, 0);

    % Results
    yRidge = [one, data.X] * RB;
    yLS = [one, data.X] * LSB;
    
    % Plot
    figure;
    p0 = plot(data.Y, '-b');
    hold on
    p1 = plot(yRidge, '-m');
    p2 = plot(yLS, '--xk');
    
    % Legend
    ttl = title(['Results for the LS and Ridge fit with Lambda = ' num2str(Lambda) '']);
    xlabel('Input');
    ylabel('Output');
    
    lgd = legend([p0, p1, p2], 'Sample results', 'Ridge results', 'LS results', 'Location' ,'NorthEast');
    ttl.FontSize = 13;
    lgd.FontSize = 13;
    
    %% Compute the error
    ridgeError = (yRidge - data.Y).'*(yRidge - data.Y);
    LSError2_5 = (yLS - data.Y).'*(yLS - data.Y);
    
    % Save data
    save('ridgeError.mat');
    save('LSError2_5.mat');
    
end