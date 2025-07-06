function y= hitting_time_double_meas(A, initial, tau, N_tau,dim)
   
    %P = 1-D
    D = zeros(dim);
    D(1,1) = 1;
    D(2,2) = 1;
    P = eye(dim)- D;

    U = expm(-1i*A*tau);

    dummy = eye(dim);
    theta = U*dummy(:,initial);

    % Ftot = 1-S_N_tau
    Ftot = theta'*D*theta;
    n_mean = Ftot;

    for i=2:N_tau
        theta = U*P*theta;
        Fn = theta'*D*theta;
        Ftot = Ftot + Fn;
        n_mean = n_mean+i*Fn;
    end

    y = [Ftot,n_mean];