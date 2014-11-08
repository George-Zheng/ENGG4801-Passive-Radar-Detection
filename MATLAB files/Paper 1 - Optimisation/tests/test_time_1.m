%test_time_1.m
%Test the time difference between norm and hypot

%Use data from the test
posRx = [0, 0, 0, -50, 50;
         0,50,-50, 0,  0];
m = size(posRx,2);     
x = -200:200;
y = -200:200;
     
tic;
for i=x
    for j=y
        for rec = 1:m
            distRx = norm(posRx(:,rec)-[i;j]);
        end
    end
end
t1 = toc;

tic;
for i=x
    for j=y
        for rec = 1:m
            distRx = hypot(posRx(1,rec)-i,posRx(2,rec)-j);
        end
    end
end
t2 = toc;

disp(['norm took ' num2str(t1) ' seconds']);
disp(['hypot took ' num2str(t2) ' seconds']);
