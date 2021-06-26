function [y,t] = rk2(f,t0,tf,alpha,N)
   %function that computes solve the IVP using second order Runge-Kutta method
    %INPUTS: 
    %function f
    %initial condition alpha
    %bounds of interval [t0,tf]
    %N number of nodes used
    %OUTPUT: 
    %y the solution
    %t the time sequence
    
    %creation of the nodes and time step
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
    
    %initialize y to also hold alpha
    y = zeros(size(t));
    y(1) = alpha;
    
    %creation solution via RK2 method
    %iterate over every timestep
    for i = 2 : N + 1
        
        %calculate rk2 solution for the current timestep
        y(i) = y(i - 1) + deltaT * ( f(t(i - 1) + (deltaT / 2), y(i - 1) + (deltaT / 2) * f(t(i - 1), y(i - 1)) ) );
        
    end 
end