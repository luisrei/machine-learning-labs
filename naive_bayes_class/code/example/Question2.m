%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Function script - Naïve Bayes classifier                              %
%                                                                         %
%   v1.0    Last edited: 2017/11/10                                       %
%   Made by:  Luís Rei   nº 78486                                         %
%             João Girão nº 78761                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Close all figures
close all

% Load data
load('data1.mat');

% Plot training and test points
figure(1)
p1 = plot(xtrain(1, 1:50), xtrain(2, 1:50), 'or');
hold on
p2 = plot(xtrain(1, 51:100), xtrain(2, 51:100), 'og');
p3 = plot(xtrain(1, 101:end), xtrain(2, 101:end), 'ob');
axis([-4 8 -4 8]);
xlabel('First feature');
ylabel('Second feature');
title('Training data');
legend([p1 p2 p3], 'y = 1', 'y = 2', 'y = 3', 'location', 'SouthEast');

figure(2)
p4 = plot(xtest(1, 1:50), xtest(2, 1:50), 'or');
hold on
p5 = plot(xtest(1, 51:100), xtest(2, 51:100), 'og');
p6 = plot(xtest(1, 101:end), xtest(2, 101:end), 'ob');
axis([-4 8 -4 8]);
xlabel('First feature');
ylabel('Second feature');
title('Test data');
legend([p4 p5 p6], 'y = 1', 'y = 2', 'y = 3', 'location', 'SouthEast');


figure(3)
p1 = plot(xtrain(1, 1:50), xtrain(2, 1:50), 'or');
hold on
p2 = plot(xtrain(1, 51:100), xtrain(2, 51:100), 'og');
p3 = plot(xtrain(1, 101:end), xtrain(2, 101:end), 'ob');
p4 = plot(xtest(1, 1:50), xtest(2, 1:50), 'xm');
p5 = plot(xtest(1, 51:100), xtest(2, 51:100), 'xk');
p6 = plot(xtest(1, 101:end), xtest(2, 101:end), 'xc');
axis([-4 8 -4 8]);
xlabel('First feature');
ylabel('Second feature');
title('All data');
legend([p1 p2 p3 p4 p5 p6], 'Training y = 1', 'Training y = 2', ...
    'Training y = 3', 'Test y = 1', 'Test y = 2', 'Test y = 3', ...
    'location', 'SouthEast');

%% Naïve Bayes classifier

% Separating training data into different sets
set1 = [xtrain(1, 1:50); xtrain(2, 1:50)];
set2 = [xtrain(1, 51:100); xtrain(2, 51:100)];
set3 = [xtrain(1, 101:150); xtrain(2, 101:150)];

% Estimation of the pdf of each set assuming it takes a gaussian
% distribution

% Computing the mean along the rows of the set. It's the same as finding the
% coordinates of the center point of the gaussian distribution
mean1 = mean(set1, 2); % Mean of first set
mean2 = mean(set2, 2); % Mean of second set
mean3 = mean(set3, 2); % Mean of third set
covar1 = cov(set1(1,:),set1(2,:), 1); % Dividing by N instead of N-1
covar2 = cov(set2(1,:),set2(2,:), 1); % Dividing by N instead of N-1
covar3 = cov(set3(1,:),set3(2,:), 1); % Dividing by N instead of N-1

% Initialize error matrices
classError = 0;
setError = zeros(3,2);

% Get new figure
figure;
hold on

