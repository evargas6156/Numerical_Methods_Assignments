function I = composite_simpsons(f,a,b,n)
%function that computes \int_a^b f(x) dx using composite Simpson's rule
    %INPUTS: 
    %function f
    %bounds of interval [a,b]
    %n+1 is the number of nodes
    %OUTPUT: 
    %I the numerical integration
 
    %if n is valid proceed to calculations
    if n > 0 &&  mod(n, 2) == 0 
        I = 0;
        %creation of the nodes and mesh size
        meshSize = abs(b - a) / n;
        %nodes to use as points for subintervals, start with a 
        nodes = [a];
    
        if a < b
            i = a + meshSize;
        
            %generate nodes by stepping over mesh size until b is reached 
            while i <= b
                nodes = [nodes, i];
                i = i + meshSize;
            end
        else
        
            i = a - meshSize;
        
            %generate nodes by stepping down
            while i >= b
                nodes = [nodes, i];
                i = i - meshSize;
            end
        
        end
        
        %calculate the integration for each subinterval 
        %creation simpsons rule
        for i = 1 : n
            
            %calculate the midpoint for the current interval
            currMidPoint = (nodes(i + 1) + nodes(i)) / 2;
            
            newMeshSize = (nodes(i + 1) - currMidPoint);
            
            %calculate the simpsons rule for current interval
            I = I + ( (newMeshSize / 3) * (f(nodes(i)) + (4 * f(currMidPoint)) + f(nodes(i + 1))) );
            
        end
        
    else
        %otherwise return empty vector
        I = [];

    end
end