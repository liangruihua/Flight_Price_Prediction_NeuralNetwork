
%p:������뺯������ÿ��Ϊһ������
%t:���Ŀ�꺯������
%P_test�������ݾ���
%t1����Ŀ�����

[pn,minp,maxp,tn,mint,maxt]=premnmx(p,t);%���ݹ�һ��
p2= tramnmx(P_test,minp,maxp);
net=newelm(minmax(pn),[13,1],{'tansig','tansig'});%����2������ģ�ͣ����в������Ը���Ҫ���޸ģ�[������ڵ����������ڵ�����Ԥ��ֵ����]
net.trainparam.show=100;%ÿ����100����ʾ1��
net.trainparam.epochs=2000;%����������2000
net.trainparam.goal=0.0001;%����Ŀ��
net=init(net);%��ʼ������
[net,tr]=train(net,pn,tn); %ѵ������
PN=sim(net,p2);%����
t2= postmnmx(PN,mint,maxt);%����ֵ����һ��
E = t1 - t2; 
MSE=mse(E);%��������ָ��MSE
MAE=mean(abs(E))
figure(1);%���´�����ͼ
X=1:100;%�������ݹ���3������������Ӧ�ø��ݲ����������޸�
plot(X,t2,'r*',X,t1,'bo');
title('oΪ��ʵֵ��*ΪԤ��ֵ');%��ͼ