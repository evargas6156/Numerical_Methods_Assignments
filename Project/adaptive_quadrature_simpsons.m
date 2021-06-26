function I = adaptive_quadrature_simpsons(f,a,b,tol)
    %function that computes \int_a^b f(x) dx using Adaptive Quadrature 
    %applied to simpsons rule, that is with
    %INPUTS: 
    %function f
    %bounds of interval [a,b]
    %tol the tolerance we want the answer to be within as a decimal
    %OUTPUT: 
    %I the numerical integration - empty vector if the approximation within the
    %desired error tolerance could not be generated
    
    %we will first declare a stack for our potential intervals
    stack = CStack();
    
    %the first element we will  push to the start is our default interval
    stack.push([a,b]);
    
    %initialize our approximation to be 0
    I = 0;  
    
    %a counter to ensure we dont iterate forever along with a defined max
    %interation
    maxIterations = 10000;
    iterations = 0;
    
    %iterate until the stack is empty
    while ~stack.isempty() && iterations < maxIterations
        
        %pop the interval on the top of the stack
        currInterval = stack.pop(); %currInterval now is an array of size 2
        
        %break the current interval into its individual start and end
        first = currInterval(1); %named first and last because matlab doesnt allow the use of end 
        last = currInterval(2);
        
        %now we will calculate a midpoint between the interval to refine
        midpoint = (first + last) / 2;
        
        %calculate integral using interval popped off the stack
        %this interval will be done with a basic 2 interval rule
        basicIntegral = ((last - first) / 6) * (f(first) +  4 * f(midpoint) + f(last));
        
        %calculate the two sub midpoints necessary to compute 4 interval
        %simpsons rule
        subMidLeft = (first + midpoint) / 2;
        subMidRight = (midpoint + last) / 2;
        
        %we will now calculate a refined integral using 4 intervals 
        refinedIntegral = (((midpoint - first) / 6) * (f(first) +  4 * f(subMidLeft) + f(midpoint))) + (((last - midpoint) / 6) * (f(midpoint) +  4 * f(subMidRight) + f(last)));
        
        %check to see if we are within the tolerance
        if abs(basicIntegral - refinedIntegral) < 15 * tol * (last - first) 
        
            %add the refined integral to our final integral solution
            I = I + refinedIntegral;
            
        else
            
            %if the tolerance still hasnt been met then add both of the new
            %intervals containing the midpoint to our stack
            stack.push([midpoint, last]);
            stack.push([first, midpoint]);
            
        end
        
        %increment the number of iterations
        iterations = iterations + 1;
        
    end
    
    %now we will check if we actually came to a solution or if we had to
    %terminate because of excessive iterations
    if iterations >= maxIterations
        
        %if we exceeded max iterations then print an error message, return
        %empty 
        disp('Max number of iterations exceeded, could not compute answer.')
        I = [];
    else
        
        %if we did not exceed then no need to do anything, return the
        %approximation I
        I = I;
        
    end
    
    
    
end
    
    
