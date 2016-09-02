
%p:拟合输入函数矩阵，每列为一个样本
%t:拟合目标函数矩阵
%P_test测试数据矩阵
%t1测试目标矩阵；

[pn,minp,maxp,tn,mint,maxt]=premnmx(p,t);%数据归一化
p2= tramnmx(P_test,minp,maxp);
net=newelm(minmax(pn),[13,1],{'tansig','tansig'});%建立2层网络模型，其中参数可以根据要求修改，[隐含层节点数，输出层节点数即预测值个数]
net.trainparam.show=100;%每迭代100次显示1次
net.trainparam.epochs=2000;%最大迭代次数2000
net.trainparam.goal=0.0001;%迭代目标
net=init(net);%初始化网络
[net,tr]=train(net,pn,tn); %训练网络
PN=sim(net,p2);%仿真
t2= postmnmx(PN,mint,maxt);%仿真值反归一化
E = t1 - t2; 
MSE=mse(E);%网络性能指标MSE
MAE=mean(abs(E))
figure(1);%打开新窗口作图
X=1:100;%测试数据共有3个样本，这里应该根据测试样本数修改
plot(X,t2,'r*',X,t1,'bo');
title('o为真实值，*为预测值');%作图