function[] = modi()
clc
cost_matrix = [5,1,8;9,4,0;17,6,7];
sol_matrix = [9,3,0;0,7,7;0,0,4];
[u_array_size,v_array_size] = size(cost_matrix);

u_array = [0 0 0];
v_array = [0 0 0];
x=1;
y=1;
no_of_equations = u_array_size+v_array_size-1;
equation_no=1;
while(equation_no<=no_of_equations)
    x=1;
    while (x <= u_array_size)
        y=1;
    while(y <= v_array_size)
         if (sol_matrix(x,y) ~= 0)
             if(x==1)
                v_array(y)=cost_matrix(x,y);
                equation_no=equation_no+1;
                y=y+1;
                continue
            end
                
            if (u_array(x)~=0 && v_array(y)==0)
                    v_array(y)=cost_matrix(x,y)-u_array(x);
                    equation_no=equation_no+1;
                    y=y+1;
                    continue
            end
            
            if (u_array(x)==0 && v_array(y)~=0)
                        u_array(x)=cost_matrix(x,y)- v_array(y);
                        equation_no=equation_no+1;
                        y=y+1;
                        continue
            end
                  
         end
        y=y+1; 
        
    end
     x=x+1;
    
     end
end
disp(u_array);
disp(v_array);
[row,col] = size(sol_matrix);
r=1;
c=1;
imp_cost = zeros(3);
while(r<=row)
    c=1;
    while(c<=col)
        if(sol_matrix(r,c)==0)
            imp_cost(r,c) = cost_matrix(r,c)-u_array(r)-v_array(c);
        end
        c=c+1;
    end
    r=r+1;
end
disp(imp_cost)
[min_val,idx]= min(imp_cost(:));
[row,col]= ind2sub(size(imp_cost),idx);
disp(row);
disp(col);
vmat = zeros(3);
dir = [0 0];
min = intmax();
% 1 denotes + and 0 denotes -
dfs(row,col,-1,-1,sol_matrix,dir,vmat,1,min);
disp(sol_matrix);
disp(imp_cost);
end




function [mini,vmat,path]= dfs(row,col,prow,pcol,smat,vmat,sign,mini)
    path=0;
    [row_s,col_s] = size(smat);
    if (prow == row && pcol == col && pcol~= -1 && prow ~=-1)
        path = 1;
        return;
    end
    if(prow == -1 && pcol == -1)
    prow = row;
    pcol =col;
    end
    if(vmat(prow,pcol) == 1)
        return;
    end
    vmat(prow,pcol) = 1;
    while smat(prow+1,pcol) == 0
        prow = prow +1;
    end
    while smat(prow,pcol+1) == 0
        p;
    end
    while smat(prow+1,pcol) == 0
        prow = prow +1;
    end
    while smat(prow+1,pcol) == 0
        prow = prow +1;
    end
    vmat(prow,pcol) = 0;
end









