function I = composite_trapezoid(f,a,b,n)
    %function that computes \int_a^b f(x) dx using composite Trapezoid rule
    %INPUTS: 
    %function f
    %bounds of interval [a,b]
    %n number of subintervals
    %OUTPUT: 
    %I the numerical integration
    
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
    %creation trapezoid rule
    for i = 1 : n
        disp(i);
        if a < b
            I = I + ( (meshSize / 2) * (f(nodes(i)) + f(nodes(i + 1))) );
        else
            I = I - ( (meshSize / 2) * (f(nodes(i)) + f(nodes(i + 1))) );
        end
    end
    
    
    
