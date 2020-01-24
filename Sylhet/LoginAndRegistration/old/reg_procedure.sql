	create or replace procedure regDhaka
	(
		--id in Employee.eid@site_dhaka%TYPE,
		name in Employee.ename@site_dhaka%TYPE,
		username in Employee.eusername@site_dhaka%TYPE,
		branch in Employee.ebranch@site_dhaka%TYPE,
		pass in Employee.epass@site_dhaka%TYPE,
		email in Employee.eemail@site_dhaka%TYPE,
		phone in Employee.ephone@site_dhaka%TYPE,
		address in Employee.eaddress@site_dhaka%TYPE
	)
		is
		n number;
		
		sameusername exception;
		
	begin
		select count(eid) into n from Employee@site_dhaka where eusername = username;
		
		if n=0 then
			
			insert into Employee@site_dhaka values(id, name, username, branch, pass, email, phone, address);
			
			DBMS_OUTPUT.PUT_LINE('Registration SUCCESSFUL...');
			
		else
			raise sameusername;
		end if;
		
		
		exception
			when sameusername then
				DBMS_OUTPUT.PUT_LINE('User name already exists ...');
				
	end regDhaka;
	/