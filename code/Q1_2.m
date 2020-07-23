cost=0.6;		%每公里油耗
v_h=110/60;	%高速最高110km/h，换成km/min
v_a=30/60;	%平均车速
L=5;		%车长不超过5m
d=10:80;		%机场与市区距离10~80km
t=1:100;		%1~100min
n=1:20;		%排队可作为第n批进入载客
C=8;		%拟定出租车载客起步价
f=@(x)0.0644*x^2+0.5020*x+7.2342;	%收入拟合函数
f1=zeros(size(d,2),size(t,2));
for i=1:size(d,2)
 st=fix(d(1,i)/v_h);
 for j=1:st
  f1(i,j)=-0.6*v_h*j;
 end
 for j=st:100
  f1(i,j)=f1(i,st)+f((j-st)*v_a);
 end
end
figure(1);
mesh(d,t,f1','EdgeColor','k');
title('市区距离与收支关系');
xlabel('市区距离d/km');
ylabel('离开时间t/min');
zlabel('收益金额$');

f2=zeros(size(d,2),size(t,2));
for i=1:size(d,2)
 st=fix(d(1,i)/v_h);
 for j=1:st
  f2(i,j)=f(j*v_h);
 end
 for j=st:100
  f2(i,j)=f2(i,st)+f((j-st)*v_a);
 end
end
figure(2)
mesh(d,t,f2','EdgeColor','k');
title('无需排队时市区距离与收支关系');
xlabel('市区距离d/km');
ylabel('时间t/min');
zlabel('收益金额$');

t_w=1:99;
f3=zeros(size(d,2),size(t_w,2));
for i=t_w
 for j=1:size(d,2)
  if f1(j,100)>f2(j,100-i)
    f3(j,i)=1;
  else
    f3(j,i)=-1;
  end
 end
end
figure(3);
mesh(d,t_w,f3','EdgeColor','k');
title('决策方案')
xlabel('市区距离/km');
ylabel('等待时间/min');
zlabel('决策方案');