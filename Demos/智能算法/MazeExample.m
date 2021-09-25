function maze

%�Թ�������������
row=20;

col=39;

%���������  rand������������(0, 1)֮����ȷֲ����������ɵ����顣
rand('state',sum(100*clock));

[cc,rr]=meshgrid(1:col,1:row);

%���µ�������Ĵ�С
%B = reshape(A,m,n)����һ��m*n�ľ���B�� B��Ԫ���ǰ��д�A�еõ��ġ����A��Ԫ�ظ���û��m*n���� �����������
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


%��������·������
[state, ptr_left, ptr_up, ptr_right, ptr_down]=make_pattern(row,col,rr, cc, state, ptr_left, ptr_up, ptr_right, ptr_down);

h=figure('KeyPressFcn',@move_spot,'color','white');

%��ʾ�Թ�
show_maze(row, col, rr, cc, ptr_left, ptr_up, ptr_right, ptr_down,h);

% ��ʼ

cursor_pos=[1,1];

current_id=1;

figure(h)

text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');

set(gcf,'Units','normalized');

set(gcf,'position',[0 0 1 .91]);

tic

% ��¼����

while ~all(cursor_pos == [col,row])

    waitfor(gcf,'CurrentCharacter')

    set(gcf,'CurrentCharacter','~') % update to another character so repeats are recognized

 
    
    %���ð�����-����������ϵͳ�ж�Ӧ�ı���
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

function move_spot(src,evnt)%��ȡ����

% assigninΪ�����ռ�ı���ָ��ֵ�����﷨Ϊ��
% assignin(WS,'name',V) �����У�WSΪ�����ռ����ƣ�'name'Ϊ��������V��Ϊ�ñ���ָ�ɵ�ֵ��
% 
% evalinʵ���ڹ����ռ���ĳ�����ʽ�ַ���������������أ����﷨Ϊ��
% evalin(WS,'expression')�����У�WSΪ�����ռ����ƣ�'expression'Ϊ���ʽ���Ŵ���

% function test
% clear;     %��յ�ǰ�����ռ�
% a=3;       % �ڻ��������ռ䴴��һ������
% assignin('base','a',5); % Ϊ�ñ���ָ���µ�ֵ
% b = evalin('base','3*a+2'); %�ڻ��������ռ��м���ʽ��3*a+2��ֵ�����������b   
% end 
% a      % �鿴���ڸñ�����ֵ    
% a =
%      5 
% b 
% b =
%     17

assignin('caller','key',evnt.Key)

return

function show_maze(row, col, rr, cc, ptr_left, ptr_up, ptr_right, ptr_down,h)%�����Թ�����

%��ʾ�Թ�

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

function [state, ptr_left, ptr_up, ptr_right, ptr_down]=make_pattern(row,col, rr, cc, state, ptr_left, ptr_up, ptr_right, ptr_down)%�����߽��·��Ϣ

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