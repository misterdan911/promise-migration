drop database db_usman with(force);
drop database db_sidapet with(force);
drop database db_sippan with(force);
drop database db_sibela with(force);
drop database db_siplang with(force);



create database db_usman;
create database db_sippan;
create database db_sidapet;
create database db_sibela;
create database db_siplang;


sudo -u postgres psql -d db_usman -f db_usman.sql
sudo -u postgres psql -d db_sippan -f db_sippan.sql
sudo -u postgres psql -d db_sidapet -f db_sidapet.sql
sudo -u postgres psql -d db_sibela -f db_sibela.sql
sudo -u postgres psql -d db_siplang -f db_siplang.sql





-- ---------------
drop database db_siplang with(force);
create database db_siplang;

sudo -u postgres psql -d db_siplang -f db_siplang.sql

\c db_siplang

GRANT CONNECT ON DATABASE db_siplang TO pemuda_promise;
GRANT USAGE ON SCHEMA public TO pemuda_promise;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO pemuda_promise;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO pemuda_promise;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO pemuda_promise;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO pemuda_promise;
-- ---------------

drop database db_sibela with(force);
create database db_sibela;
sudo -u postgres psql -d db_sibela -f db_sibela.sql
sudo -u postgres psql

\c db_sibela

GRANT CONNECT ON DATABASE db_sibela TO pemuda_promise;
GRANT USAGE ON SCHEMA public TO pemuda_promise;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO pemuda_promise;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO pemuda_promise;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO pemuda_promise;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO pemuda_promise;
-- ---------------

sudo -u postgres psql
drop database db_sidapet with(force);
create database db_sidapet;

sudo -u postgres psql -d db_sidapet -f db_sidapet.sql
sudo -u postgres psql

\c db_sidapet

-- GRANT necessary previleges
GRANT CONNECT ON DATABASE db_sidapet TO pemuda_promise;
GRANT USAGE ON SCHEMA public TO pemuda_promise;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO pemuda_promise;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO pemuda_promise;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO pemuda_promise;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO pemuda_promise;



-- ---------------
sudo -u postgres psql
drop database db_sippan with(force);
create  database db_sippan;

sudo -u postgres psql -d db_sippan -f db_sippan.sql
sudo -u postgres psql

\c db_sippan

-- GRANT necessary previleges
GRANT CONNECT ON DATABASE db_sippan TO pemuda_promise;
GRANT USAGE ON SCHEMA public TO pemuda_promise;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO pemuda_promise;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO pemuda_promise;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO pemuda_promise;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO pemuda_promise;











