%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Fits a quadratic line to the data from data2a.mat                     %
%                                                                         %
%   v1.0    Last edited: 2017/10/03                                       %
%                                                                         %
%   Made by:                                                              %
%       Lu�s Rei n� 78486                                                 %
%       Jo�o Gir�o n� 78761                                               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question1_5
    
    [beta1_5, error1_5, e1_5] = LSE(2,3);

    % Save generated variables in a file
    save('beta1_5.mat');
    save('error1_5.mat');
    save('e1_5.mat');
    
end