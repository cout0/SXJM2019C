cost=0.6;		%ÿ�����ͺ�
v_h=110/60;	%�������110km/h������km/min
v_a=30/60;	%ƽ������
L=5;		%����������5m
d=10:80;		%��������������10~80km
t=1:100;		%1~100min
n=1:20;		%�Ŷӿ���Ϊ��n�������ؿ�
C=8;		%�ⶨ���⳵�ؿ��𲽼�
f=@(x)0.0644*x^2+0.5020*x+7.2342;	%������Ϻ���
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
title('������������֧��ϵ');
xlabel('��������d/km');
ylabel('�뿪ʱ��t/min');
zlabel('������$');

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
title('�����Ŷ�ʱ������������֧��ϵ');
xlabel('��������d/km');
ylabel('ʱ��t/min');
zlabel('������$');

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
title('���߷���')
xlabel('��������/km');
ylabel('�ȴ�ʱ��/min');
zlabel('���߷���');