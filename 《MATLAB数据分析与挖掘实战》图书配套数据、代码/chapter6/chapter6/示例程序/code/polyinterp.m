function v = polyinterp(x,y,u)
%% �������ղ�ֵ�㷨
% x���±����У�
% y: ʱ������ֵ��
% u��ȱʧֵ�±����У�

n = length(x);
v = zeros(size(u));
for k = 1:n
    w = ones(size(u));  
    for j = [1:k-1 k+1:n]
        w = (u-x(j))./(x(k)-x(j)).*w;
    end
    v = v + w*y(k);
end

end