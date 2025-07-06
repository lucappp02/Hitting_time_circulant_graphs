function y= hitting_time_pi_meas(A, initial, tau, N_tau,dim)
   
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
    Ftot = theta'*D1*theta;
    n_mean = Ftot;
    pi_approx = 0;
    val = 1;
    for i=2:N_tau
        pi_approx = pi_approx*10;
        val_past = val;
        val = floor(pi*10^(i-2)-pi_approx);
        if mod(val_past,2) ==0
            theta = U*P2*theta;
        else
            theta = U*P1*theta;
        end

        if mod(val,2)==0
            Fn = theta'*D2*theta;
        else
            
            Fn = theta'*D1*theta;
        end
        Ftot = Ftot + Fn;
        n_mean = n_mean+i*Fn;
    end

    y = [Ftot,n_mean];