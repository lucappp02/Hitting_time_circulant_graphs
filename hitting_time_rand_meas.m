function y= hitting_time_rand_meas(A, initial, tau, N_tau,dim)
   
    %P = 1-D
    D1 = zeros(dim);
    D1(1,1) = 1;
    P1 = eye(dim)- D1;

    D2 = zeros(dim);
    D2(2,2) = 1;
    P2 = eye(dim)- D2;

    U = expm(-1i*A*tau);

    dummy = eye(dim);
    theta = U*dummy(:,initial);
    
    % Ftot = 1-S_N_tau
    val = rand;
    if val>.5
        Ftot = theta'*D2*theta;
    else
        Ftot = theta'*D1*theta;
    end
    n_mean = Ftot;
    
    for i=2:N_tau
        
        val_past = val;
        val = rand;
        if val_past>.5
            theta = U*P2*theta;
        else
            theta = U*P1*theta;
        end

        if val>.5
            Fn = theta'*D2*theta;
        else
            
            Fn = theta'*D1*theta;
        end
        Ftot = Ftot + Fn;
        n_mean = n_mean+i*Fn;
    end

    y = [Ftot,n_mean];