function [y,t] = euler_system(f, g, t0,tf,alphas,N)
    %function that computes the solution to the system of IVPs
    % y1'=f(t,y1,y2) 
    % y2'=g(t,y1,y2)
    % y1(t0)=alpha(1), y2(t0)=alpha(2), over the interval [t0,tf] with N steps.
    %INPUTS: 
    % function f for y1'
    % function g for y2'
    % initial conditions alpha =[y1(t0),y2(t0)]
    % bounds of interval [t0,tf]
    % N number of nodes used
    %OUTPUT: 
    % Y the solution
    % t the time steps
    
    %creation of the nodes and time step
    %find delta t 
    deltaT = (tf - t0) / N;
    
    %initialize time steps
    t = [t0];
    
    current = t0;
    %add the appropriate nodes to the timestep
    while current < tf
       current = current + deltaT;
       
       t = [t, current];
    end
    
    %turn t into a column vector 
    t = t';   
    
    %initialize the matrix to hold solutions for 2d system
    y = zeros(size(t, 1), 2);
    y(1,1) = alphas(1);
    y(1,2) = alphas(2);
   
    
    %creation solution via Euler's method

    %iterate over every timestep
    for i = 2 : N + 1
        
        %calculate current solution for first de 
        y(i, 1) = y(i - 1, 1) + deltaT * f(t(i - 1), y(i - 1, 1), y(i - 1, 2));
        
        %calculate current solution for second de
        y(i, 2) = y(i - 1, 2) + deltaT * g( t(i - 1), y(i - 1, 1), y(i - 1, 2) );
    end 

end