% Close plots
close all

% Load data
load('spiral.mat')

% Variable initialization
error = zeros(1,10);
sv = zeros(1,10);

% Training the support vector machine
for p = 1:10
    figure
    svmStruct = svmtrain( X, Y,'kernel_function', 'polynomial', 'polyorder' ,p, 'method', 'QP', 'boxconstraint', 10^4, 'showplot', true);
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
