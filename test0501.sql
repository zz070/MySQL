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

-- 查询秦诺和吴婼的成绩
select score.course_id,score.score
from student,score
where student.name = '秦诺' and student.id = score.student_id;

select score.course_id,score.score
from student join score
on student.name = '秦诺'and student.id = score.student_id;