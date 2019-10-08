
create or replace package body pkg_errorhandle is
  
/******************************************************************************

pkg_errorhandle1.sql

Purpose: PL/SQL package to demonstrate exception handling

Repository: Oracle_ExceptionHandling          nanjiang  06/02/2016
1. Intial version.

******************************************************************************/

  local_error    constant number    := -20900;

------------------------------------------------------------------------------

  procedure p_raise (
    p_err_msg   in varchar2,
    p_fatal_ind in varchar2 default 'Y');

-------------------------------------------------------------------------------

  procedure p_raise (
    p_err_msg   in varchar2,
    p_fatal_ind in varchar2 default 'Y')
  is
  begin
     if (p_fatal_ind = 'Y') then
        raise_application_error(local_error, p_err_msg);
     end if;
  end p_raise;

-------------------------------------------------------------------------------

  procedure p_do_something(
    p1               in     number,
    p2               out    varchar2);
  is

  begin
  
  /* Initialization */
  l_fatal_ind    := 'Y';
  l_message      := '';
  
  if ( p1 = 1 ) then
    dbms_output.put_line('do something here');
  else
    l_message := 'input p1 is not 1';
    p_raise(l_message, l_fatal_ind);                         -- user defined exception
  end if;
  
  exception 
    when others then                                         -- other exceptions 
      l_message := l_message||' '||substr(sqlerrm, 1, 500);
      insert into log_tab(result, message) values( 'Error', l_message); 
      rollback;
      raise;
  end p_do_something;

------------------------------------------------------------------------------

end pkg_errorhandle;
/
