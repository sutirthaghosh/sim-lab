function [] = practice()
 y = 1:10;
 fib(1,1,1000);
 end

function [out1] = myfunc( x )
 out1 = sqrt( 1 + (cos(x)).^2 );
end
function [] = fib(a,b,n)
    if(n==0)
        return;
    else
        %disp(a+b);
        fprintf(' %d ,',a+b);
        fib(b,a+b,n-1);
    end
end