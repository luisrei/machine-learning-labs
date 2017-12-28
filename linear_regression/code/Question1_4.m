%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Fits a quadratic line to the data from data2.mat                      %
%                                                                         %
%   v1.0    Last edited: 2017/10/03                                       %
%                                                                         %
%   Made by:                                                              %
%       Luís Rei nº 78486                                                 %
%       João Girão nº 78761                                               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question1_4
    
    [beta1_4, error1_4, e1_4] = LSE(2,2);

    % Save generated variables in a file
    save('beta1_4.mat');
    save('error1_4.mat');
    save('e1_4.mat');
    
end