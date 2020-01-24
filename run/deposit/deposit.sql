set serveroutput on;
set verify off;

declare
	id varchar2(7);
	balance number;
	nd int;
	ns int;
	
	noUser exception;
	negAmount exception;

BEGIN 

	id := '&account_no';
	balance := &amount;
	
	if balance<0 then
		raise negAmount;
	else
	
		select count(aid) into nd from Account@site_dhaka where aid = id;
		select count(aid) into ns from Account@site_sylhet where aid = id;
	
		if nd>0 then
			depositDhaka@site_dhaka(id, balance);
			DBMS_OUTPUT.PUT_LINE('Taka deposit successfully');
		elsif ns>0 then
			depositSylhet@site_sylhet(id, balance);
			DBMS_OUTPUT.PUT_LINE('Taka deposit successfully');
		else
			raise noUser;
		end if;
	end if;
	
	exception
		when noUser then
			DBMS_OUTPUT.PUT_LINE('Invalid username');
		when negAmount then
			DBMS_OUTPUT.PUT_LINE('Invalid amount');
END; 
/

commit;