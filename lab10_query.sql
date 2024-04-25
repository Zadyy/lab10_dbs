select * from workers;

/* Logical error 1 */
set transaction read only;
start transaction;
update workers set salary = salary * 1.6;
-- select * from workers;
commit;

set autocommit=0;
select * from workers;
update workers set salary = salary * 0.625;


/* Logical error 2 */
start transaction;
select * from users where jdaosfvnjcsovns;


/* System error 1 */
/* Workbench query */
commit;
set transaction isolation level serializable;
set autocommit=0;
start transaction;
update users set user_type = 'Company' where user_type = 'Personal';
do sleep(10);
select * from user_log;

/* CMD query */
set transaction isolation level serializable; set autocommit = 0; start transaction; update users set user_name = 'Bataa' where user_id = 'U0001'; select * from users;

/* System error 2 */
/* Workbench query */
commit;
set transaction isolation level serializable;
set autocommit=0;
start transaction;
update users set user_type = 'Company' where user_type = 'Personal';
do sleep(10);
select * from user_log;
commit;

/* CMD query */
commit; set transaction isolation level serializable; set autocommit = 0; start transaction; update user_log set status = 1 where user_id in (select user_id from users where phone_no like '9500%'); select * from users; commit;