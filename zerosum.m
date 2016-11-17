clc;
matr = [-1 2 -2;6 4 -6];
[rows,cols] = size(matr);
row_min = min(matr');
col_max = max(matr);
disp(row_min);
disp(col_max);
r=1;c=1;
no = 0;
a = max(row_min);
b = min(col_max);
if(a == b)
string = ['The min and max are same = ',num2str(a)];
disp(string);
end
while r<=rows
    c = 1;
    while c<=cols
        if row_min(r) == col_max(c) 
            answer = row_min(r);
            disp(row_min(r));
            no = no +1;
        end
    c = c+1;
    end
    r = r+1;
end
s = ['Value of the game is ',num2str(answer)];
s1 = ['No of saddle points =',num2str(no)];
disp(s)
disp(s1)