%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%  Function Script - Multilayer Perceptron classification problem         %
%                                                                         %
%  Neural network testing using gradient descent with momentum term to    %
%  solve a classification problem                                         %
%                                                                         %
%  Last updated in: 2017/11/06 v1.0                                       %
%                                                                         %
%  Authors: Luís Rei,   nº 78486                                          %
%           João Girão, nº 78761                                          %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
% Choice Set (Recommended interval: ss-0.3~3, mt-0~0.85)
ss = [0.001 0.003 0.01 0.03 0.1 0.3 1 3 5 7 10];  % step size
mt = [0 0.3 0.5 0.6 0.7 0.8 0.85 0.9 0.92 0.95 0.99]; % momentum term

% Training network using Gradient descent method
net.trainFcn = 'traingdm'
net.trainParam.lr=ss(10); % learning rate
net.trainParam.mc=mt(4);% Momentum constant
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.05; % training goal
[net,tr] = train(net,X,T);

