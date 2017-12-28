% Close plots
close all

% Load data
load('chess33.mat')

% Variable initialization
sigma = [0.01, 0.025, 0.05, 0.075, 0.1, 0.25, 0.5, 0.75, 1, 2.5, 5, 6];
sv = zeros(1,length(sigma));
error = zeros(1,length(sigma));

% Training the support vector machine
for p = 1:length(sigma)
    figure
    svmStruct = svmtrain( X, Y,'kernel_function', 'rbf', 'rbf_sigma' ,sigma(p), 'method', 'QP', 'boxconstraint', Inf, 'showplot', true);
    
    % Classify using the training points
    Classification = svmclassify(svmStruct, X, 'showplot', true);

    % Compute error percentage
    for i = 1:length(Y)
        if Classification(i) ~= Y(i)
            error(p) = error(p) + 1;
        end
    end
    
    % Get nº of support vectors
    sv(p) = size(svmStruct.SupportVectors, 1);
end