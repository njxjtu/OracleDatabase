/* Bulk Collect */
declare

  type r_emp_sal is record
  (employee_id employees.employee_id%type,
   salary      employees.salary%type);
   
  type t_emp is table of r_emp_sal;
  
  l_emp t_emp;
  
begin
  
  select employee_id, salary
  bulk collect into l_emp
  from employees
  where department_id = 11;
  
end;
