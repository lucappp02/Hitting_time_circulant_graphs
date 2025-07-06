function Pdet = Pdet_contracted(N_tau,dim,in, tau,A)


proj_meas_eff = eye(dim);
proj_meas_eff(1,1) = 0;
proj_meas_eff(2,2) = 0;

    dummy = eye(dim);
    psi_in = dummy(:,in);
    
    evo = (proj_meas_eff*expm(-1i*tau*A))^N_tau;

        psi = evo*psi_in;
  
    
    Pdet = 1- (psi'*psi);