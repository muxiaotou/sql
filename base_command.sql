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

-- 基础查询
select * from student; //查询所有行
select name, sex from student;

select distinct sex from student; //去重查询
select * from student where sex [not] between 60 and 80; //区间查询
select * from student where sex >= 60 and sex <= 80;

select * from student where sex [not] in (30, 40, 80); //集合查询

select * from student where sex = 'woman'  or name = 'beibei'; //或查询

select * from student order by class desc [asc],[name asc]; //按照class列\name列 进行排序，降序、升序

select count(*) from student ; //计算匹配到的总行数

select s_no, c_no from score where degree = (select max(degree) from score); //子查询，查询score最高分数学生的信息

select * from score order by degree desc limit 0, 1; //跳过第0行，取1行数据
select * from score order by degree desc limit 1, offset 0; //offset是跳过第0行，limit表示取1行

-- 分组计算平均值
select avg(degree) from score group by c_no; //按c_no列分组，计算不同组degree的平均值

-- 分组+模糊查询
select c_no, avg(degree) from score group by c_no having count(c_no) >= 2 and c_no linke "3%";
//查询score当中至少有2个学生选修，并且平均成绩3开头的课

-- 多表查询(不止两表，也可以三标查询，from后面跟三个表，where后使用and连接各个判断条件)
select name, c_no, degree  from student, score where student.no = score.s_no;

-- 时间函数
select year(birthdat) from student where no in (101, 108); //查询no是101和108学生的出生年份，月份是month(),天是day()
select date_format(now(), "%Y-%m-%d %h-%i-%s");  //date_format 格式化日期

-- ANY  ALL，任一  所有
select * from score where c_no = '3-105' and degree < any (select degree from score where c_no = '3-245') order by degree desc;
#any 即表示degree小于集合当中任意一个

select * from score where c_no = '3-105' and degree > all (select degree from score c_no = '3-245');
#all 即表示degree大于集合当中的所有

-- 临时表
select * from score a where a.degree < (select avg(degree) from score b where b.c_no = a.c_no);
# 查询某课程的成绩比该课程平均成绩小的score表

update volume set status = 11 where id in (select a.id from (select id from volume where status = 1)as a);
#update select 同一张表

-- 条件加组筛选
select * from student where sex = '男' group by class having count(class) >= 2;




