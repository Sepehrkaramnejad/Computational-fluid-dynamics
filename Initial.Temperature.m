function [T1]=IniTemp         % find the tempreture of the left edge
q=5*10^4;
k=202.4;
dx=0.01;
T1(1)=75;
for i=2:21
    T1(i)=q/k*dx+T1(i-1);       % using backward method
end
end                           
                               % T1(11,:)=124.4071