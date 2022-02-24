    sql
    https://www.runoob.com/mysql/mysql-tutorial.html

    drop、truncate、delete区别：
    drop table  删除整个表
    truncate table 清空表数据，保留表结构
    delete from table  删除表数据，保留表结构(innodb是标记删除)
    delete from table where ...  删除某个匹配条件的表数据

    drop database if exists db_name ; 如果数据库存在则删除
    create database if not exists ofs_cluster default character set utf8; 
