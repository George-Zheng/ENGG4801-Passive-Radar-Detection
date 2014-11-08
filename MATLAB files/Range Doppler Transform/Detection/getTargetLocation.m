function target = getTargetLocation(rx)
%A function that determines the likely positions of targets from an array
%of static radar receivers
%
%rx is a struct array with feild ellParam describing the parameters of an
%ellipse for each hit in the range doppler domain

%Minimum distance between any 2 intersections of ellipses
%Should be a funcion of the sampling rate
%C/Fs = 3e8/8e6 = 37.5m
minDist = 4*37.5; %Add in a bit of leeway

%an array containing [xpos, ypos, numInt]
target = zeros(0,3);


%Number of receivers
N = size(rx,1);

for i = 1:N-1
    iParam = rx(i).ellParam;
    for ie = 1:size(iParam,1)
        Ell1 = iParam(ie,:);
        for j = i+1:N
            jParam = rx(j).ellParam;
            for je = 1:size(jParam,1)
                Ell2 = jParam(je,:);
                %Compare Ell1 and Ell2
                inter = findEllIntersect(Ell1, Ell2);
                for id = 1:size(inter,1)
                    testPos = inter(id,:);
                    currentPos = target(:,1:2);
                    %Find the differene in distance
                    dist = currentPos - repmat(testPos,size(currentPos,1),1);
                    dist = hypot(dist(:,1),dist(:,2));
                    %Compare to minimum
                    isLT = dist<minDist;
                    if any(isLT)
                        %We have a match, so increment
                        idMatch = find(isLT,1);
                        %Also update match to average
                        n = target(idMatch,3);
                        target(idMatch,1:2) = (n*target(idMatch,1:2) + testPos) / (n+1);
                        target(idMatch,3) = n+1;
                    else
                        %No match so add position
                        target = [target; [testPos,1]];
                    end
                end 
            end
        end
    end
end

target = sortrows(target,3);
target = target(end:-1:1,:);

if norm(target(1,1:2)-target(2,1:2)) < 500
    %Weighted average the first 2
    n1 = target(1,3);
    n2 = target(2,3);
    tl = (n1*target(1,1:2) + n2*target(2,1:2))/(n1+n2);
    disp(['Target at (x,y) = (' num2str(tl(1),4) ',' num2str(tl(2),4) ')']);
else
    %Weighted average the first 2
    n1 = target(1,3);
    n2 = target(3,3);
    tl = (n1*target(1,1:2) + n2*target(3,1:2))/(n1+n2);    
    disp(['Target at (x,y) = (' num2str(tl(1),4) ',' num2str(tl(2),4) ')']);
    
    m1 = target(2,3);
    m2 = target(4,3);
    t2 = (m1*target(2,1:2) + m2*target(4,1:2))/(m1+m2);    
    disp(['Target at (x,y) = (' num2str(t2(1),4) ',' num2str(t2(2),4) ')']);
end