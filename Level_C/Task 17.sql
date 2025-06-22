-- Query
create login ParidhiLogin with password='Paridhi@12345';
use Level_C;
create user Pari for login ParidhiLogin;
alter role db_owner add member Pari;