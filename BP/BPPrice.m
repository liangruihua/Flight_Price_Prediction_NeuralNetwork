
%  创建一个新的前向神经网络 
net_1=newff(minmax(P),[10,1],{'tansig','purelin'},'traingdm')

%  当前输入层权值和阈值
inputWeights=net_1.IW{1,1}
inputbias=net_1.b{1}
%  当前网络层权值和阈值
layerWeights=net_1.LW{2,1}
layerbias=net_1.b{2}

%  设置训练参数
net_1.trainParam.show = 50;
net_1.trainParam.lr = 0.05;
net_1.trainParam.mc = 0.9;
net_1.trainParam.epochs = 50000;
net_1.trainParam.goal = 1e-4;

%  调用 TRAINGDM 算法训练 BP 网络
[net_1,tr]=train(net_1,P,T);

%  对 BP 网络进行仿真
A = sim(net_1,P);
%  计算仿真误差 
E = T - A;
MSE=mse(E)

%进行测试
TestResults=sim(net_1,test)

%计算测试误差
Error=testT-TestResults
MSETest=mse(Error)

plot([TestResults' testT'])
