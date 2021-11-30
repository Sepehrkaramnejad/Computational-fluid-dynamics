clc                          %Sepehr Karamnejad 920479573
clear all
close all
alpha=0.85464*10^-4;      % solving heat transfer 2d explicit method
k=202.4;
dq=5*10^4;
Lx=0.2;    %distance in x dimension
Ly=0.1;     %distance in y dimension
Nx=21;        %number of nods in x dimension
Ny=11;         %number of nods in y dimension
Nt=1000;       %number of nods in t dimension
dx=0.01;       
dy=0.01;
dt=0.05;
Tn=zeros(Ny,Nx);       
Tn(:,:)=30             %initial values
Tn(11,:)=50;
Tn(:,21)=75;
Tn(:,1)=124.407114624506;
Tn(1,:)=73;
t=0;
x=linspace(0,Lx,Nx);
y=linspace(0,Ly,Ny);
[X,Y]=meshgrid(x,y);
for n=1:Nt
    Tc=Tn;
    t=t+dt;
    for i=2:Nx-1
        for j=2:Ny-1
            Tn(j,i)=Tc(j,i)+...
            (alpha*dt/((dx)^2))*(Tc(j-1,i)+Tc(j,i-1)-4*Tc(j,i)+Tc(j+1,i)+Tc(j,i+1));
        end
    end
    
Sx=1;
Sy=1:11;
Tn(Sy,Sx)=Tn(Sy,Sx)+alpha*dq*dt/(k*0.1);     % heat generate at the left edge
mesh(x,y,Tn); axis([0 Lx 0 Ly 0 150]);
 pause(0.01);

end