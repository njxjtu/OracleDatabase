--create course table
whenever sqlerror continue
drop table course cascade constraints;
whenever sqlerror exit rollback
--
create table course(course_subj varchar2(30) not null,
                    course_numb varchar2(30) not null);
alter table course
add constraint course_pk primary key (course_subj, course_numb);
--
comment on table course is 'A course base table storing all the courses';
comment on column course.course_subj is 'course subject code';
comment on column course.course_numb is 'course number';
--
--create repeatable course table
whenever sqlerror continue
drop table rptcrse cascade constraints;
whenever sqlerror exit rollback
--
create table rptcrse(rptcrse_subj varchar2(30),
                     rptcrse_numb varchar2(30));
comment on table rptcrse is 'A repeatable course table storing all the courses that can be repeated without limit';
comment on column rptcrse.rptcrse_subj is 'course subject code; it can be null indicating no restriction on subject';
comment on column rptcrse.rptcrse_numb is 'course number; it can be null indicating no restriction on course number';
--
--
--
-- select query to get the courses from course table that're repeatable without limit
-- for demo purpose, effective term concept is not considered
select course.* 
from course, rptcrse
where course_subj = case when (rptcrse_subj is null) then
                              course_subj
                         else rptcrse_subj
                     end
and course_numb = case when (rptcrse_numb is null) then
                            course_numb
                       else rptcrse_numb
                  end;
                            
