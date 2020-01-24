set serveroutput on;
set verify off;

declare
	name Employee.ename@site_dhaka%TYPE;
	username Employee.eusername@site_dhaka%TYPE;
	pass Employee.epass@site_dhaka%TYPE;
	branch Employee.ebranch@site_dhaka%TYPE;
	email Employee.eemail@site_dhaka%TYPE;
	phone Employee.ephone@site_dhaka%TYPE;
	address Employee.eaddress@site_dhaka%TYPE;


BEGIN 

	name := '&name';
	username := '&username';
	pass := '&pass';
	branch := '&branch';
	email := '&email';
	phone := '&phone';
	address := '&address';
	ControlDhaka.regDhaka@site_dhaka(name, username, pass, branch, email, phone, address);
	
	DBMS_OUTPUT.PUT_LINE('Registration successfully');
END; 
/

commit;