% Test data classification
for i = 1:3     % For each set do:
    % Initialize set error value
    setE = 0;
    for j = 1:50    % For each element do:
        % Test set index
        index = (i-1)*50 + j;
        
        % Compute the probability density of the point belonging to each of
        % the classes
        f1 = normpdf(xtest(1,index), mean1(1,1), sqrt(covar1(1,1)))*normpdf(xtest(2,index), mean1(2,1), sqrt(covar1(2,2)));
        f2 = normpdf(xtest(1,index), mean2(1,1), sqrt(covar2(1,1)))*normpdf(xtest(2,index), mean2(2,1), sqrt(covar2(2,2)));
        f3 = normpdf(xtest(1,index), mean3(1,1), sqrt(covar3(1,1)))*normpdf(xtest(2,index), mean3(2,1), sqrt(covar3(2,2)));
        
        % To compute the Bayesian pdf without the naïve assumption use the
        % following functions instead of the ones above
        
        %f1 = mvnpdf([xtest(1,index), xtest(2,index)], mean1', covar1);
        %f2 = mvnpdf([xtest(1,index), xtest(2,index)], mean2', covar2);
        %f3 = mvnpdf([xtest(1,index), xtest(2,index)], mean3', covar3);
        
        % Choose class with highest probability
        [~,f] = max([f1, f2, f3]);
        
        % Plot classified point
        if f == 1
            p7 = plot(xtest(1,index), xtest(2,index), 'or');
        elseif f == 2
            p8 = plot(xtest(1,index), xtest(2,index), 'xg');
        else
            p9 = plot(xtest(1,index), xtest(2,index), '.b');
        end
        
        % Compare with real value and update error
        if f ~= ytest(index)
            setE = setE + 1;    % Updating set error
            classError = classError + 1; % Updating classifier error
        end
    end
    
    % Update set error
    setError(i, 1) = setE; % Number of wrong classifications in set 'i'
    setError(i, 2) = setE * 2; % Percentage of error is twice the number of 
                              % errors as the number of points in each set
                              % is 50
end
xlabel('First feature');
ylabel('Second feature');
title('Classified Test features');
legend([p7 p8 p9], 'Classified as y = 1', 'Classified as y = 2',...
    'Classified as y = 3', 'location', 'SouthEast');
axis([-4 8 -4 8]);
% Final classifier error percentage
['Percentage of errors is: ' num2str(classError*100.0/150.0) '% (' ...
    num2str(classError) ' in 150)']
['Class Error is: First class: ' num2str(setError(1, 2)) '% (' ...
    num2str(setError(1, 1)) ' in 50)   Second class: ' num2str(setError(2, 2)) ...
    '% (' num2str(setError(2, 1)) ' in 50)   Third class: ' num2str(setError(3, 2))...
    '% (' num2str(setError(3, 1)) ' in 50)']

%% Check gaussian function

x1 = linspace(mean1(1)-10, mean1(1)+10);
y1 = linspace(mean1(2)-10, mean1(2)+10);
z1 = zeros(100);
x2 = linspace(mean2(1)-10, mean2(1)+10);
y2 = linspace(mean2(2)-10, mean2(2)+10);
z2 = zeros(100);
x3 = linspace(mean3(1)-10, mean3(1)+10);
y3 = linspace(mean3(2)-10, mean3(2)+10);
z3 = zeros(100);

% Get points for plot
for i = 1:100
    for j = 1:100
        % Naïve Bayes Classifier
        z1(i,j) = normpdf(x1(j), mean1(1,1), sqrt(covar1(1,1)))*normpdf(y1(i), mean1(2,1), sqrt(covar1(2,2)));
        z2(i,j) = normpdf(x2(j), mean2(1,1), sqrt(covar2(1,1)))*normpdf(y2(i), mean2(2,1), sqrt(covar2(2,2)));
        z3(i,j) = normpdf(x3(j), mean3(1,1), sqrt(covar3(1,1)))*normpdf(y3(i), mean3(2,1), sqrt(covar3(2,2)));
        
        % Bayes Classifier
%         z1(i,j) = mvnpdf([x1(j), y1(i)], mean1', covar1);
%         z2(i,j) = mvnpdf([x2(j), y2(i)], mean2', covar2);
%         z3(i,j) = mvnpdf([x3(j), y3(i)], mean3', covar3);
    end
end
figure
hold on
surf(x1, y1, z1);
surf(x2, y2, z2);
surf(x3, y3, z3);   
axis([-4 8 -4 8]);
xlabel('First feature');
ylabel('Second feature');
title('Gaussian fit of classification regions');
