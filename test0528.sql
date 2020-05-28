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

