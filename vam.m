function[] = vam()
matr = [11 13 17 14;16 18 14 10;21 24 13 10];
[rows,cols]=size(matr);
sol_mat = zeros(rows,cols);
supply = [250 300 400];
demand = [200 225 275 250];
[mincol,rowidx] = min(matr);
[minrow,colidx] = min(matr');
dup1 = matr;
for i = 1:cols
    dup1(rowidx(i),i)=50000;
end
dup2 = matr;
for i = 1:rows
    dup2(i,colidx(i))=50000;
end
[mincol2,rowidx2] = min(dup1);
[minrow2,colidx2] = min(dup2');
pcols = mincol2 -mincol;
prows = minrow2 - minrow;
disp(pcols);
disp(prows);
[a,b] = max(pcols);
[c,d] = max(prows);
disp(a);
disp(c);
i=0;j=0;
if (a > c)
   [val,idx]=min(matr(:,b));
   i=idx;
   j=b;
else
   [val,idx]=min(matr(d,:));
   j=idx;
   i=d;
end
disp(i);
disp(j);
sol_mat(i,j)=min(demand(i),supply(j));
disp(sol_mat);
if(demand(i) > supply(j))
    supply(j) = 0;
else
    if (demand(i) == supply(j))
        demand(i)=0;supply(j)=0;
    else
       demand(i) = 0; 
    end
end

end