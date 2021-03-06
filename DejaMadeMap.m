function Map = DejaMadeMap(map,start,goal)
sizemap=size(map);
%Visualize
Vertical = sizemap(1);
Horizontal =sizemap(2);
%Generate Map as BW Image Every Grid is a 10x10 pixel square bordered by a
%1 pixel black line
%Generating one block
i = [0 ones(1,10) 0];
Block = [ zeros(1,12); i;i;i;i;i;i;i;i;i;i;zeros(1,12)];
Map=[];X=[6];Y=[];
for i = 1:Vertical
    Map = [Map;Block];
    Y=[Y; 12*(i-1)+6];
end
Strip=Map;
for i = 2:Horizontal
    Map = [Map Strip];
    X=[X; 12*(i-1)+6];
end
[x,y]=find(map);
for k=1:length(x)
    [ii i] = min(abs(X-y(k)*12));
    [jj j] = min(abs(Y-x(k)*12));
    Map(Y(j)-5:Y(j)+6,X(i)-5:X(i)+6)=0;
end
[ii i] = min(abs(X-start(2)*12));
[jj j] = min(abs(Y-start(1)*12));
Map(Y(j)-1:Y(j)+2,X(i)-1:X(i)+2)=0;
[ii i] = min(abs(X-goal(2)*12));
[jj j] = min(abs(Y-goal(1)*12));
Map(Y(j)-2:Y(j)+3,X(i)-2:X(i)+3)=0;
end
