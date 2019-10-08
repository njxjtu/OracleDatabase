/* Need to declare the cursor variable first */

declare

  type empCurTyp is ref cursor return employees%rowtype;
  emp empCurTyp;
  
  procedure p_emp_cv (emp_cv in empCurTyp) is 
    person employees%rowtype;
  begin
    loop
      fetch emp_cv into person;
      exit when emp_cv%notfound;
    end loop;
  end;
  
begin

  open emp for select * from employees where rownum<12;
    process_emp_cv(emp);
  close emp;
  
end;

/
