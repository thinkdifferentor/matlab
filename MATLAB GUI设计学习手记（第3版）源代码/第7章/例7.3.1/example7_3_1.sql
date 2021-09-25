create database matlab;--若matlab数据库不存在，执行该行代码
--切换数据库
use matlab
go
--建表T_student
create table T_student(
	id int identity primary key,
	name varchar(20) not null,
	age int not null,
	addtime datetime default Sysdatetime()
	)
--生成测试数据
insert into T_student (name, age) values ('张某', 20);
insert into T_student (name, age) values ('张某某', 23);
insert into T_student (name, age) values ('李某', 21);
insert into T_student (name, age) values ('李某某', 20);
insert into T_student (name, age) values ('王某', 24);
insert into T_student (name, age) values ('赵某', 24);
insert into T_student (name, age) values ('文某', 29);
insert into T_student (name, age) values ('马某某', 36);
insert into T_student (name, age) values ('章某某', 21);
