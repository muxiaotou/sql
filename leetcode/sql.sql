-- 175组合两个表
-- 结果字段分布在两个表当中，因此需要连表查询
-- 题目讲到提供person表的信息，理解是联结表结果当中包含所有person表中数据，因此使用左联结 left join   on
-- 两个表的联结条件，通过PersonId进行联结

select Person.FisrtName,Person.LastName,Address.City Address.State from Person left join Address
    on Person.PersonId = Adress.PersonId;

-- 181-TODO

-- 182查找重复电子邮件
select Email  from Person group by Email having count(Email) > 1;

-- 183从不订购的客户
select Customers.Name as Customers from Customers where Customers.Id not in (select Id from Orders);

-- 196删除重复的电子邮件(先查找出需要保留的，然后再delete not in结果当中的)
delete from Person where id not in (select min(id) from Person group by email);