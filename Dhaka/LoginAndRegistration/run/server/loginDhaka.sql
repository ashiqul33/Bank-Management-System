set serveroutput on;
set verify off;

declare
	username Employee.eusername@site_dhaka%TYPE;
	pass Employee.epass@site_dhaka%TYPE;

BEGIN 
	username := '&username';
	pass := '&pass';
	ControlDhaka.loginDhaka@site_dhaka(username, pass); 

	DBMS_OUTPUT.PUT_LINE('Login successfully');
END; 
/

commit;