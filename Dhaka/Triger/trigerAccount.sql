SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER AccountTriger 
AFTER INSERT OR UPDATE ON Account 
FOR EACH ROW 
--WHEN (NEW.aid not 'da')
DECLARE 
   bal_diff number; 
   tdate date;
   id number;
   gen_id varchar2(7);
BEGIN 
	bal_diff := :NEW.abalance  - :OLD.abalance;
	if bal_diff<0 then
		bal_diff := bal_diff*(-1);
	end if;
	select Sysdate into tdate from dual;
	
	select gtid into id from id_gen;
	gen_id := 'dt'||TO_CHAR(id);
	id := id + 1;
	update id_gen set gtid = id;
	
	insert into TransactionLog values(gen_id, tdate, bal_diff);
END; 
/ 

commit;