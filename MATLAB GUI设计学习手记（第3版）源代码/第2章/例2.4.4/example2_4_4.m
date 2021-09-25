clear;
[data,Fs] = audioread('小苹果.mp3');%获取音乐数据
%↓↓↓↓↓↓↓↓↓↓↓↓循环播放↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
%%%%%%%%%%%%方法1:采用audioplayer播放器对象实现循环播放%%%%%%%%%
mode = true;%mode==true,循环播放模式;mode==false,正常播放模式
player = audioplayer(data, Fs);
player.StopFcn = 'if mode, play(player);end';
play(player);
%%%%暂停播放时在命令窗口键入此段代码%%%%%%%
mode = false;
pause(player);
%%%%继续循环时在命令窗口键入此段代码%%%%%%%
resume(player);
mode = true;%此时或需要循环播放,需要重置标志变量为真
%%%%停止循环时在命令窗口键入此段代码%%%%%%%
mode = false;
stop(player);

