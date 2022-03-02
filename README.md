    sql
    https://www.runoob.com/mysql/mysql-tutorial.html
    以下语句都是在牛客网上面逐个进行的练习
    https://www.nowcoder.com/exam/oj?tab=SQL%E7%AF%87&topicId=199

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

    #查询条件 where 
    比较运算符：= < <= > >= !=,或者NOT加比较运算符
    确定集合： in  not in
    范围：between and, not between and
    select * from staff where age between 26 and 38;
    select * from staff where age >= 26 and age <= 38;
    select * from staff where age not between 26 and 38;
    空值：is null, is not null
    select * from chenli where id is not  null;
    逻辑：or ， and
    select device_id,gender,age,university,gpa from user_profile
    where (university='山东大学' and gpa>3.5 )
    or (university="复旦大学" and gpa>3.8);

    #匹配 like, not like
    _ 匹配任意一个字符
    % 匹配0个或者任意多个字符
    []匹配任意一个字符  [acdg]  [a-g]
    [^] 不匹配[]里的字符
    SELECT device_id,age,university FROM user_profile WHERE university LIKE '%北京%'  查询大学名字带有北京的学生信息
    
    #最大值max
    select max(gpa ) from user_profile WHERE university='复旦大学'
    
    正在看计算函数
    
    
    