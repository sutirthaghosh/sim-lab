function []=VAM()

clc
matr=[11 13 17 14;16 18 14 10;21 24 13 10];
supply=[250 300 400];
demand=[200 225 275 250];
[rows,cols]=size(matr);
alloc=zeros(rows,cols);

alloc=kip(matr,alloc,(rows+cols-1),supply,demand);

i=0;
cost=0;
while(i<rows)
    j=0;
    while(j<cols)
        cost=cost+(matr(i+1,j+1)*alloc(i+1,j+1))
        j=j+1;
    end
    i=i+1;
end


s=['Allocation Matrix '];
disp(s)
disp(alloc)
s=['Cost is ',num2str(cost)];
disp(s)

end

function [allo]=kip(matr,allo,number,supply,demand)
if(number==0)
    return;
end
penalty=intmin();
i=0;
prow=0;
pcol=0;
[rows,cols]=size(matr);

if(rows==1)
    m=0;
    while (m<cols)
        m=m+1;
        allo(1,m)=demand(m);
    end
    return;    
end
if(cols==1)
    m=0;
    while (m<rows)
        m=m+1;
        allo(m,1)=supply(m);
    end
    return;    
end

%for cols
dup=matr;
[M,I]=min(matr);
while (i<cols)
    dup(I(i+1),i+1)=intmax();
    i=i+1;
end
Md=min(dup);
i=0;
while (i<cols)
    k=Md(i+1)-M(i+1);
    if(k>penalty)
        penalty=k;
        prow=I(i+1);
        pcol=i+1;
    end
    i=i+1;
end

%for rows

dup=matr;
i=0;
[M,I]=min(matr,[],2);
while (i<rows)
    dup(i+1,I(i+1))=intmax();
    i=i+1;
end
Md=min(dup,[],2);
i=0;
while (i<rows)
    k=Md(i+1)-M(i+1);
    if(k>penalty)
        penalty=k;
        pcol=I(i+1);
        prow=i+1;
    end
    i=i+1;
end
%cdup = matr;
%prow;
%pcol;
%supply(prow);
%demand(pcol);

%A blank matrix to store values and duplicate for reduction
dup = matr;
value=zeros(rows,cols);


%for deletion and allocation
if(supply(prow)>demand(pcol))
    supply(prow)=supply(prow)-demand(pcol);
    %allo(prow,pcol)=demand(pcol);
    value(prow,pcol)=demand(pcol);
    demand(pcol)=[];
    allo(:,pcol)=[];
    dup(:,pcol)=[];
    rorc=1;
    add=zeros(rows,1);    
else
    demand(pcol)=demand(pcol)-supply(prow);
    %allo(prow,pcol)=supply(prow);
    value(prow,pcol)=supply(prow);
    supply(prow)=[];
    aldup=allo';
    aldup(:,prow)=[];
    allo=aldup';
    dup=matr';
    dup(:,prow)=[];
    dup=dup';
    rorc=2;
    add=zeros(cols,1);
end


%dup;

%calling the recursion
allo=kip(dup,allo,number-1,supply,demand);



%add

%Adding a blank row/column depending on what was deleted to get the
%original structure

if(rorc==1)
    k=pcol-1;
    if(k==0)
        allo=[add,allo];
    else if(pcol==cols)
            allo = [allo, add];
        else
            allo = [allo(:,1:pcol-1), add, allo(:,pcol:cols-1)];
        end
    end
end
if(rorc==2)
    l=prow-1;
    aldup=allo';
    if(l==0)
        aldup = [add, aldup];
    else if(prow==rows)
            aldup = [aldup, add];     
        else
            n=55
            aldup = [aldup(:,1:prow-1), add, aldup(:,prow:rows-1)];
        end
    end
    allo=aldup';
end

%value


%Adding the value matrix with the reformed allocation matrix
allo=allo+value;

return;



end