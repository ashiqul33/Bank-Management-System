set serveroutput on;
set verify off;

declare
	name Employee.ename%TYPE;
	username Employee.eusername%TYPE;
	pass Employee.epass%TYPE;
	branch Employee.ebranch%TYPE;
	email Employee.eemail%TYPE;
	phone Employee.ephone%TYPE;
	address Employee.eaddress%TYPE;


BEGIN 

	name := '&name';
	username := '&username';
	pass := '&pass';
	branch := '&branch';
	email := '&email';
	phone := '&phone';
	address := '&address';
	ControlDhaka.regDhaka(name, username, pass, branch, email, phone, address);  
END; 
/