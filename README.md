    sql
    https://www.runoob.com/mysql/mysql-tutorial.html

    #drop、truncate、delete区别：
    drop table  删除整个表
    truncate table 清空表数据，保留表结构
    delete from table  删除表数据，保留表结构(innodb是标记删除)
    delete from table where ...  删除某个匹配条件的表数据

    #if exists 和if not exists 
    drop database if exists db_name ; 如果数据库存在则删除
    create database if not exists ofs_cluster default character set utf8; 
    
    #去重
    select distinct email from Person;  //distinct去重
    select email from Person group by email;  //通过group by分组来达到去重的目的

    #插入
    insert into Person (email) values ("mutou@jd.com"),("max@jd.com");  //插入多列，且个别字段

    #limit 限制返回数量(limit i,n  i表示起始偏移行，n表示返回行数，当i=0时可省略) select  * from Person limit 3,5 //打印第4至8行
    select  * from Person limit 2,2;  //打印第3、4行，行号从0开始计算
    select  * from Person limit 2,-1; //打印第3行至末尾行

    #列重命名
    select email as Mail from Person;

    #列排序  order by column
    select * from staff order by age desc; desc降序，asc 升序(默认)
    #多列排序，从左开始排序，当遇到重复项，则按照右侧列排序
    select * from staff order by age,dep_id desc;  每列后面都可以跟asc(缺省)或者desc

    SQL6  https://www.nowcoder.com/exam/oj?tab=SQL%E7%AF%87&topicId=199