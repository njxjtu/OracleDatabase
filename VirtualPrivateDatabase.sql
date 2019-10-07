rem    Fine-grained access control policy package
rem    to mask SSN columns owned by user01

-- function making exception for account user02
function f_ssnmask1(  
p_schema varchar2, 
p_table varchar2)
return varchar2
is
return_val varchar2(400);
begin
if SYS_CONTEXT('USERENV','SESSION_USER') in ('user02') then
 return_val:='1=1';
else 
 return_val:= '1=2';
end if;
 return return_val;
end f_ssnmask1;

-- add the defined function to security policy package
dbms_rls.add_policy(
	object_schema => 'user01',
	object_name => 'table01',
	policy_name => 'ssn_policy', -- come up with a policy name
	function_schema => 'user01', -- the schema that the defined function belongs to
	policy_function => 'f_ssnmask1',
	sec_relevant_cols => 'ssn_column', -- the column name to be masked
	sec_relevant_cols_opt => dbms_rls.allrows); -- the function applies to all rows
