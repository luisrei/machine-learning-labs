%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%  Function Script - Multilayer Perceptron regression problem             %
%                                                                         %
%  Neural network testing to solve a regression problem using a           %
%  validation set                                                         %
%                                                                         %
%  Last updated in: 2017/11/07 v1.0                                       %
%                                                                         %
%  Authors: Luís Rei,   nº 78486                                          %
%           João Girão, nº 78761                                          %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all


% Loading input and target data
load('regression_data.mat');

% Creating neural network
net = fitnet(40);

% Defining cost function as mean squared error
net.performFcn = 'mse';

% Defining activation function of output layer as linear
net.layers{2}.transferFcn='purelin';

% Setting the first 70 patterns as training set, the next 15 as validation
% set and the last 15 patterns as the testing set
net.divideFcn='divideind';
net.divideParam.trainInd=1:70; 
net.divideParam.valInd=71:85;
net.divideParam.testInd=86:100;

% Training network using Gradient descent method
net.trainParam.show=10000; % # of epochs in display
net.trainParam.max_fail=100;% # of vaildation checks
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.005; % training goal
[net,tr] = train(net,X,T);

% Plotting results
p1 = plot(X(1:70), T(1:70), 'xr'); % Training set
hold on
p2 = plot(X(86:100),T(86:100), 'ok'); % Test set
x = linspace(-1, 1, 2000);
y = net(x);
p3 = plot(x, y); % Predicted result 

xlabel('Input');
ylabel('Output');
title('Training with validation set')
legend([p1 p2 p3],'Training set', 'Test set', 'Predicted result');

save('output', 'y');