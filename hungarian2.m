function[]=hungarian2()
matr = [10 5 13 15 16;3 9 18 13 6;10 7 2 2 2;7 11 9 7 12;7 9 10 4 12];
disp(matr);
index = [0 0;0 0;0 0];
min_cost=intmax();
cost=0;
level = 0;
cost = hung(matr,cost,min_cost,level);
disp(cost);
end

function [min_cost] = hung(matr,cost,min_cost,level)
temp = cost;
%disp(matr);
[rows,cols] = size(matr);
c=1;
if isempty(matr)
    return
end
if rows >= 1 
    while c <= cols
        cost = temp+matr(1,c);
        if (min_cost > cost && rows == 1)
            min_cost = cost;
        end
        dup=matr;
        dup(1,:)= [];
        dup(:,c)= [];
        min_cost = hung(dup,cost,min_cost,level+1);
        c = c+1;
    end
    return
end
end
