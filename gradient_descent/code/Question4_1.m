%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Gradient Descent Optimization function                                %
%                                                                         %
%   Minimizes functions with multiple variables using the adaptive        %
%   step sizes method. Part 1: Testing the algorithm on the Rosenbrock    %
%   function without the aid of adaptive steps.                           %
%                                                                         %
%   v1.0    Last edited: 2017/10/13                                       %
%   Made by:  Luís Rei   nº 78486                                         %
%             João Girão nº 78761                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question4_1
    %% Initialization
    % Clear all workspace variables
    clear;
    % Close all figures
    close all;
    % Parameter initialization
    rosenini1;
    
    % Variable tests

    % Possible alphas
    pAlfa1 = 0:0.245:1;                      % First set of alphas
    pAlfa2 = 0.735:(0.98-0.735)/4:0.98;      % Second set of alphas
    % Possible etas
    pEta1 = [0.001 0.003 0.01 0.03 0.1 0.3 1 3 10];         % First set of etas
    pEta2 = [0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.1];  % Second set of etas
    
    % Chosen parameters
    Alpha = pAlfa2;
    Eta = pEta2;
    
    % Cost and Iteration matrices
    f = zeros(length(Eta), length(Alpha));
    iter = zeros(length(Eta), length(Alpha));
    
    %% Optimization algorithm
    for j = 1: length(Alpha)
        alfa = Alpha(j)
        for i = 1:length(Eta)
            eta = Eta(i);
            [f(i,j), iter(i,j)] = rosen1;
        end
    end
    
    % Saving results
    save('costq4_1.mat', 'f');
    save('stepsq4_1.mat', 'iter');
end