create database matlab;--��matlab���ݿⲻ���ڣ�ִ�и��д���
--�л����ݿ�
use matlab
go
--����T_student
create table T_student(
	id int identity primary key,
	name varchar(20) not null,
	age int not null,
	addtime datetime default Sysdatetime()
	)
--���ɲ�������
insert into T_student (name, age) values ('��ĳ', 20);
insert into T_student (name, age) values ('��ĳĳ', 23);
insert into T_student (name, age) values ('��ĳ', 21);
insert into T_student (name, age) values ('��ĳĳ', 20);
insert into T_student (name, age) values ('��ĳ', 24);
insert into T_student (name, age) values ('��ĳ', 24);
insert into T_student (name, age) values ('��ĳ', 29);
insert into T_student (name, age) values ('��ĳĳ', 36);
insert into T_student (name, age) values ('��ĳĳ', 21);
