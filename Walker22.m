    k = 1:15; %intitalize k
    h = [ones(1, 4), zeros(1, 8), ones(1, 4)]; %given sequence 
    N = 16; %N point
    H_zero = 8; %first term
    H_pos = zeros(numel(k), N); %intialize matrix 15 by 16
    for kay = k
        for jay = 1:N  
            H_pos(kay, jay) = h(jay) * exp((-1i * 2 * pi * (jay - 1) * kay) / N); %the money
        end
    end
    H = sum(H_pos, 2); %row sum
    H = [H_zero; H]; % combine first term and last 15 terms
    