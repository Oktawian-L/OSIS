%Ford-Fulkerson 
function FordFulkerson
    clc; clear;
    
    % example - we can put our from solver for  next step 
    s = 1; t = 6; f = 0;
    cap = [ 0 16 13  0  0  0;
            0  0 10 12  0  0;
            0  4  0  0 14  0;
            0  0  9  0  0 20;
            0  0  0  7  0  4;
            0  0  0  0  0  0];
      
    len = length(cap);
        

    while true
        p = shortestPathDP(cap,1,6,1);
        if p(1) == 0, break; end
        flow = max(max(cap));
        for j = 2:length(p)
            flow = min(flow,cap(p(j),p(j-1)));
        end
        for j = 2:length(p)
            a = p(j); b = p(j-1);
            cap(a,b) = cap(a,b) - flow;
            cap(b,a) = cap(b,a) + flow;
        end
        f = f + flow;
    end
    disp(['Maksymlany przep�yw =  ' num2str(f)]);
    disp('Sie� rezydualna = ');
    disp(cap);
    
%% Find an Augmenting Path
    function F = findPath(A)            % BFS (Breadth-first Search)
        q = zeros(1,len);               % queue
        pred = zeros(1,len);            % predecessor array
        front = 1; back = 2;
        pred(s) = s; q(front) = s;
        while front ~= back
            v = q(front);
            front = front + 1;
            for i = 1:len
                if pred(i) == 0 && A(v,i) > 0
                    q(back) = i;
                    back = back + 1;
                    pred(i) = v;
                end
            end
        end
        path = zeros(1,len);
        if pred(t) ~= 0
            i = t; c = 1;
            while pred(i) ~= i
                path(c) = i;
                c = c + 1;
                i = pred(i);
            end
            path(c) = s;
            path(c+1:len) = [];
        end
        F = path;
    end
end