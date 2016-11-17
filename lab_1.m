clc

value = [10 0 20 11;12 7 9 20;0 14 16 18];
z = zeros(3,4);
demand = [10 15 15 20];
supply = [20 25 15];


i=1;
j=1;
cost = 0;
while(i<4 && j<5 )
    if supply(i) < demand(j)
        z(i,j) = supply(i);
        demand(j) = demand(j) - supply(i);
        cost = cost + supply(i)*value(i,j);
        supply(i) = 0;
        i = i+1;
    else
        z(i,j) = demand(j);
        supply(i) = supply(i) - demand(j);
        cost = cost + demand(j)*value(i,j);
        demand(j) = 0;
        j=j+1;
    end
end

disp(z);
disp(cost);

