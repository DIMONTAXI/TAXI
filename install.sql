set verify off
set serveroutput off
set serveroutput on size 1000000
set linesize 192
set trim on
set trims on
set feedback off
spool install.log

@@schema\taxi_scr.sql
@@packages\cars_spec.sql
@@packages\cars_body.sql

spool off
exit
