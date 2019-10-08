/*audit trail:
njxjtu 12/18/2014
SSN security enhancement project:
procedure looks up for columns that store SSN information in all tables and views and inserts the table name, column name, and not null record count of the SSN column into table wctssne
audit trail end
*/

create or replace procedure p_insert_wctssne is 

rcount   number;
ttype    varchar2(11);
tcmt     varchar2(4000);
ccmt     varchar2(4000);

begin

-- screen tables

for c1_rec in 
 (select owner, table_name, column_name 
  from dba_tab_columns
  where column_name like '%SSN%' 
  and char_length in (9,15) 
  and (exists (select * 
               from dba_tables allt 
               where allt.table_name=table_name 
               and allt.owner=owner
               )
       ) 
  )
loop
          execute immediate 'select table_type from dba_tab_comments where table_name= '''||c1_rec.table_name||''' and owner= '''||c1_rec.owner||'''' into ttype;
          execute immediate 'select comments from dba_tab_comments where table_name= '''||c1_rec.table_name||''' and owner= '''||c1_rec.owner||'''' into tcmt;
          execute immediate 'select comments from dba_col_comments where owner= '''||c1_rec.owner||''' and table_name= '''||c1_rec.table_name||''' and column_name= '''||c1_rec.column_name||'''' into ccmt;
          execute immediate 'select count(*) from '||c1_rec.owner||'.'||c1_rec.table_name||' where '||c1_rec.column_name||' is not null and length('||c1_rec.column_name||')>=9' into rcount;
          execute immediate 'insert into wctssne values(:1 ,:2 ,:3 ,:4, :5, :6, :7, :8, :9)' 
          using c1_rec.owner, c1_rec.table_name, ttype, tcmt, c1_rec.column_name, ccmt, rcount, sysdate, user;
end loop;

-- screen views

for c2_rec in 
 (select owner, table_name, column_name 
  from dba_tab_columns
  where column_name like '%SSN%' 
  and char_length in (9,15)
  and exists (select * 
                 from dba_views allv 
                 where allv.view_name=table_name))
loop
          execute immediate 'select table_type from dba_tab_comments where table_name= '''||c2_rec.table_name||''' and owner= '''||c2_rec.owner||'''' into ttype;
          execute immediate 'select comments from dba_tab_comments where table_name= '''||c2_rec.table_name||''' and owner= '''||c2_rec.owner||'''' into tcmt;
          execute immediate 'select comments from dba_col_comments where owner= '''||c2_rec.owner||''' and table_name= '''||c2_rec.table_name||''' and column_name= '''||c2_rec.column_name||'''' into ccmt;
          execute immediate 'insert into wctssne(wctssne_owner,wctssne_tablename, wctssne_type, wctssne_tablecmt, wctssne_columnname, wctssne_columncmt, wctssne_activity_date, wctssne_user_id) values(:1 ,:2 ,:3 ,:4, :5, :6, :7, :8)' 
          using c2_rec.owner, c2_rec.table_name, ttype, tcmt, c2_rec.column_name, ccmt, sysdate, user;
end loop;

end p_insert_wctssne;
