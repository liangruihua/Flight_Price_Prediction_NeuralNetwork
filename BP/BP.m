clear;
clc;
load('BPPrice.mat');


net=newff(P,T,[10,15,30,40,40,20,10],{},'traingd');

net.trainParam.max_fail=200
net.trainParam.epochs=10000;
net=train(net,P,T);
outputs=net(test);
figure;
hold on;
plot(1:1:100,outputs);
plot(1:1:100,testT,'r');

error=testT-outputs;
error=mse(error)