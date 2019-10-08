create table obj_tab(
 object varchar2(30), 
 grantee varchar2(30), 
 grantor  varchar2(30));

insert into obj_tab values('obj1', 'user1', 'role1');
insert into obj_tab values('obj1', 'role1', 'role10');
insert into obj_tab values('obj2', 'role1', 'role9');
insert into obj_tab values('obj2', 'user1', 'role1');
