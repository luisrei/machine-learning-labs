%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Gradient Descent Optimization function                                %
%                                                                         %
%   Minimizes functions with multiple variables using the adaptive        %
%   step sizes method. Part 2: Testing the algorithm on the Rosenbrock    %
%   function with the aid of adaptive steps.                              %
%                                                                         %
%   v1.0    Last edited: 2017/10/13                                       %
%   Made by:  Luís Rei   nº 78486                                         %
%             João Girão nº 78761                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question4_3
    %% Initialization
    % Clear all workspace variables
    clear;
    % Close all figures
    close all;
    % Parameter initialization
    rosenini1;
    assact;
    
    % Set of alphas
    alphaSet = [0 0.5 0.7 0.9 0.95 0.99];                      
    % Set of etas
    etaSet = [0.001 0.01 0.1 1 10];           
    
    % Cost and Iteration matrices
    f = zeros(length(etaSet), length(alphaSet));
    iter = zeros(length(etaSet), length(alphaSet));
    
    %% Optimization algorithm
    for j = 1: length(alphaSet)
        alfa = alphaSet(j)
        for i = 1:length(etaSet)
            eta = etaSet(i);
            [f(i,j), iter(i,j)] = rosen1;
        end
    end
    
    % Saving results
    save('costq4_3.mat', 'f');
    save('stepsq4_3.mat', 'iter');
end