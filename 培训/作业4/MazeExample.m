function maze

%迷宫的行数与列数
row=20;

col=39;

%设置随机数  rand函数产生由在(0, 1)之间均匀分布的随机数组成的数组。
rand('state',sum(100*clock));

[cc,rr]=meshgrid(1:col,1:row);

%重新调整矩阵的大小
%B = reshape(A,m,n)返回一个m*n的矩阵B， B中元素是按列从A中得到的。如果A中元素个数没有m*n个， 则会引发错误。
state = reshape(1:row*col,row,col);

id = reshape(1:row*col,row,col);


ptr_left = zeros(size(id));

ptr_up = zeros(size(id));

ptr_right = zeros(size(id));

ptr_down = zeros(size(id));


ptr_left(:,2:size(id,2)) = id(:,1:size(id,2)-1);

ptr_up(2:size(id,1),:) = id(1:size(id,1)-1,:);

ptr_right(:,1:size(id,2)-1) = id(:,2:size(id,2));

ptr_down(1:size(id,1)-1,:) = id(2:size(id,1),:);



the_maze = cat(2,reshape(id,row*col,1),reshape(rr,row*col,1),reshape(cc,row*col,1),reshape(state,row*col,1),reshape(ptr_left,row*col,1),reshape(ptr_up,row*col,1),reshape(ptr_right,row*col,1),reshape(ptr_down,row*col,1));

the_maze = sortrows(the_maze);



id=the_maze(:,1);

rr=the_maze(:,2);

cc=the_maze(:,3);

state=the_maze(:,4);


ptr_left=the_maze(:,5);

ptr_up=the_maze(:,6);

ptr_right=the_maze(:,7);

ptr_down=the_maze(:,8);



clear the_maze;


%调用生成路径函数
[state, ptr_left, ptr_up, ptr_right, ptr_down]=make_pattern(row,col,rr, cc, state, ptr_left, ptr_up, ptr_right, ptr_down);

h=figure('KeyPressFcn',@move_spot,'color','white');

%显示迷宫
show_maze(row, col, rr, cc, ptr_left, ptr_up, ptr_right, ptr_down,h);

% 开始

cursor_pos=[1,1];

current_id=1;

figure(h)

text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');

set(gcf,'Units','normalized');

set(gcf,'position',[0 0 1 .91]);

tic

% 记录过程

while ~all(cursor_pos == [col,row])

    waitfor(gcf,'CurrentCharacter')

    set(gcf,'CurrentCharacter','~') % update to another character so repeats are recognized

 
    
    %设置按参数-上下左右在系统中对应的编码
    switch double(key(1))

        case 108 % left

            if ptr_left(current_id)<0 % check for legal move

                current_id=-ptr_left(current_id);

                text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color',[.8,.8,.8]);

                cursor_pos(1)=cursor_pos(1)-1;

                text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');

            end

        case 114 % right

            if ptr_right(current_id)<0 % check for legal move

                current_id=-ptr_right(current_id);

                text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color',[.8,.8,.8]);

                cursor_pos(1)=cursor_pos(1)+1;

                text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');

            end

        case 117 % up

            if ptr_up(current_id)<0 % check for legal move

                current_id=-ptr_up(current_id);

                text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color',[.8,.8,.8]);

                cursor_pos(2)=cursor_pos(2)-1;

                text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');

            end

        case 100 % down

            if ptr_down(current_id)<0 % check for legal move

                current_id=-ptr_down(current_id);

                text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color',[.8,.8,.8]);

                cursor_pos(2)=cursor_pos(2)+1;

                text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');

            end

        otherwise

    end

end

thyme=toc;

title(cat(2,' Winning Time ',num2str(round(thyme*100)/100),'(sec)'),'FontSize',20)

return

function move_spot(src,evnt)%获取方向建

% assignin为工作空间的变量指派值，其语法为：
% assignin(WS,'name',V) ，其中，WS为工作空间名称，'name'为变量名，V是为该变量指派的值。
% 
% evalin实现在工作空间中某个表达式字符串，并将结果返回，其语法为：
% evalin(WS,'expression')，其中，WS为工作空间名称，'expression'为表达式符号串。

% function test
% clear;     %清空当前工作空间
% a=3;       % 在基本工作空间创建一个变量
% assignin('base','a',5); % 为该变量指派新的值
% b = evalin('base','3*a+2'); %在基本工作空间中计算式子3*a+2的值并将结果赋予b   
% end 
% a      % 查看现在该变量的值    
% a =
%      5 
% b 
% b =
%     17

assignin('caller','key',evnt.Key)

return

function show_maze(row, col, rr, cc, ptr_left, ptr_up, ptr_right, ptr_down,h)%绘制迷宫矩阵

%显示迷宫

figure(h)

line([.5,col+.5],[.5,.5]) % draw top border

line([.5,col+.5],[row+.5,row+.5]) % draw bottom border

line([.5,.5],[1.5,row+.5]) % draw left border

line([col+.5,col+.5],[.5,row-.5])  % draw right border

for ii=1:length(ptr_right)

    if ptr_right(ii)>0 % right passage blocked

        line([cc(ii)+.5,cc(ii)+.5],[rr(ii)-.5,rr(ii)+.5]);

        hold on

    end

    if ptr_down(ii)>0 % down passage blocked

        line([cc(ii)-.5,cc(ii)+.5],[rr(ii)+.5,rr(ii)+.5]);

        hold on

    end


end

axis equal

axis([.5,col+.5,.5,row+.5])

axis off

set(gca,'YDir','reverse')

return

function [state, ptr_left, ptr_up, ptr_right, ptr_down]=make_pattern(row,col, rr, cc, state, ptr_left, ptr_up, ptr_right, ptr_down)%产生边界道路信息

while max(state)>1 

    tid=ceil(col*row*rand(15,1)); 

    cityblock=cc(tid)+rr(tid);   

    is_linked=(state(tid)==1); 

    temp = sortrows(cat(2,tid,cityblock,is_linked),[3,2]); 

    tid = temp(1,1);   

       dir=ceil(4*rand);

    switch dir

       

    case 1

        if ptr_left(tid)>0 && state(tid)~=state(ptr_left(tid))

            state( state==state(tid) | state==state(ptr_left(tid)) )=min([state(tid),state(ptr_left(tid))]);

            ptr_right(ptr_left(tid))=-ptr_right(ptr_left(tid));

            ptr_left(tid)=-ptr_left(tid);

        end

    case 2

        if ptr_right(tid)>0 && state(tid)~=state(ptr_right(tid))

            state( state==state(tid) | state==state(ptr_right(tid)) )=min([state(tid),state(ptr_right(tid))]);

            ptr_left(ptr_right(tid))=-ptr_left(ptr_right(tid));

            ptr_right(tid)=-ptr_right(tid);

        end

    case 3

        if ptr_up(tid)>0 && state(tid)~=state(ptr_up(tid))

            state( state==state(tid) | state==state(ptr_up(tid)) )=min([state(tid),state(ptr_up(tid))]);

            ptr_down(ptr_up(tid))=-ptr_down(ptr_up(tid));

            ptr_up(tid)=-ptr_up(tid);

        end

    case 4

        if ptr_down(tid)>0 && state(tid)~=state(ptr_down(tid))

            state( state==state(tid) | state==state(ptr_down(tid)) )=min([state(tid),state(ptr_down(tid))]);

            ptr_up(ptr_down(tid))=-ptr_up(ptr_down(tid));

            ptr_down(tid)=-ptr_down(tid);

        end

    otherwise

        dir;

        error('quit');

    end

   

end

return