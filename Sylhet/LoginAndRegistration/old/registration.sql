set serveroutput on;
set verify off;
declare
	name Employee.ename@site_dhaka%TYPE;
	username Employee.eusername@site_dhaka%TYPE;
	branch Employee.ebranch@site_dhaka%TYPE;
	pass Employee.epass@site_dhaka%TYPE;
	email Employee.eemail@site_dhaka%TYPE;
	phone Employee.ephone@site_dhaka%TYPE;
	address Employee.eaddress@site_dhaka%TYPE;
	id int;

begin	

	name := '&name';
	username := '&username';
	branch := '&branch';
	pass := '&pass';
	email := '&email';
	phone := '&phone';
	address := '&address';
	
	--DBMS_OUTPUT.PUT_LINE(TO_CHAR(name) || TO_CHAR(username) || TO_CHAR(pass) || TO_CHAR(branch) || TO_CHAR(email) || TO_CHAR(phone) || TO_CHAR(address));

	select eid into id from id_gen@site_dhaka;
	
	regControl.regDhaka(id, name, username, branch, pass, email, phone, address);
	
	id := id + 1;
	update Employee@site_dhaka set eid = id;

end;
/


commit;