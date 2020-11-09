function [ point ] = path_plan(begin,over,obstacle)

    iters=1; %��������
    curr=begin;
    dis = 10;
    while ( (dis > 0.2) &&  (iters<=5000))
        point(:, iters)=curr;
 
        %���㵱ǰ�㸽���뾶Ϊ0.2��8��������ܣ�Ȼ���õ�ǰ������ܼ�ȥ8���������ȡ��ֵ���ģ�ȷ�����
        %���򣬾�����һ�������ĵ�

        %������˸��������
        testPoint = zeros(2, 8);
        testPoint(1,1) = curr(1)+1;
        testPoint(2,1) = curr(2)+1;
        
        testPoint(1,2) = curr(1);
        testPoint(2,2) = curr(2)+1;
        
        testPoint(1,3) = curr(1)-1;
        testPoint(2,3) = curr(2)+1;
        
        testPoint(1,4) = curr(1)-1;
        testPoint(2,4) = curr(2);
        
        testPoint(1,5) = curr(1)-1;
        testPoint(2,5) = curr(2)-1;
        
        testPoint(1,6) = curr(1);
        testPoint(2,6) = curr(2)-1;
        
        testPoint(1,7) = curr(1)+1;
        testPoint(2,7) = curr(2)-1;
        
        testPoint(1,8) = curr(1)+1;
        testPoint(2,8) = curr(2);
        
        testOut = zeros(1,8);
        for i=1:8
            if (testPoint(1,i) <= 0) || (testPoint(2,i) <= 0) || (testPoint(1,i) > 15) || (testPoint(2,i) > 15)
                testOut(i) = 500;
            else
                testOut(i)   = computNewPotentialMultiGoal(testPoint(:,i), over, obstacle);
            end
        end
        [temp num]=min(testOut);

        
        curr=testPoint(:,num);
        plot(curr(1),curr(2),'og');

        for i = 1 : size(over, 2)
            tempDis = norm(curr-over(:,i));
            if dis > tempDis
                dis = tempDis;
            end
        end

        pause(0.01);
        iters=iters+1;
    end
end

