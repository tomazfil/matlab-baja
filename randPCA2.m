clear();
clc();


% exemplo 1
% D1 = [randn(1,1000); randn(1,1000); randn(1,1000)]/20;
% D2 = [randn(1,1000)+80; randn(1,1000); randn(1,1000)]/20;
% D3 = [randn(1,1000)+160; randn(1,1000); randn(1,1000)]/20;
% D4 = [randn(1,1000)+240; randn(1,1000); randn(1,1000)]/20;


% exemplo 2
% D1 = [randn(1,1000); randn(1,1000); randn(1,1000)]/20;
% D2 = [randn(1,1000)+80; randn(1,1000); randn(1,1000)]/20;
% D3 = [randn(1,1000); randn(1,1000)+80; randn(1,1000)]/20;
% D4 = [randn(1,1000)+80; randn(1,1000)+80; randn(1,1000)]/20;


% % exemplo 3
D1 = [randn(1,1000); randn(1,1000); 300*randn(1,1000)]/20;
D2 = [randn(1,1000)+80; randn(1,1000); 300*randn(1,1000)]/20;
D3 = [randn(1,1000); randn(1,1000)+80; 300*randn(1,1000)]/20;
D4 = [randn(1,1000)+80; randn(1,1000)+80; 300*randn(1,1000)]/20;


D = [D1, D2, D3, D4];
C = cov(D');
[v, d] = eig(C);
A = (D'*v)';

t1 = 0:0.05:6;
t2 = 0:0.05:6;
t3 = 0:0.05:80;
retaXv1 = t1*v(1,1);
retaYv1 = t1*v(2,1);
retaZv1 = t1*v(3,1);

retaXv2 = t2*v(1,2);
retaYv2 = t2*v(2,2);
retaZv2 = t2*v(3,2);

retaXv3 = t3*1*v(1,3);
retaYv3 = t3*1*v(2,3);
retaZv3 = t3*1*v(3,3);

subplot(1,3,1);
plot3(D(1,:), D(2,:), D(3,:), 'kx');
hold on
plot3(retaXv1,retaYv1,retaZv1,'r');
plot3(retaXv2,retaYv2,retaZv2,'b');
plot3(retaXv3,retaYv3,retaZv3,'g');
hold off
%  axis equal
 view(36,25)

subplot(1,3,2);
plot(A(2,:), A(3,:), 'kx');
axis equal

subplot(1,3,3);
plot(A(3,:),ones(size(A(3,:))), 'kx');
axis equal

