f=@(m,n,x)7.5.*x+1.5*((m-x).^2+n^2);	%ʱ���Ȩ��������
x=1:100;
for i=1:100
 for j=1:50
  y=f(i,j,x);
  plot(x,y,'k-');
  title(['��ʱ�ĳ�վ������ֵΪ:',num2str(i),'��',num2str(j)]);
  pause(0.001);
  end
end