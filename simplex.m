clc

main=[1 -3 -5 -4 0 0 0 0;0 2 3 0 1 0 0 8;0 0 2 5 0 1 0 10;0 3 2 4 0 0 1 15];
dup=main
i=2;
min=intmax();
cindex=0;
while(i<8)
    
    if(main(1,i)<min)
        min=main(1,i);
        cindex=i;
    end
    i=i+1;
end

%min
%cindex
%count=3;
while(min<0)
    i=2;
    mini=intmax();
    rindex=0;
    while(i<5)
        c=main(i,8)/main(i,cindex);
        if(c<0)
            c=c*-1;
        end
        if(c<mini)
            mini=c;
            rindex=i;
        end
        i=i+1;
    end
    
    %rindex

    i=1;
    dup=main;
    while(i<5)
        if(i~=rindex)            
            k=main(i,:)*main(rindex,cindex);
            j=main(rindex,:)*main(i,cindex);
            k=k-j;
            main(i,:)=k;            
        end        
        i=i+1;
    end
    
    main
    
    i=2;
    min=intmax();
    cindex=0;
    while(i<8)
        if(main(1,i)<min)
            min=main(1,i);
            cindex=i;
        end
        i=i+1;
    end
    
    %cindex
    %min
    
    %min=2;
    %count=count-1;
end


i=1;
while(i<5)
    j=1;
    index=0;
    while(j<5)
        if(main(i,j)>0)
            index=j;
        end
        j=j+1;
    end 
    %index
    c=main(i,8)/main(i,index);
    if(index==1)
        s=['Max z = ', num2str(c)];
        disp(s)
    else
        s=['for x',num2str(index-1),' = ',num2str(c)];
        disp(s)
    end
    
    i=i+1;
end