--创建database时指定默认字符编码
create database chenli default charset utf8 collate utf8_general_ci;

--练一练：https://mp.weixin.qq.com/s/5EsOhmyPRUpAUk9Sh4NMkg
create database DB_NAME//创建数据库
use DB_NAME //切换数据库

create table student (  //创建学生表
    no varchar(20) primary key,
    name varchar(20) not null,
    sex varchar(10) not null,
    birthday DATA
)

show tables; //查看所有表

insert into student values (.....),(.....) //添加学生表数据
insert into student (no, sex) values (.....),(.....)

select * from student; //基础查询
select name, sex from student;

select distinct sex from student; //去重查询
