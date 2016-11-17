clc

matrix = [10 0 20 11;12 7 9 20;0 14 16 18];
supply = [20 25 15];
demand = [10 15 15 20];
z = zeros(3,4);

demand_size = size(demand);
supply_size = size(supply);
[m,n] = size(matrix);
i = demand_size(2) + supply_size(2) -1;
cost = 0;

while(i>0)
    [min_val,idx] = min(matrix(:));
    [row,col] = ind2sub(size(matrix),idx);
    sprintf('(%d,%d)',row,col)
    
    if(demand(col) == supply(row))
        z(row,col) = supply(row);
        cost = cost + supply(row)*matrix(row,col);
        supply(row) = 0;
        demand(col) = 0;
        matrix(row,:) = intmax();
        matrix(:,col) = intmax();
    else
        if supply(row)>demand(col)
            z(row,col) = demand(col);
            cost = cost + demand(col)*matrix(row,col);
            supply(row) = supply(row) - demand(col);
            demand(col) = 0;
            matrix(:,col) = intmax();
        else
            z(row,col) = supply(row);
            cost = cost + supply(row)*matrix(row,col);
            demand(col) = demand(col)-supply(row);
            supply(row) = 0;
            matrix(row,:) = intmax(); 
        end
    end   
    i=i-1;
end

disp(z);
disp(cost);

