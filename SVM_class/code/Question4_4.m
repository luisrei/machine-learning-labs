% Close plots
close all

% Load data
load('chess33n.mat')

% Variable initialization
sigma = 1;
error = 0;

% Training the support vector machine
figure
svmStruct = svmtrain( X, Y,'kernel_function', 'rbf', 'rbf_sigma' ,sigma, 'method', 'QP', 'boxconstraint', Inf, 'showplot', true);

% Classify using the training points
Classification = svmclassify(svmStruct, X, 'showplot', true);

% Compute error percentage
for i = 1:length(Y)
    if Classification(i) ~= Y(i)
        error = error + 1;
    end
end

% Get nº of support vectors
sv = size(svmStruct.SupportVectors, 1);