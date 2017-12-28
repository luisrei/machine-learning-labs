%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Gradient Descent Optimization function                                %
%                                                                         %
%   Minimizes functions with one variable.                                %
%                                                                         %
%   v1.0    Last edited: 2017/10/11                                       %
%   Made by:  Luís Rei   nº 78486                                         %
%             João Girão nº 78761                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question2_1
    %% Initialization
    % Clear all workspace variables
    clear;
    % Close all figures
    close all;
    % Parameter initialization
    quad1ini;
    anim = 0;
    
    % Variable definition
    a = [0.5 1 2 5];
    eta = [0.001 0.01 0.03 0.1 0.3 1 3];
    steps = zeros(length(eta), length(a));
    cost = zeros(length(eta), length(a));
    
    fastest = zeros(1, length(a));
    div_tresh = zeros(1, length(a));
    
    %% Optimization
    for i = 1:length(a)
        for j = 1:length(eta)
            [steps(j,i), cost(j,i)] = quad1(a(i),eta(j));
        end
    end
    
    
    for i = 1:length(a)
        [~,eta_optimum] = min(steps(:,i));
        fastest(i) = eta(eta_optimum);
        for j = 1:length(eta) 
            if j == length(eta)
                div_tresh(i) = eta(j);
            elseif steps(j,i) < 1001 && steps(j+1, i) == 1001
                div_tresh(i) = eta(j);
                break
            end
        end
    end
    
    save('fastestq2_1.mat', 'fastest');
    save('div_treshq2_1.mat', 'div_tresh');
    save('stepsq2_1.mat', 'steps');
    save('costq2_1.mat', 'cost');
end