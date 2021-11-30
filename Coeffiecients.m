function [A]=Zarayeb(i,j)     %finding matrix of zarayeb A  (Ax=B)
alpha=0.85464*10^-4;
dx=0.01;
dt=0.05;
r=alpha*dt/dx^2
for i=1:171
A(i,i)=(1+2*r)    %Diogonal
if i<163
A(i,i+9)=-r/2
end
if i>9
    A(i,i-9)=-r/2
end
if i<171
A(i,i+1)=-r/2
end
if i>1
A(i,i-1)=-r/2
end
    end
end