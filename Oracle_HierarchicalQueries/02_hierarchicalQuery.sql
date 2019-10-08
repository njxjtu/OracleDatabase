/* connect by */
select *
from obj_tab
connect by prior grantor = grantee
start with object = 'obj1' and grantee='user1';

/*
return: 
--------------------------
object | grantee | grantor
--------------------------
obj1	   user1	   role1
obj1	   role1	   role10
obj2	   role1	   role9
*/

--------------------------------------------------

/* Level - return the depth of hierarchy*/
select obj_tab.*, level
from obj_tab
connect by prior grantor = grantee
start with object = 'obj1' and grantee='user1';

/*
return: 
----------------------------------
object | grantee | grantor | level
----------------------------------
obj1	   user1	   role1     1
obj1	   role1	   role10    2
obj2	   role1	   role9     2
*/

--------------------------------------------------

/* ORDER SIBLINGS BY */
select obj_tab.*, level
from obj_tab
connect by prior grantor = grantee
start with grantee='user1'
order siblings by grantor desc;
/*return
----------------------------------
object | grantee | grantor | level
----------------------------------
obj1	   user1	   role1	   1
obj2	   role1	   role9	   2
obj1	   role1	   role10	   2
obj2	   user1	   role1	   1
obj2	   role1	   role9	   2
obj1	   role1	   role10	   2
*/
