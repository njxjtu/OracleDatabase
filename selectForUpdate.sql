declare

  cursor c_1 is select empno, sal
                from emp
                where job='Marketing' and comm>sal
                for update nowait;
              
begin 

  open c_1;
  loop
    fetch c_1 into ...;
    update emp 
    set sal = new_sal 
    where current of c_1;
  end loop;

end;
    
  
