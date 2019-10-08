create or replace package pkg_errorhandle is

/******************************************************************************

pkg_errorhandle0.sql

Purpose: PL/SQL package to demonstrate exception handling

Repository: Oracle_ExceptionHandling          nanjiang  06/02/2016
1. Intial version.

******************************************************************************/

------------------------------------------------------------------------------

  procedure p_do_something(
    p1               in     number,
    p2               out     varchar2);

------------------------------------------------------------------------------
end pkg_errorhandle;   
/

show errors
set scan on

create or replace public synonym pkg_errorhandle for pkg_errorhandle;

