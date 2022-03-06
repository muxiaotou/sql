-- https://www.cnblogs.com/guokaifeng/p/11192266.html
-- 连表查询 ：
-- 内连接、左外连接、右外连接 ：  inner join on, left join on , right join on
--  inner join on ： 取两表的公共数据
--  left join on ： 联结结果保留左表的全部数据
--  right join on ： 联结结果保留右表的全部数据
-- 联合 ：union, union all ,连接两个以上的SELECT语句，union会去重数据，union all不会去重
-- 排序 ：order by，默认升序，ASC 升序，DESC 降序
-- 条件判断 ： where = ，where in，where = or = (= 用于判断条件为一个值，in 用于判断条件为多个值，多个值时也可以不用in，用= or =，但是写法太长了)

-- 子查询 ：将一个查询语句嵌套在另一个查询语句中，内存查询语句的结果可以为外层查询语句提供查询条件
-- 子查询可以包含 ： IN、NOT IN、ANY、ALL、EXISTS、NOT EXISTS等关键字，还可包含比较运算符 =、！=、>、<等
-- 多表查询，多用连表查，效率比子查询效率高(子查询会创建临时表，查询完后要删除临时表，简单理解效率低)

-- group by ： 按照某个字段，对结果进行分组，可以使用sum、avg、count等对组数据进行计算(where 之后，order by之前)
--     group by后面可以跟having，进行条件限定，可以通过and 或 or进行多条件限定
--     select max(id) from Person group by email;，group by后，如果有id，会显示最小id，可以使用max或者min来自定义

-- exists : 子查询时，where后跟exists来表示内层子查询是否有结果返回，有结果true时，外层select才查询，无结果false时外层select不查询

MariaDB [chenli]> select * from department;
+------+-----------------+
| id   | name            |
+------+-----------------+
|  200 | 挖矿小分队      |
|  201 | 人力资源        |
|  202 | 销售            |
|  203 | 运营            |
+------+-----------------+
4 rows in set (0.00 sec)

MariaDB [chenli]> select * from staff;
+----+-----------+--------+------+--------+
| id | name      | sex    | age  | dep_id |
+----+-----------+--------+------+--------+
|  1 | 程咬金    | male   |   38 |    200 |
|  2 | 露娜      | female |   26 |    201 |
|  3 | 李白      | male   |   38 |    201 |
|  4 | 王昭君    | female |   28 |    202 |
|  5 | 典韦      | male   |  118 |    200 |
|  6 | 小乔      | female |   16 |    204 |
+----+-----------+--------+------+--------+
6 rows in set (0.00 sec)

-- 内连接：找到两张表共有的部分
MariaDB [chenli]> select * from staff inner join department on staff.dep_id = department.id;
+----+-----------+--------+------+--------+------+-----------------+
| id | name      | sex    | age  | dep_id | id   | name            |
+----+-----------+--------+------+--------+------+-----------------+
|  1 | 程咬金    | male   |   38 |    200 |  200 | 挖矿小分队      |
|  2 | 露娜      | female |   26 |    201 |  201 | 人力资源        |
|  3 | 李白      | male   |   38 |    201 |  201 | 人力资源        |
|  4 | 王昭君    | female |   28 |    202 |  202 | 销售            |
|  5 | 典韦      | male   |  118 |    200 |  200 | 挖矿小分队      |
+----+-----------+--------+------+--------+------+-----------------+
5 rows in set (0.00 sec)

-- 左外连接：优先显示左表的全部记录
MariaDB [chenli]> select * from staff left join department on staff.dep_id = department.id ;
+----+-----------+--------+------+--------+------+-----------------+
| id | name      | sex    | age  | dep_id | id   | name            |
+----+-----------+--------+------+--------+------+-----------------+
|  1 | 程咬金    | male   |   38 |    200 |  200 | 挖矿小分队      |
|  5 | 典韦      | male   |  118 |    200 |  200 | 挖矿小分队      |
|  2 | 露娜      | female |   26 |    201 |  201 | 人力资源        |
|  3 | 李白      | male   |   38 |    201 |  201 | 人力资源        |
|  4 | 王昭君    | female |   28 |    202 |  202 | 销售            |
|  6 | 小乔      | female |   16 |    204 | NULL | NULL            |
+----+-----------+--------+------+--------+------+-----------------+
6 rows in set (0.00 sec)

-- 右外连接：优先显示右标的全部记录
MariaDB [chenli]> select * from staff right join department on staff.dep_id = department.id ;
+------+-----------+--------+------+--------+------+-----------------+
| id   | name      | sex    | age  | dep_id | id   | name            |
+------+-----------+--------+------+--------+------+-----------------+
|    1 | 程咬金    | male   |   38 |    200 |  200 | 挖矿小分队      |
|    2 | 露娜      | female |   26 |    201 |  201 | 人力资源        |
|    3 | 李白      | male   |   38 |    201 |  201 | 人力资源        |
|    4 | 王昭君    | female |   28 |    202 |  202 | 销售            |
|    5 | 典韦      | male   |  118 |    200 |  200 | 挖矿小分队      |
| NULL | NULL      | NULL   | NULL |   NULL |  203 | 运营            |
+------+-----------+--------+------+--------+------+-----------------+
6 rows in set (0.00 sec)

