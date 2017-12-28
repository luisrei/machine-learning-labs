%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Gradient Descent Optimization function                                %
%                                                                         %
%   Minimizes functions with multiple variables.                          %
%                                                                         %
%   v1.0    Last edited: 2017/10/12                                       %
%   Made by:  Luís Rei   nº 78486                                         %
%             João Girão nº 78761                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question2_2
    %% Initialization
    % Clear all workspace variables
    clear;
    % Close all figures
    close all;
    % Parameter initialization
    quad2ini;
    % Variable definition
    global anim;
    anim = 1;
    a = [2 20];
    a= 20;
    eta = [0.01 0.03 0.1 0.3 1 3];
    eta = 0.3    
    steps = zeros(length(eta), length(a));
    cost = zeros(length(eta), length(a));
    
    fastest = zeros(1, length(a));
    div_tresh = zeros(1, length(a));
    
    %% Optimization
    for i = 1:length(a)
        for j = 1:length(eta)
            [steps(j,i), cost(j,i)] = quad2_1(a(i),eta(j));
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
    
    save('fastestq2_2.mat', 'fastest');
    save('div_treshq2_2.mat', 'div_tresh');
    save('stepsq2_2.mat', 'steps');
    save('costq2_2.mat', 'cost');
    
end