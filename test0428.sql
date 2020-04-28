-- 创建一张teacher表
create table teacher(
    id int,
    name varchar(20),
    role varchar(20),
    salary decimal(9,2)
);

-- 插入数据
insert into teacher values(1,'马睿','讲师',2994.7);
insert into teacher values(2,'刘明','教授',8948.8);
insert into teacher values(3,'王玥','副教授',3694.5);
insert into teacher values(4,'赵辉','教授',9394.4);
insert into teacher values(5,'孙露','讲师',3894.8);
insert into teacher values(6,'周良','讲师',4894.6);
insert into teacher values(7,'吴牧','教授',8894.6);
insert into teacher values(8,'钱落','副教授',6794.2);
insert into teacher values(9,'李平','副教授',7764.7);

-- 查询

-- 查询所有老师姓名的数量
select count(name) from teacher;
-- 查询所有职位为教授的工资总和
select sum(salary) from teacher where role = '教授';
-- 查询所有职位为副教授的工资的平均值
select avg(salary) from teacher where role = '副教授';
-- 查询所有老师的最低工资
select min(salary) from teacher;
-- 查询所有老师的最高工资
select max(salary) from teacher;

-- 根据职位，查询职位，及相应的最低工资，最高工资，和平均工资
select role,min(salary),max(salary),avg(salary) from teacher group by role;

-- 使用group by子句进行分组以后，筛选条件时要用having
select role,min(salary),max(salary),avg(salary) from teacher group by role having avg(salary) >6000;

-- 新建两张表,用于示例
create table s1(
    id int,
    name varchar(20)
);
create table s2(
    id int,
    name varchar(20)
);

-- 向表s1中插入数据
insert into s1 values(1,'潇潇'),(2,'落落'),(3,'灼灼');

-- 将从表s1中查询到的数据插入到s2中
insert into s2 select * from s1;
