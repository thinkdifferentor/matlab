%����BP������

%�������
%pnΪ��һ��������ѵ����      �����ռ�

%���ز���
%net  ������BP������

%��������
function[net] = createBP(pn)

fprintf('��ʼ����BP������\n\n');

%���������㵥Ԫ����num_hidden�����ֵ�ı���
num_hidden = input('��������������Ԫ����:');

%�����������������֮��Ĵ��ݺ�����func_hidden������ַ����ı���
func_hidden = input('�������������������֮��Ĵ��ݺ���:','s');

%�����������������֮��Ĵ��ݺ�����func_out������ַ����ı���
func_out = input('�������������������֮��Ĵ��ݺ���:','s');

%����BPѵ��������trainfunc������ַ����ı���
trainfunc = input('������BP����ѵ������:','s');

%����ѵ��Ŀ�꣬goal�����ֵ�ı���
goal = input('������ѵ��Ŀ�꣨<0.01��:');

%����ѵ��������epochs�����ֵ�ı���
epochs = input('������ѵ������:');

%����ѧϰ���ʣ�learn_rate�����ֵ�ı���
learn_rate = input('������ѧϰ����(<0.1):');

fprintf('��ʼ����BP������,��ȴ�.....\n\n');
net = newff(minmax(pn),[num_hidden,40],{func_hidden,func_out},trainfunc);   %����MATLAB�����繤���䣬����BP������
net.trainParam.goal=goal;                                                           %����ѵ��Ŀ��
net.trainParam.epochs=epochs;                                                       %ѵ��������
net.trainParam.lr = learn_rate;                                                     %����ѧϰ����
fprintf('BP������������\n\n');