clear;
[data,Fs] = audioread('Сƻ��.mp3');%��ȡ��������
%������������������������ѭ�����š�������������������������������
%%%%%%%%%%%%����1:����audioplayer����������ʵ��ѭ������%%%%%%%%%
mode = true;%mode==true,ѭ������ģʽ;mode==false,��������ģʽ
player = audioplayer(data, Fs);
player.StopFcn = 'if mode, play(player);end';
play(player);
%%%%��ͣ����ʱ������ڼ���˶δ���%%%%%%%
mode = false;
pause(player);
%%%%����ѭ��ʱ������ڼ���˶δ���%%%%%%%
resume(player);
mode = true;%��ʱ����Ҫѭ������,��Ҫ���ñ�־����Ϊ��
%%%%ֹͣѭ��ʱ������ڼ���˶δ���%%%%%%%
mode = false;
stop(player);

