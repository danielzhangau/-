%0-1规划求指派问题
function [y,fval]=zhipai(C)%C为指派n*n系数矩阵
C=C';
f=C(:);%生成一个列向量，作为目标函数系数，matlab默认以列排序
[m,n]=size(C);
Aeq=zeros(2*n,n*n);%2*n个等式约束，n*n个变量
for i=1:n  %这里先生成的是后四个等式约束的左端项
    Aeq(1:n,1+(i-1)*n:i*n)=eye(n,n);
end
for i=1:n  %前四个等式约束左端项
    Aeq(i+n,1+(i-1)*n:i*n)=ones(1,n);
end
beq=ones(2*n,1);
lb=zeros(n*n,1);
ub=ones(n*n,1);
x=linprog(f',[],[],Aeq,beq,lb,ub);%线性规划函数
y=reshape(x,n,n);%将上式求出的x值变成n阶矩阵
y=y';%上式生成的是按列排列的，所以转致一下
y=round(y);%对y元素取整，生成匹配矩阵
sol=zeros(n,n);
for i=1:n
    for j=1:n
        if y(i,j)==1
            sol(i,j)=C(j,i);%匹配矩阵
        end
    end
end
fval=sum(sol(:));%极小值的目标函数值