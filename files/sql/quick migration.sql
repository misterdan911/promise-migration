
SET foreign_key_checks = 0;

drop database vms_db;
create database vms_db;

drop database promise_sippan;
create database promise_sippan;
use promise_sippan;
source promise_sippan.sql;
grant all on promise_sippan.* to 'pgloader_my'@'localhost';

drop database promise_sibela;
create database promise_sibela;
use promise_sibela;
source promise_sibela.sql;
grant all on promise_sibela.* to 'pgloader_my'@'localhost';


drop database promise_siplang;
create database promise_siplang;
use promise_siplang;
source promise_siplang.sql;
grant all on promise_siplang.* to 'pgloader_my'@'localhost';


drop database promise_esign;
create database promise_esign;



-- postgres
-- ----------------------------------------------------
drop database vms_db with(force);
create database vms_db;
GRANT ALL ON DATABASE vms_db TO pgloader_pg;
alter database vms_db owner to pgloader_pg;

drop database promise_sippan with(force);
create database promise_sippan;
GRANT ALL ON DATABASE promise_sippan TO pgloader_pg;
alter database promise_sippan owner to pgloader_pg;

drop database promise_sibela with(force);
create database promise_sibela;
GRANT ALL ON DATABASE promise_sibela TO pgloader_pg;
alter database promise_sibela owner to pgloader_pg;

drop database promise_siplang with(force);
create database promise_siplang;
GRANT ALL ON DATABASE promise_siplang TO pgloader_pg;
alter database promise_siplang owner to pgloader_pg;



use vms_db;
source vms_db.sql;

use promise_sippan;
source promise_sippan.sql;

use promise_sibela;
source promise_sibela.sql;

use promise_siplang;
source promise_siplan



sudo -u postgres pg_dump -d vms_db -f vms_db.sql
sudo -u postgres pg_dump -d promise_sippan -f promise_sippan.sql
sudo -u postgres pg_dump -d promise_sibela -f promise_sibela.sql
sudo -u postgres pg_dump -d promise_siplang -f promise_siplang.sql


sudo -u postgres pg_dump -d vms_db -f vms_db.sql
sudo -u postgres pg_dump -d promise_sippan -f promise_sippan.sql
sudo -u postgres pg_dump -d promise_sibela -f promise_sibela.sql
sudo -u postgres pg_dump -d promise_siplang -f promise_siplang.sql



psql -U postgres -d vms_db -f .\vms_db.sql
psql -U postgres -d promise_sippan -f .\promise_sippan.sql
psql -U postgres -d promise_sibela -f .\promise_sibela.sql
psql -U postgres -d promise_siplang -f .\promise_siplang.sql
