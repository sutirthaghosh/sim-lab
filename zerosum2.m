
matr = [30 10 -80;0 15 -20;90 20 50];
%matr = [-5 10 20;5 -10 -10;5 -20 -20];
minmax = min(max(matr'));
maxmin = max(min(matr ));
matr
br=1;
dup=matr;
while(minmax~=maxmin && br~=0)
    [rows,cols] = size(dup);
    br=0;
    i=1;
    while(i<=rows)
        j=1;
        while(j<=rows && i<=rows)
            i
            j
            rows
            if(dup(i,:) >= dup(j,:))
                if(i~=j)
                    disp('Ri >= Rj')
                    disp(matr(i,:))
                    disp(matr(j,:))
                    dup(j,:) = [];
                    rows = rows-1;
                    br=1;
                end
            end
            j=j+1;
        end
        i=i+1;
    end
    % for columns
    i=1;
    while(i<cols)
        j=1;
        while(j<=cols)
            if(dup(:,i) <= dup(:,j))
                if(i~=j)
                    dup(:,j) = []
                    cols = cols-1;
                    br=1;
                end
            end
            j=j+1;
        end
        i=i+1;
    end
minmax = min(max(dup'));
maxmin = max(min(dup )); 

end
disp(dup);
if(minmax ~=maxmin)
disp('NO saddle point found since minmax != maxmin')

else
disp('saddle point found')
disp(minmax);
matr
dup
end
