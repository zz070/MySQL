-- 创建一张student_test表，设置属性id为not null
create table student_test(
    id int not null,
    name varchar(20),
    sex varchar(5),
    score decimal(3,1)
)character set utf8mb4;

-- 插入数据，id不能为空，否则就会报错；
 insert into student_test values(1,'潇潇','女',88.5);
 insert into student_test values(null,'莉莉','女',97.5);
 insert into student_test(name,score) values('洛洛',87);

-- 创建一张student_test表，设置属性id为unique
create table student_test(
    id int unique,
    name varchar(20),
    sex varchar(5),
    score decimal(3,1)
)character set utf8mb4;

-- 插入数据，id不能重复，否则就会报错；
 insert into student_test values
 (1,'潇潇','女',88.5),
 (2,'楠楠','女',90);
 insert into student_test values(2,'莉莉','女',97.5);

-- 创建一张student_test表，设置属性name为default
create table student_test(
    id int,
    name varchar(20) default 'unkown',
    sex varchar(5),
    score decimal(3,1)
)character set utf8mb4;

-- 插入数据，name为空，默认值为unkown；
insert into student_test (id,sex,score)values(1,'女',97.5);
-- 查看表
select * from student_test;

-- 创建一张student_test表，设置属性id为primary key
create table student_test(
    id int primary key,
    name varchar(20),
    sex varchar(5),
    score decimal(3,1)
)character set utf8mb4;

-- 插入数据，id不能为空也不能重复，否则就会报错；
 insert into student_test values
 (1,'潇潇','女',88.5),
 (2,'楠楠','女',90);
insert into student_test values(2,'莉莉','女',97.5);
insert into student_test values(null,'木木','女',95);
insert into student_test(name,score) values('洛洛',87);

-- 创建一张student_test表，设置属性sex 只能在男和女之间选择
create table student_test(
    id int primary key,
    name varchar(20),
    check (sex = '男' or sex = '女'),
    score decimal(3,1)
)character set utf8mb4;

-- 创建一张class表，设置属性id为primary key
create table class(
    id int primary key,
    name varchar(20)
)character set utf8mb4;

-- 创建一张student_test表，设置属性class_id为foreign key,关联班级表的id
create table student_test(
    id int primary key,
    name varchar(20),
    class_id int,
    sex varchar(5),
    score decimal(3,1),
    foreign key (class_id) references class(id)
)character set utf8mb4;

-- 插入数值时，student_test 表中的class_id要参考class表中的id
-- 若插入的class_id在class表中不存在，将会插入失败
insert into class values(1,'一班');
insert into student_test values
(1,'潇潇',1,'女',88.5),
(2,'楠楠',1,'女',90);
insert into student_test values(3,'莉莉',2,'女',97.5);

-- 在删除时，若有表B关联A，那么A不能删除
drop table class;
