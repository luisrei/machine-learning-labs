%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Fits a straight line to the data from data1.mat                       %
%                                                                         %
%   v1.0    Last edited: 2017/10/03                                       %
%                                                                         %
%   Made by:                                                              %
%       Luís Rei nº 78486                                                 %
%       João Girão nº 78761                                               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question1_3
    
    [beta1_3, error1_3, e1_3] = LSE(1,1);

    % Save generated variables in a file
    save('beta1_3.mat');
    save('error1_3.mat');
    save('e1_3.mat');
    
end
