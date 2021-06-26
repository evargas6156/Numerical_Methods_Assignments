function [y,t] = ab4(f,t0,tf,alpha,N)
   %function that computes solve the IVP using four step Adams-Bashforth method
    %INPUTS: 
    %function f
    %initial condition alpha
    %bounds of interval [t0,tf]
    %N number of nodes used
    %OUTPUT: 
    %y the solution
    %t the time sequence
    
    %% creation of the nodes and time step
    %find delta t 
    deltaT = (tf - t0) / N;
    
    %initialize time steps
    t = [t0];
    
    current = t0;
    %add the appropriate nodes to the timestep
    for i = 2 : N + 1
       current = current + deltaT;
       
       t = [t, current]; 
    end
    
    %turn t into a column vector 
    t = t';   

    %% use RK4 for the first steps
    %initialize y to also hold alpha
    y = zeros(size(t));
    y(1) = alpha;
    
    %use rk4 method to find y1, y2, y3, and save it to y
    for i = 2 : 4
        
        %calculate k1, k2, k3, and k4 for the current timestamp
        k1 = deltaT * f( t(i - 1), y(i - 1) ); 
        k2 = deltaT * f( t(i - 1) + (deltaT/2), y(i - 1) + 1/2 * k1 ); 
        k3 = deltaT * f( t(i - 1) + (deltaT/2), y(i - 1) + 1/2 * k2 ); 
        k4 = deltaT * f( t(i - 1) + deltaT, y(i - 1) + k3 ); 
        
        %calculate rk4 solution for the current timestep
        y(i) = y(i - 1) + (1 / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
        
    end 
    
    %% use AB4 for the rest
    %iterate over remaining y's
    for i = 5 : size(t, 1)
        
        y(i) = y (i - 1) + (deltaT / 24) * ( 55 * f(t(i - 1), y(i - 1)) - 59 * f(t(i - 2), y(i - 2)) + 37 * f(t(i - 3), y(i - 3)) - 9 * f(t(i - 4), y(i - 4)) );
        
    end

    
end