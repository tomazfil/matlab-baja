close all, clear all, clc, format compact
load('BA Pista 2.mat')
Xs = 0;
Xi = 0;
Ai =0;
Ts = 0;
inputs = [L006_Engine]'; % input vector (6-dimensional pattern)
target = [ones(1,3502)]; % corresponding target output vector

% create network
net = narxnet(1:5,1:5,20);
[Xs,Xi,Ai,Ts] = preparets(net,input,target);
%train
net = train(net,Xs,Ts,Xi,Ai);
% View network structure
view(net);

% Y = net(Xs,Xi,Ai);
% perf = perform(net,Ts,Y);