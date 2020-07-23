%以上海市为参考，3km内10元，3~10km之间2元/km，10km以上3元/km
cost=0.6;%每公里油耗价格
t=1:20;
y=zeros(1,size(t,1));
for i=1:3
 y(1,i)=10-cost*i;
end
for i=3:10;
 y(1,i)=10+2*(i-3)-cost*i;
end
for i=10:20
 y(1,i)=y(1,10)+3*(i-10)-cost*(i-10);
end
figure(1)
plot(t,y,'k*');
xlabel('出租车公里数')
ylabel('出租车收益')
hold on
a=polyfit(t,y,1);
plot(t,a(1)*t+a(2),'k--');
a	%y=1.8549t+2.2737
figure(2)
plot(t,y,'k*');
xlabel('出租车公里数')
ylabel('出租车收益')
hold on
a=polyfit(t,y,2);
plot(t,a(1)*t.^2+a(2)*t+a(3),'k--');
a	%y=0.0644x^2+0.5020x+7.2342