%���Ϻ���Ϊ�ο���3km��10Ԫ��3~10km֮��2Ԫ/km��10km����3Ԫ/km
cost=0.6;%ÿ�����ͺļ۸�
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
xlabel('���⳵������')
ylabel('���⳵����')
hold on
a=polyfit(t,y,1);
plot(t,a(1)*t+a(2),'k--');
a	%y=1.8549t+2.2737
figure(2)
plot(t,y,'k*');
xlabel('���⳵������')
ylabel('���⳵����')
hold on
a=polyfit(t,y,2);
plot(t,a(1)*t.^2+a(2)*t+a(3),'k--');
a	%y=0.0644x^2+0.5020x+7.2342