-- 全外连接：显示左右两个表全部记录，mysql没有full join，可以左外连接+右外连接来实现
-- 其他union会去掉左、右外连接之后的重复项，union all则不会进行去重
MariaDB [chenli]> select * from staff left join department on staff.dep_id = department.id union select * from staff right join department on staff.dep_id = department.id;
+------+-----------+--------+------+--------+------+-----------------+
| id   | name      | sex    | age  | dep_id | id   | name            |
+------+-----------+--------+------+--------+------+-----------------+
|    1 | 程咬金    | male   |   38 |    200 |  200 | 挖矿小分队      |
|    5 | 典韦      | male   |  118 |    200 |  200 | 挖矿小分队      |
|    2 | 露娜      | female |   26 |    201 |  201 | 人力资源        |
|    3 | 李白      | male   |   38 |    201 |  201 | 人力资源        |
|    4 | 王昭君    | female |   28 |    202 |  202 | 销售            |
|    6 | 小乔      | female |   16 |    204 | NULL | NULL            |
| NULL | NULL      | NULL   | NULL |   NULL |  203 | 运营            |
+------+-----------+--------+------+--------+------+-----------------+
7 rows in set (0.00 sec)

MariaDB [chenli]> select * from staff left join department on staff.dep_id = department.id union all select * from staff right join department on staff.dep_id = department.id;
+------+-----------+--------+------+--------+------+-----------------+
| id   | name      | sex    | age  | dep_id | id   | name            |
+------+-----------+--------+------+--------+------+-----------------+
|    1 | 程咬金    | male   |   38 |    200 |  200 | 挖矿小分队      |
|    5 | 典韦      | male   |  118 |    200 |  200 | 挖矿小分队      |
|    2 | 露娜      | female |   26 |    201 |  201 | 人力资源        |
|    3 | 李白      | male   |   38 |    201 |  201 | 人力资源        |
|    4 | 王昭君    | female |   28 |    202 |  202 | 销售            |
|    6 | 小乔      | female |   16 |    204 | NULL | NULL            |
|    1 | 程咬金    | male   |   38 |    200 |  200 | 挖矿小分队      |
|    2 | 露娜      | female |   26 |    201 |  201 | 人力资源        |
|    3 | 李白      | male   |   38 |    201 |  201 | 人力资源        |
|    4 | 王昭君    | female |   28 |    202 |  202 | 销售            |
|    5 | 典韦      | male   |  118 |    200 |  200 | 挖矿小分队      |
| NULL | NULL      | NULL   | NULL |   NULL |  203 | 运营            |
+------+-----------+--------+------+--------+------+-----------------+
12 rows in set (0.00 sec)

-- 子查询
MariaDB [chenli]> select * from staff where dep_id = (select id from department as dep  where dep.id = 202);
+----+-----------+--------+------+--------+
| id | name      | sex    | age  | dep_id |
+----+-----------+--------+------+--------+
|  4 | 王昭君    | female |   28 |    202 |
+----+-----------+--------+------+--------+
1 row in set (0.00 sec)

-- exists ， 当 子查询有结果返回时，外层select才执行查询
MariaDB [chenli]> select * from staff where exists (select * from department where id = 203);
+----+-----------+--------+------+--------+
| id | name      | sex    | age  | dep_id |
+----+-----------+--------+------+--------+
|  1 | 程咬金    | male   |   38 |    200 |
|  2 | 露娜      | female |   26 |    201 |
|  3 | 李白      | male   |   38 |    201 |
|  4 | 王昭君    | female |   28 |    202 |
|  5 | 典韦      | male   |  118 |    200 |
|  6 | 小乔      | female |   16 |    204 |
+----+-----------+--------+------+--------+
6 rows in set (0.00 sec)


-- 借住笛卡尔积，打印两个表当中关联的记录(两个标通过prod_id关联)
select prod_name, sum(quantity) as t from Products, OrderItems where Products.prod_id = OrderItems.prod_id group by prod_name order by t;
select prod_name, sum(quantity) as t from Products join OrderItems on Products.prod_id = OrderItems.prod_id group by prod_name order by t;

-- 连接是有列名相同，可以使用using替代on
select Vendors.vend_id, count(Products.prod_id) from Vendors left join Products on Vendors.vend_id = Products.vend_id group by Vendors.vend_id;
select Vendors.vend_id, count(Products.prod_id) from Vendors left join Products using(vend_id) group by Vendors.vend_id;