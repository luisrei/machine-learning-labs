% Close plots
close all

% Load data
load('chess33n.mat')

% Variable initialization
sigma = 1;
marginpower = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
sv = zeros(1,length(marginpower));
error = zeros(1,length(marginpower));

% Training the support vector machine
for p = 1:length(marginpower)
    figure
    svmStruct = svmtrain( X, Y,'kernel_function', 'rbf', 'rbf_sigma' ,sigma, 'method', 'QP', 'boxconstraint', 10^marginpower(p), 'showplot', true);

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