flag=0;
g=9.8;	%�������ٶ�
f=@(u,v)(v/3.6).^2./(2*g.*u);	%����ɲ���ຯ��
u=[0.6 0.9];	%Ħ��ϵ��
v=[1:60];		%����ģ�ⷶΧ
ok1=[];		%����1����
ok2=[];		%����2����
s=zeros(2,size(v,2));
for i=1:2
 for j=1:size(v,2)
  s(i,j)=f(u(1,i),v(1,j));
  if s(i,j)<5
   if i==1
    ok1=[ok1 v(1,j)];
   else
    ok2=[ok2 v(1,j)];
   end
  end
 end
end
plot(v,s(1,:),'kx');
hold on
plot(v,s(2,:),'k.');
legend('u=0.6','u=0.9')
xlabel('���� km/h')
ylabel('ɲ������m')
title('������ɲ�������ϵͼ')
fprintf('u=0.6ʱ��ɲ���಻����5m������٣�%.2f\n',ok1(1,size(ok1,2)));
fprintf('u=0.9ʱ��ɲ���಻����5m������٣�%.2f\n',ok2(1,size(ok2,2)));