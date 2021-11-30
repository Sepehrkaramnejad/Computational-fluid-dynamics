clc                   %Sepehr karamnejad 920479573
clear all
close all
k=202.4;            % solving 2d heat transfer crank nicolson method
dq=5*10^4;           % for solving with C-N method we must solve series of equation , so we can use Jacobi method
Tn=zeros(171,1);
Nt=500;
dt=0.05;
[A]=Zarayeb         % found at Zarayeb Function
[B]=Malumha          %found aat Malumha Function
tol=1e-10;
Normval=1;              
itr=0;                   %iterations , Tekrar ha
t=0;
Lx=0.2;
Ly=0.1;
Nx=21;
Ny=11;
x=linspace(0,Lx,Nx)
y=linspace(0,Ly,Ny)
T(:,1)=124.407114624506
T(1,:)=73
T(11,:)=50
T(:,21)=75
for n=1:Nt
    Tc=Tn
    t=t+dt
while Normval>tol       % Jacobi method
    Tnold=Tn;
for i=1:171
    S=0;
    for j=1:171
        if i~=j
            S=S+A(i,j)*Tn(j);
        end
    end
    Tn(i)=(B(i)-S)/A(i,i)
end
Normval=abs(Tnold-Tn);
itr=itr+1
end
end
Nx=21
Ny=11
Lx=0.2
Ly=0.1
T=zeros(Ny,Nx)
k=2
n=0
while k<21                   %invert (171,1) matrix to (9*19) matrix for mesh it
for i=1:9
    T(i+1,k)=Tn(i+n)
end
k=k+1
n=n+9
end
x=linspace(0,Lx,Nx)
y=linspace(0,Ly,Ny)
[X,Y]=meshgrid(x,y);
mesh(x,y,T);axis([0 Lx 0 Ly 0 150]);