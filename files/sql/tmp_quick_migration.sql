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





