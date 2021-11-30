function [B]=Malumha(i)   % findin matrix of malumha B (Ax=B)
B=zeros(171,1)            %cause at the boundary we have constant temperature we find 9*19 (171 nods )matrix not 11*21(231 nods) 
alpha=0.85464*10^-4;
dx=0.01;
dt=0.05;
r=alpha*dt/dx^2
Tn=zeros(171,1)
Tn(:,1)=30
Tc=Tn
k=9
while k<154
    for i=2:8
        k=k+i
        B(k)=(1-2*r)*Tc(k)+(r/2)*(Tc(k+1)+Tc(k-1)+Tc(k+9)+Tc(k-9))      
        k=k-i
    end
k=k+9
end
k=0
for i=2:8
    k=k+i
    B(k)=(1-2*r)*Tc(k)+(r/2)*(Tc(k+1)+Tc(k-1)+Tc(k+9))
    k=k-i
end
for i=164:170
    k=k+i
    B(k)=(1-2*r)*Tc(k)+(r/2)*(Tc(k+1)+Tc(k-1)+Tc(k-9))
    k=k-i
end
for i=10:9:154
    B(i)=(1-2*r)*Tc(i)+(r/2)*(Tc(i+1)+Tc(i-9)+Tc(i+9))
end
for i=18:9:162
    B(i)=(1-2*r)*Tc(i)+(r/2)*(Tc(i-1)+Tc(i-9)+Tc(i+9))
end
B(1)=(1-2*r)*Tc(1)+(r/2)*(Tc(2)+Tc(10))                %finding 4nods at the corners separately
B(9)=(1-2*r)*Tc(9)+(r/2)*(Tc(8)+Tc(18))                
B(163)=(1-2*r)*Tc(163)+(r/2)*(Tc(164)+Tc(154))
B(171)=(1-2*r)*Tc(171)+(r/2)*(Tc(170)+Tc(162))
for i=1:9:163                               %cause tempreture at edges are constatn at any time we subtract Temp at time N and Time N+1 so we write r*Tempreture not r/2
    B(i)=B(i)+r*73
end
for i=9:9:171
    B(i)=B(i)+r*50
end
for i=163:1:171
    B(i)=B(i)+r*75
end
for i=1:9
    B(i)=B(i)+r*124.407114624506
end
end