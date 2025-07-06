 jump = 2;
dim =6 ;
mesh = 1000;
initial = dim;
N_tau = 1000;
alpha = [0,pi/6, pi/4, pi/3,pi/2,2*pi/3];
finaly1 = zeros([6 1]);
finaly2 = zeros([6 1]);
finalyx = zeros([6 1]);
tmin = 1;
tmax = 5;

for iter =1:6
    finalyx(iter) = alpha(iter);
    X = zeros([mesh 1]);
    Y = zeros([mesh 1]);
    X1 = zeros([mesh 1]);
    Y1 = zeros([mesh 1]);
    
    Z= zeros([mesh 1]);
    Z1= zeros([mesh 1]);
    
    tau = tmin;
    step = (tmax-tmin)/mesh;
      A = circulant(horzcat(zeros(1,1), exp(1i*alpha(iter))*ones(1,jump),zeros(1,dim-jump-1)));
            A = A+A';
     
     
 
    
    
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
    
        finaly1(iter) = trapz(Y);
        finaly2(iter) = trapz(Z);
end
   finaly1 = [ 12279.4457202928,
13462.3250034311,
16810.5359393887,
18441.5618107818,
6584.70183020109,
18441.5618107824];
   finaly2 = [9507.16505078498,
10501.4201182701,
14241.4822954001,
15132.5403114047,
5014.99053167105,
15056.0838714336];
       figure
    plot(finalyx,finaly1)
    hold on 
    plot(finalyx,finaly2)

   