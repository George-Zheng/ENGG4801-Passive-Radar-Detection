%test_time_3.m
%Test the time difference between creating new PHI or reusing old phi
%WONT WORK ANYWAYS


%Use data from the test     
x = -20:20;
y = -20:20;
m = 5;
C = 299792458;
dt = 1/220e6;

     
tic;
for i = x
    for j = y
        nset = zeros(m,1);
        for rec = 1:m
            distRx = hypot(posRx(1,rec)-i,posRx(2,rec)-j);
            travel_time = distRx/C;
            nset(rec) = round(travel_time / dt);
        end
        n = min(nset);
        nset = nset - n;
        nmax = max(nset);
        nstore = num_samp - nmax;
        PHI = zeros(nstore,m);
        
        for rec = 1:m
            nstart = nset(rec)+1;
            PHI(:,rec) = phi(nstart:nstart+nstore-1,rec);
        end
    end
end
t1 = toc;

tic;
for i = x
    for j = y
        nset = zeros(m,1);
        for rec = 1:m
            distRx = hypot(posRx(1,rec)-i,posRx(2,rec)-j);
            travel_time = distRx/C;
            nset(rec) = round(travel_time / dt);
        end
        n = min(nset);
        nset = nset - n;
        nmax = max(nset);
        nstore = num_samp - nmax;
        for rec = 1:m
            nstart = nset(rec)+1;
            phi(1:nstore,rec) = phi(nstart:nstart+nstore-1,rec);
        end
    end
end
t2 = toc;



disp(['''original'' took ' num2str(t1) ' seconds']);
disp(['''modified'' took ' num2str(t2) ' seconds']);