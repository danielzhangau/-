clc,clear
x0=[71.1 72.4 72.4 72.1 71.4 72.0 71.6]';%ע������Ϊ������ 
n=length(x0);
lamda=x0(1:n-1)./x0(2:n) %���㼶�� 
range=min(max(lamda')) %���㼶�ȵķ�Χ 
x1=cumsum(x0); %�ۼ����� 
B=[-0.5*(x1(1:n-1)+x1(2:n)),ones(n-1,1)];
Y=x0(2:n);
u=B\Y
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)})
yuce1=subs(x,'t',[0:n-1])' %Ϊ���Ԥ�⾫�ȣ��ȼ���Ԥ��ֵ������ʾ΢�ַ��̵Ľ� 
y=vpa(x,6) %���е� 6 ��ʾ��ʾ 6 λ���� 

k=length(yuce1);
y2=yuce1(2:k)-yuce1(1:k-1);
y2=vpa(y2,5)

y3(1)=x0(1)
y3(2:k)=y2
y3=vpa(y3,5)'

epsilon=(x0(2:n)-y3(2:n)); %����в�
epsilon=vpa(epsilon,5)

delta=abs(epsilon./x0(2:n)) %���������� 
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda' %���㼶��ƫ��ֵ


