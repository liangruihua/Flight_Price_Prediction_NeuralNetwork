
%  ����һ���µ�ǰ�������� 
net_1=newff(minmax(P),[10,1],{'tansig','purelin'},'traingdm')

%  ��ǰ�����Ȩֵ����ֵ
inputWeights=net_1.IW{1,1}
inputbias=net_1.b{1}
%  ��ǰ�����Ȩֵ����ֵ
layerWeights=net_1.LW{2,1}
layerbias=net_1.b{2}

%  ����ѵ������
net_1.trainParam.show = 50;
net_1.trainParam.lr = 0.05;
net_1.trainParam.mc = 0.9;
net_1.trainParam.epochs = 50000;
net_1.trainParam.goal = 1e-4;

%  ���� TRAINGDM �㷨ѵ�� BP ����
[net_1,tr]=train(net_1,P,T);

%  �� BP ������з���
A = sim(net_1,P);
%  ���������� 
E = T - A;
MSE=mse(E)

%���в���
TestResults=sim(net_1,test)

%����������
Error=testT-TestResults
MSETest=mse(Error)

plot([TestResults' testT'])
