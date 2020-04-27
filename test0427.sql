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


create table ss(
    id int,
    math int,
    chinese int,
    english int
);

insert into ss values(1,23,65,77),(2,55,77,33),(3,5,45,76),(4,56,67,89);


 select count(id) from ss where id in(2,3);





create table emp(id int, name varchar(20), role varchar(20), salary int);

insert into emp values (1, '汤老湿', '老师', 5);
insert into emp values (2, '汤老湿1', '老师', 6);
insert into emp values (3, '汤老湿2', '班主任', 7);
insert into emp values (4, '汤老湿3', '班主任', 8);
insert into emp values (5, '汤老湿4', '市场', 9);
insert into emp values (6, '汤老湿5', '市场', 10);


 select role,max(salary),min(salary),avg(salary) from emp group by role;



drop table if exists classes;
drop table if exists student;
drop table if exists course;
drop table if exists score;

create table classes (id int primary key auto_increment, name varchar(20), `desc` varchar(100));

create table student (id int primary key auto_increment, sn varchar(20),  name varchar(20), qq_mail varchar(20) , classes_id int);

create table course(id int primary key auto_increment, name varchar(20));

create table score(score decimal(3, 1), student_id int, course_id int);

insert into classes(name, `desc`) values 
('计算机系2019级1班', '学习了计算机原理、C和Java语言、数据结构和算法'),
('中文系2019级3班','学习了中国传统文学'),
('自动化2019级5班','学习了机械自动化');

insert into student(sn, name, qq_mail, classes_id) values
('09982','黑旋风李逵','xuanfeng@qq.com',1),
('00835','菩提老祖',null,1),
('00391','白素贞',null,1),
('00031','许仙','xuxian@qq.com',1),
('00054','不想毕业',null,1),
('51234','好好说话','say@qq.com',2),
('83223','tellme',null,2),
('09527','老外学中文','foreigner@qq.com',2);

insert into course(name) values
('Java'),('中国传统文化'),('计算机原理'),('语文'),('高阶数学'),('英文');

insert into score(score, student_id, course_id) values
-- 黑旋风李逵
(70.5, 1, 1),(98.5, 1, 3),(33, 1, 5),(98, 1, 6),
-- 菩提老祖
(60, 2, 1),(59.5, 2, 5),
-- 白素贞
(33, 3, 1),(68, 3, 3),(99, 3, 5),
-- 许仙
(67, 4, 1),(23, 4, 3),(56, 4, 5),(72, 4, 6),
-- 不想毕业
(81, 5, 1),(37, 5, 5),
-- 好好说话
(56, 6, 2),(43, 6, 4),(79, 6, 6),
-- tellme
(80, 7, 2),(92, 7, 6);


 "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" "--defaults-file=C:\ProgramData\MySQL\MySQL Server 5.7\my.ini" "-uroot" "-p"