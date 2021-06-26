function [y,t] = euler_timestep(f,t0,tf,alpha,N)
    %function that computes the solution to the IVP y'=f, y(t0)=alpha, over the interval [t0,tf] with N steps.
    %INPUTS: 
    %function f
    %initial condition alpha
    %bounds of interval [t0,tf]
    %N number of nodes used
    %OUTPUT: 
    %Y the solution
    %t the time steps
    
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
    
    
    %creation solution via Euler's method

    %iterate over every timestep
    for i = 2 : N + 1
        
        %calculate eulers solution for the current timestep
        y(i) = y(i - 1) + deltaT * f( t(i - 1), y(i - 1) );
    end 

end