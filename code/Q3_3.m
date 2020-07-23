f=@(m,n,x)7.5.*x+1.5*((m-x).^2+n^2);	%时间加权花销函数
x=1:100;
for i=1:100
 for j=1:50
  y=f(i,j,x);
  plot(x,y,'k-');
  title(['此时的出站口坐标值为:',num2str(i),'，',num2str(j)]);
  pause(0.001);
  end
end