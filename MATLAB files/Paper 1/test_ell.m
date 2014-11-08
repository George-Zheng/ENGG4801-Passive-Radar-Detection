%test_ell

d1 = 50;
d2 = 55;
a1 = 20;
a2 = 20;
b1 = 5;
b2 = -5;

[v11 v12] = ellipse2(d1,a1,b1);
[v21 v22] = ellipse2(d2,a2,b2);

figure; hold on
plot(v11(1,:),v12(1,:),v11(2,:),v12(2,:),'b' )
plot(v21(1,:),v22(1,:),'r')
plot(v21(2,:),v22(2,:),'r' )

plot(0,0,'gs','LineWidth',5);
plot(a1,b1,'bs','LineWidth',5);
plot(a2,b2,'rs','LineWidth',5);
