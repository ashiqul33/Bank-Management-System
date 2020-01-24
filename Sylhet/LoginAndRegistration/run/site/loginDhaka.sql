set serveroutput on;
set verify off;

declare
	username Employee.eusername%TYPE;
	pass Employee.epass%TYPE;

BEGIN 
	username := '&username';
	pass := '&pass';
	ControlDhaka.loginDhaka(username, pass);  
END; 
/