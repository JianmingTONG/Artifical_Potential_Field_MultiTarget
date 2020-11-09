function output = computNewPotentialMultiGoal_elu(infoGain, map, curr, target, obstacle, height, width, path)
%COMPUTP 此处显示有关此函数的摘要
%   此处显示详细说明
% k_att=10;
repu=0;
k_rep=3;
attr= 0;
Q_star=4;

%计算当前点距离终点的引力
target_int = zeros(2,1);
dis = zeros(1,4);

for i=1:size(target, 2)
    dis_target = norm(target(:,i)-curr);
    attr = attr - infoGain(i) * 1 / dis_target;
end

%曾经走过的点由于势能积累势能增加。
% for i = 1: size(path, 2)
%     if(curr(1) == path(1,i) && curr(2) == path(2,i))
%         attr = attr + 5;
%     end
% end

%计算障碍点与当前点的斥力
%设定障碍的斥力作用半径为2
for i=1:size(obstacle, 2)
    
   dis_obstacle  = norm(obstacle(:,i)-curr);
%    dis_all = [dis_map(obstacle(1,i)+1, obstacle(2,i)),  dis_map(obstacle(1,i), obstacle(2,i)+1), dis_map(obstacle(1,i), obstacle(2,i)-1), dis_map(obstacle(1,i)-1, obstacle(2,i))];
%    for i = size(dis_all, 2):-1:1
%        if(dis_all(i) == 0)
%           dis_all(i) = []; 
%        end
%    end
%    dis_obstacle = min(dis_all);
% %    fprintf("dis_obstacle = %4.2f\n", dis_obstacle);
   if dis_obstacle <= Q_star
%         repu=repu+1/2*k_rep*(1/norm(curr-obstacle(:,i))-1/Q_star)^2;
        
        repu = repu + 1/2 * k_rep * (1/dis_obstacle - 1/Q_star)^2;
%         repu_temp = 1/dis_obstacle -1/Q_star;
%         repu=repu+1/2*k_rep*(repu_temp*(repu_temp+1));
    else
        repu=repu+0;
    end
end

output = attr + repu;

end
