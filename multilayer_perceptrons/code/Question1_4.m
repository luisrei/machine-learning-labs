%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%  Function Script - Multilayer Perceptron classification problem         %
%                                                                         %
%  Neural network testing using gradient descent with momentum term and   % 
%  adaptive steps to solve a classification problem                       %
%                                                                         %
%  Last updated in: 2017/11/06 v1.0                                       %
%                                                                         %
%  Authors: Luís Rei,   nº 78486                                          %
%           João Girão, nº 78761                                          %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Close all figures
close all

% Loading input and target data
load('digits.mat');

% Creating neural network
net = patternnet([15]);

% Defining cost function as mean squared error
net.performFcn = 'mse';

% Defining activation function of both hidden and output layers as
% hyperbolic tangent
net.layers{1}.transferFcn='tansig';
net.layers{2}.transferFcn='tansig';

% Setting the first 400 patterns as training set and last 160 patterns as
% testing set
net.divideFcn='divideind';
net.divideParam.trainInd=1:400; 
net.divideParam.testInd=401:560;

% Choosing parameter set (step size and momentum)
% Choice Set
ss = [1, 3, 5, 7, 10, 12];  % step size
mt = [0.3, 0.5, 0.6, 0.7, 0.8, 0.85, 0.9]; % momentum term

% Training network using Gradient descent method
net.trainFcn = 'traingdx'
net.trainParam.lr=ss(5); % learning rate
net.trainParam.mc=mt(5);% Momentum constant
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.05; % training goal
[net,tr] = train(net,X,T);

% Plot confusion matrix
x_test=X(:,tr.testInd);
t_test=T(:,tr.testInd);
y_test = net(x_test);
plotconfusion(t_test,y_test);
