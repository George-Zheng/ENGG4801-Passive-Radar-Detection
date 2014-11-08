%test_time_2.m
%Test the time difference between setting and clearing arrays

%Use data from the test     
x = -200:200;
y = -200:200;
nstore = 1000;
m = 5;
     
tic;
for i=x
    for j=y
        PHI = zeros(nstore,m);
    end
end
t1 = toc;

tic;
for i=x
    for j=y
        PHI = zeros(nstore,m,'double');
    end
end
t2 = toc;

tic;
for i=x
    for j=y
        clear PHI;
        PHI = zeros(nstore,m);
    end
end
t3 = toc;

tic;
for i=x
    for j=y
        clear PHI;
        PHI = zeros(nstore,m,'double');
    end
end
t4 = toc;

tic;
for i=x
    for j=y
        clear PHI;
        PHI(nstore,m) = 0;
    end
end
t5 = toc;

disp(['''zeros(a,b)'' took ' num2str(t1) ' seconds']);
disp(['''zeros(a,b,''double'')'' took ' num2str(t2) ' seconds']);
disp(['''clear; zeros(a,b)'' took ' num2str(t3) ' seconds']);
disp(['''clear; zeros(a,b,''double'')'' took ' num2str(t4) ' seconds']);
disp(['''clear; PHI(nstore,m) = 0'' took ' num2str(t5) ' seconds']);