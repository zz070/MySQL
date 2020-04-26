-- 在以上创建的商品表中插入一条数据：名称为“学生书包”、价格18.91、库存101、描述为空

create table goods(
    name varchar(20),
    price decimal(13,2),
    inventory int,
    description text
)character set utf8mb4;
insert into goods values('学生书包',18.91,101,null);

-- student学生表中，字段有姓名name，年龄age，要求查询姓张，并且年龄在18到25岁之间的学生

insert into student values
(9,'张玥',19,99,96),
(10,'刘乐',17,65,55),
(11,'张鹭',20,89,88);
select name,age from student where name like '张%' and age between 18 and 25;

-- 查询article文章表中，发表日期create_date在2019年1月1日上午10点30分至2019年11月10日下午4点2分的文章

create table article(
    id int,
    author varchar(10),
    title varchar(20),
    create_data timestamp
)character set utf8mb4;

insert into article values
(1,'Mary',null,20200101123001),
(2,'王瑾','数据库',20191102130230),
(3,'赵茹','美术',20190908110820),
(4,'李健',null,20201203203020),
(5,'孙衫','音乐',20191101220330),
(6,'周睿','语文',20180122102020);

select * from article where create_data between 20190101103000 and 20191110160200;


-- 查询article文章表中，文章标题title为空，或者满足发表日期create_date在2019年1月1日之后

select * from article where title = null or create_data>20190101000000;