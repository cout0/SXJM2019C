flag=0;
g=9.8;	%重力加速度
f=@(u,v)(v/3.6).^2./(2*g.*u);	%计算刹车距函数
u=[0.6 0.9];	%摩擦系数
v=[1:60];		%车速模拟范围
ok1=[];		%车距1数组
ok2=[];		%车距2数组
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
xlabel('车速 km/h')
ylabel('刹车距离m')
title('车速与刹车距离关系图')
fprintf('u=0.6时，刹车距不超过5m的最大车速：%.2f\n',ok1(1,size(ok1,2)));
fprintf('u=0.9时，刹车距不超过5m的最大车速：%.2f\n',ok2(1,size(ok2,2)));