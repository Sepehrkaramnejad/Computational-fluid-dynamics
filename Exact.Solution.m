clc
clear all
close all       %Exact Solution      
T1=zeros(11,21)
T2=zeros(11,21)
T=zeros(11,21)
L=20
W=10
s1=0
s2=0
for x=1:21
    for y=1:11
        for n=1:100
            S1=((1-cos(n*pi))/(n*pi))*(sinh((n*pi*(W-y))/L))/(sinh(n*pi*W/L))*sin(n*pi*x/L)
            S2=((1-cos(n*pi))/(n*pi))*(sinh((n*pi*y/L))/(sinh(n*pi*W/L))*sin(n*pi*x/L))
            s1=S1+s1
            s2=S2+s2
        end    
        T1(y,x)=73*2*s1
T2(y,x)=75*2*s2
T(y,x)=T1(y,x)+T2(y,x)
    end
end
