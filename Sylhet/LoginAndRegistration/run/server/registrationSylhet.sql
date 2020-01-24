set serveroutput on;
set verify off;

declare
	name Employee.ename@site_sylhet%TYPE;
	username Employee.eusername@site_sylhet%TYPE;
	pass Employee.epass@site_sylhet%TYPE;
	branch Employee.ebranch@site_sylhet%TYPE;
	email Employee.eemail@site_sylhet%TYPE;
	phone Employee.ephone@site_sylhet%TYPE;
	address Employee.eaddress@site_sylhet%TYPE;


BEGIN 

	name := '&name';
	username := '&username';
	pass := '&pass';
	branch := '&branch';
	email := '&email';
	phone := '&phone';
	address := '&address';
	ControlSylhet.regSylhet@site_sylhet(name, username, pass, branch, email, phone, address);
	
	DBMS_OUTPUT.PUT_LINE('Registration successfully');
END; 
/

commit;