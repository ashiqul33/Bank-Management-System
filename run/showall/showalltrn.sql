set serveroutput on;

declare
	id TransactionLog.tid%TYPE;
	ttdate TransactionLog.tdate%TYPE;
	tamount TransactionLog.amount%TYPE;

	cursor account_cur is
	(select tid,tdate,amount from TransactionLog@site_dhaka) union 
	(select tid,tdate,amount from TransactionLog@site_sylhet);
	
begin
	open account_cur;
		DBMS_OUTPUT.PUT_LINE('ID '||' DATE '||' AMOUNT ');
		loop
			fetch account_cur into id,ttdate,tamount;
			exit when account_cur%notfound;
			DBMS_OUTPUT.PUT_LINE(id||' '||ttdate||' '||TO_CHAR(tamount));
		end loop;
	close account_cur;
end;
/

