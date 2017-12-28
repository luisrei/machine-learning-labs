%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Gradient Descent Optimization function                                %
%                                                                         %
%   Minimizes functions with multiple variables with the help of a        %
%   momentum term.                                                        %
%                                                                         %
%   v1.0    Last edited: 2017/10/13                                       %
%   Made by:  Luís Rei   nº 78486                                         %
%             João Girão nº 78761                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question3
    %% Initialization
    % Clear all workspace variables
    clear;
    % Close all figures
    close all;
    % Parameter initialization
    quad2ini;
    % Variable definition
    global anim alfa;
    anim = 0;
    a = 20;
    eta = [0.003 0.01 0.03 0.1 0.3 1 3 10];
    possibleAlfa = [0 0.5 0.7 0.9 0.95];
    
    steps = zeros(length(eta), length(alfa));
    cost = zeros(length(eta), length(alfa));
    fastest = zeros(1, length(alfa));
    div_tresh = zeros(1, length(alfa));
    
    %% Optimization
    for i = 1:length(possibleAlfa)
        alfa = possibleAlfa(i);
        for j = 1:length(eta)
            [steps(j,i), cost(j,i)] = quad2_1(a,eta(j));
        end
    end
    
    for i = 1:length(possibleAlfa)
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
    
    save('fastestq3.mat', 'fastest');
    save('div_treshq3.mat', 'div_tresh');
    save('stepsq3.mat', 'steps');
    save('costq3.mat', 'cost');
    
end