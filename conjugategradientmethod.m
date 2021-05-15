X1=input('Enter the value of initial X1=')%initial value input
Cf=input('Enter the coefficients [a b c d e]=')%coeff. input
a=Cf(1);b=Cf(2);c=Cf(3);d=Cf(4);e=Cf(5);
syms f(x1,x2)
f(x1,x2)=a*x1+b*x2+c*(x1)^2+d*x1*x2+e*(x2)^2% obj.function declaration
%E.X. f(x1,x2)= x1-x2+2*(x1)^2+2*x1*x2+(x2)^2 implies a=1,b=-1,c=2,d=2,e=1
ezcontour(f) % obj.function plot
hold on;
gradf(x1,x2)=[diff(f,x1);diff(f,x2)]% gradient of function
%first iteration
s1=-1*gradf(X1(1),X1(2)) %s1 direction calculation
syms h
p=f(X1(1)+h*s1(1),X1(2)+h*s1(2));
m=diff(p,h)==0
h=solve(m)%step size calculated
X2=X1+h*s1
plot([X1(1) X2(1)],[X1(2) X2(2)]);%points ploted
hold on;
% second interation onwords
n=1;%condition for while loop
while n
    if s1~=[0;0]%if s1 is not zero then only calculation is done
        a=gradf(X1(1),X1(2));%vector calculated for mean value
        b=gradf(X2(1),X2(2));%vector calculated for mean value
        s2=(-1*gradf(X2(1),X2(2)))+((norm(b)/norm(a))^2)*s1 %s2 calculated
        if s2==[0;0]%if s2 is zero then we can't calculate h
            X3=X2
        else
            syms h
            p=f(X2(1)+h*s2(1),X2(2)+h*s2(2));
            m=diff(p,h)==0
            h=solve(m)%step size calculated
            X3=X2+h*s2
        end
        X1=X2;
        X2=X3;
        s1=s2;%value reassigned for next iteration
    else
        n=0;%if s1 is zero then loop should be stopped.
        disp('X3 is optimum')
    end
    plot([X1(1) X2(1)],[X1(2) X2(2)]); %points ploted
    hold on;
end








