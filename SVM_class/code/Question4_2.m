% Close plots
close all

% Load data
load('spiral.mat')

% Variable initialization
sigma = [0.01, 0.025, 0.05, 0.075, 0.1, 0.15, 0.20, 0.25, 0.5, 1, 10, 1000];
sv = zeros(1,length(sigma));
error = zeros(1,length(sigma));

% Training the support vector machine
for p = 1:length(sigma)
    figure
    svmStruct = svmtrain( X, Y,'kernel_function', 'rbf', 'rbf_sigma' ,sigma(p), 'method', 'QP', 'boxconstraint', 10^4, 'showplot', true);
    
    % Classify using the training points
    Classification = svmclassify(svmStruct, X, 'showplot', true);
    
    % Compute error percentage
    for i = 1:100
        if Classification(i) ~= Y(i)
            error(p) = error(p) + 1;
        end
    end
    % Get nº of support vectors
    sv(p) = size(svmStruct.SupportVectors, 1);
end