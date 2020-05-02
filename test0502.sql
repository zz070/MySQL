select student.name,score.score from student join score on 
student.id = score.student_id and student.name = '许仙';

select student.name,score.score from student,score
where student.id = score.student_id and student.name = '许仙';

select student.id,score.student_id,score.score
from student,score
where student.id = score.student_id and student.name ='许仙';

select student.id,student.sn,student.name,student.qq_mail,student.classes_id,sum(score.score)
from student join score on student.id = score.student_id
group by score.student_id;

select student.name,student.id,score.student_id,avg(score.score)
from student,score
where student.id = score.student_id
group by score.student_id;

select student.id,student.name,score.score,course.name
from student,score,course
where student.id = score.student_id
and score.course_id = course.id;

select student.name,s1.student_id from student,score s1,score s2
where s1.score < s2.score
and s1.course_id = 1
and s2.course_id = 3
and student.id = s1.student_id
group by s1.student_id;


select name from student
where classes_id = (
    select classes_id from student
    where name = '不想毕业'
);

select score from score
where course_id in(
    select id from course
    where name = 'java'or name='英文'
);

select * from score
where exists(
    select score.course_id from course
    where (name = 'java' or name='英文')
    and course.id = score.course_id
);