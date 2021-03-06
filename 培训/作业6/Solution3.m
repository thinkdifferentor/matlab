% 弧度与角度的换算，就是用pi还是用180的问题

% 用pi（3.141594...）得到是弧度

% 用180得到的是角度

% 弧度 = 角度*pi/180

% 角度 = 弧度*180/pi


% 浮标的受力计算
% 临界风速v=24;
% 临界上长度  lup=1.2737;
t21=solve('720*1.2737*(1-t)-12112.6873*t=0','t');  
aerfa21=asin(t21)*(180/pi);%第一根钢管的倾斜角度

% 钢管的受力计算
% 第一根钢管：
t22=solve('(53282.6-31541.3*1.2737)*0.070382310366890886090818939882605-(720*1.2737+12034.4006)*t=0','t');  
aerfa22=asin(t22)*(180/pi);%第二根钢管的倾斜角度

% 第二根钢管：
t23=solve('(53164.8867-31541.3*1.2737)*0.070382310366890886090818939882605-(720*1.2737+11956.1139)*t=0','t');  
aerfa23=asin(t23)*(180/pi);%第三根钢管的倾斜角度


% 第三根钢管：
t24=solve('(53086.6-31541.3*1.2737)*0.071235397437002479080467820333152-(720*1.2737+11877.8272)*t=0','t');  
aerfa24=asin(t24)*(180/pi);%第四根钢管的倾斜角度



% 钢桶的受力计算
t3=solve('(52890.5999-31541.3*1.2737)*0.071889883380060193557811684250853-(720*1.2737+11529.2199)*t=0','t');  
aerfa3=asin(t3)*(180/pi);%钢桶的倾斜角度


% 锚的受力计算
% 当v=24时，锚链下部的倾斜角度为0


data=[aerfa21 aerfa22 aerfa23 aerfa24 aerfa3];


