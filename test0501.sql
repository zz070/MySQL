-- 创建一张班级表，其中包括班级id和班级名
create table classes (
    id int primary key auto_increment,
    name varchar(20)
    );
-- 创建一张学生表，其中包括学生id，学号，姓名，班级id
create table student (
    id int primary key auto_increment,
    sn varchar(20),  
    name varchar(20),
    classes_id int
    );
-- 创建一张课程表，其中包括课程id和课程名
create table course(
    id int primary key auto_increment,
    name varchar(20)
    );
-- 创建一张分数表，其中包括分数，学生id，课程id
create table score(
    score decimal(3, 1), 
    student_id int, 
    course_id int
    );
-- 插入班级数据
insert into classes(name) values 
('一班'),('二班'),('三班');

-- 插入学生信息数据
insert into student(sn, name,classes_id) values
('00011','秦诺',1),
('53944','吴婼',3),
('00192','赵世杰',1),
('00154','马波',2),
('00021','冯琛',1),
('00009','陆廷',2),
('00029','游玖',2),
('0046','郑雪',3);

-- 插入课程数据
insert into course(name) values
('Java'),('数学'),('化学'),('语文'),('英语'),('物理');

-- 插入分数数据
insert into score(score, student_id, course_id) values
-- 秦诺
(70.5, 1, 1),(98.5, 1, 3),(33, 1, 5),(98, 1, 6),
-- 吴婼
(60, 2, 1),(59.5, 2, 5),
-- 赵世杰
(33, 3, 1),(68, 3, 3),(99, 3, 5),
-- 马波
(67, 4, 1),(23, 4, 3),(56, 4, 5),(72, 4, 6),
-- 冯琛
(81, 5, 1),(37, 5, 5),
-- 陆廷
(56, 6, 2),(43, 6, 4),(79, 6, 6),
-- 游玖
(80, 7, 2),(92, 7, 6),
--郑雪


-- 查询

-- 查询所有java成绩比英语成绩高的信息
select s1.* from score s1,score s2
where s1.student_id = s2.student_id
and s1.score > s2.score
and s1.course_id = 1
and s2.course_id = 5;

select s1.* from score s1 join score s2
on s1.student_id = s2.student_id
and s1.score > s2.score
and s1.course_id = 1
and s2.course_id = 5;

-- 查询秦诺和吴婼的成绩
select score.course_id,score.score
from student,score
where student.name = '秦诺' and student.id = score.student_id;

select score.course_id,score.score
from student join score
on student.name = '秦诺'and student.id = score.student_id;

-- 查询id>3 和名称为物理的课程
-- 使用union会去除重复数据
select * from course where id>3
union 
select * from course where name ='英语';
-- 使用or有相同的效果
select * from course where id>3 or name ='英语';
-- 使用union all不会去除重复数据
select * from course where id>3
union all
select * from course where name ='英语';

-- 左外连接，表1完全显示
select 字段名 from 表名1 left join 表名2 on 连接条件;
-- 右外连接，表2完全显示
select 字段 from 表名1 right join 表名2 on 连接条件;

-- 查询和陆廷在同一个班的同学
select * from student where classes_id=(
    select classes_id from student where name='陆廷'
    );

-- 查询语文和物理的成绩
-- 使用in
select * from score where course_id in (
    select id from course where name='语文' or name='物理'
);
-- 使用 not in
select * from score where course_id not in (
    select id from course where name!='语文' and name!='物理'
);

-- 查询语文和java的成绩
-- 使用exist
select * from score sco where exists (
    select sco.course_id from course cou where (name='语文' or name='java') 
    and cou.id = sco.course_id
);
-- 使用 not exist
select * from score sco where not exists (
    select sco.course_id from course cou where (name!='语文' and name!='java')
    and cou.id = sco.course_id
);


-- 查询比英语平均分数高的成绩

select * from score sco,(
    select avg(score) scor from score s,course 
    where course.name = '英语' and course.id = s.course_id
)temp
where sco.score>temp.scor;

