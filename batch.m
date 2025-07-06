
 jump = 2;
dim =6 ;
mesh = 1000;
initial = dim;
N_tau = 10000;

tmin = 1;
tmax = 5;
X = zeros([mesh 1]);
Y = zeros([mesh 1]);
X1 = zeros([mesh 1]);
Y1 = zeros([mesh 1]);

Z= zeros([mesh 1]);
Z1= zeros([mesh 1]);

tau = tmin;
step = (tmax-tmin)/mesh;
  A = circulant(horzcat(zeros(1,1), exp(1i*pi/4)*ones(1,jump),zeros(1,dim-jump-1)));
        A = A+A';
        tol = .01;
 

    % for i= 1:mesh
    %     tau  = tau+step;
    %     X(i) = tau;
    % 
    % 
    %     B1= hitting_time_double_meas(A, initial, X(i), N_tau,dim);
    %     B2= hitting_time_rand_meas(A, initial, X(i), N_tau,dim);
    %     if abs(B1(1)-1)<tol && abs(B2(1)-1)<tol 
    % 
    %         X(i) = tau;
    % 
    %         Y(i) = real(B1(2));
    % 
    %          Z(i) = real(B2(2));
    % 
    %     else 
    %         i = i-1;
    %     end
    % 
    % 
    % end


    for i= 1:mesh
        tau  = tau+step;
        X(i) = tau;


        B1= hitting_time_double_meas(A, initial, X(i), N_tau,dim);
        B2= hitting_time_rand_meas(A, initial, X(i), N_tau,dim);
 

            X(i) = tau;
    
            Y(i) = real(B1(2));
           
             Z(i) = real(B2(2));
            

             Y1(i) = real(B1(1));
             Z1(i) = real(B2(1));
      
        

    end

    trapz(Y)
    trapz(Z)

   figure
    plot(X,Y)
    hold on 
    plot(X,Z)

    figure
    plot(X,Y1)
    hold on 
    plot(X,Z1)