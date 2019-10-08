/* forall 
   should convert for loop to forall
   if there is only DML statement */
   
 
begin

  forall indx 1 .. l_ids.count
    update employees 
    set employees.salary = employees.salary * 1.1
    where employees.employees_id = l_ids(indx);
 
 end;
