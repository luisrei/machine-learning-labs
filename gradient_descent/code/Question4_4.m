%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Gradient Descent Optimization function                                %
%                                                                         %
%   Minimizes functions with multiple variables using the adaptive        %
%   step sizes method.                                                    %
%                                                                         %
%   Arguments: adaptive - Call this function with argument 1 to execute   %
%   the adaptive method and 0 to run the algorithm without the method.    %
%                                                                         %
%   v1.0    Last edited: 2017/10/13                                       %
%   Made by:  Luís Rei   nº 78486                                         %
%             João Girão nº 78761                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function Question4_4(adaptive)
    %% Initialization
    % Close all figures
    close all;
    % Parameter initialization
    rosenini1;
    a = 100; % Original value
    
    if adaptive > 0
        assact;
    else
        assdeact;
    end
    
    % Set of alphas
    alphaSet1 = [0 0.5 0.7 0.9 0.95 0.99];              % First Set (only one needed when applying the adaptive method)                   
    alphaSet2 = [0.9 0.912 0.925 0.95 0.975 0.99];      % Second Set
    alphaSet3 = [0.9 0.905 0.912 0.92 0.925 0.95];      % Third Set
    alphaSet4 = [0.917 0.92 0.9215 0.9232 0.925 0.93];  % Fourth Set
    % Set of etas
    etaSet1 = [0.001 0.01 0.1 1 10];                    % First Set (only one needed when applying the adaptive method)  
    etaSet2 = [0.001 0.004 0.007 0.009 0.01];           % Second Set
    etaSet3 = [0.007 0.008 0.009 0.0095 0.01];          % Third Set
    etaSet4 = [0.0075 0.008 0.009 0.0095 0.01];         % Fourth Set
    
    % Cost and Iteration matrices
    f = zeros(length(etaSet1), length(alphaSet1));
    iter = zeros(length(etaSet1), length(alphaSet1));
    
    %% Optimization algorithm
    for j = 1: length(alphaSet1)
        alfa = alphaSet4(j);     % Choose apropriate set
        for i = 1:length(etaSet1)
            eta = etaSet4(i);   % Choose apropriate set
            [f(i,j), iter(i,j)] = rosen1;
        end
    end
    
    % Saving results
    save('costq4_4.mat', 'f');
    save('stepsq4_4.mat', 'iter');
end