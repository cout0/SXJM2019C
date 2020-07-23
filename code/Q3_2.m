vh=1.5;	%乘客速度
vc=7.5;	%汽车速度
l1=1:100;		%行人长度模拟范围
l2=1:200;		%汽车长度模拟范围
t1=l1/vh;		
t2=l2/vc;

figure(1)
plot(l1,t1,'k--');
xlabel('距离/m');
ylabel('花费时间/t');
title('行人的时间花费');

figure(2)
plot(l2,t2,'k--');
xlabel('距离/m');
ylabel('花费时间/t');
title('出租车的时间花费');

