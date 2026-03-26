ALTER TABLE public.trx_group_user DROP CONSTRAINT unique_kode_group_id_user;
ALTER TABLE public.trx_group_user ADD CONSTRAINT unique_kode_group_id_user UNIQUE (kode_group, id_user);


select setval('ref_user_id_seq', (select max(id) from ref_user));
select setval('ref_user_internal_id_seq', (select max(id) from ref_user_internal));
select setval('trx_group_user_id_seq', (select max(id_group_user) from trx_group_user));
select setval('trx_user_tampung_kode_user_tampung_seq', (select max(kode_user_tampung) from trx_user_tampung));





isdeo@ecampus.ut.ac.id::Fantio Isdeo Margono::119970603202403101
muqsith@ecampus.ut.ac.id::Muhammad Muqsith Arsyad::119971124202403101
endirekarti@ecampus.ut.ac.id::Endi Rekarti::119670619202403101
muhamad.farhan@ecampus.ut.ac.id::Muhamad Farhan Wirakusuma::120011113202509101
erika@ecampus.ut.ac.id::Erika Darmayanti::197901152005012002
nining@ecampus.ut.ac.id::Nining Setianingsih::197102122001122001
isti@ecampus.ut.ac.id::Isti Rokhiyah::196207161988012001
leonard_rh@ecampus.ut.ac.id::Leonard Raden Hutasoit::196412261991031002
faujatul.hasanah@ecampus.ut.ac.id::Faujatul Hasanah::199510012024062002
naufal_rc@ecampus.ut.ac.id::Naufal Rifky Cahya::119910828202403101
arie.aryanto@ecampus.ut.ac.id::Arie Aryanto::198904092024061001
dewis@ecampus.ut.ac.id::Dewi Suranti::198310092010122005
julianto@ecampus.ut.ac.id::Julianto Mardimpu Pasaribu::197207112003121002
andiharmoko@ecampus.ut.ac.id::Andi Harmoko Arifin::198604162022031001
habiburrahman@ecampus.ut.ac.id::Habiburrahman::199206092022031006
permanamirza@ecampus.ut.ac.id::Mirza Permana::119870530202403101
tessa@ecampus.ut.ac.id::Tessa Melanie Wulandari::198205072005012001
rizki@ecampus.ut.ac.id::Rizki Annisha::119920311202312201
yudhiprasetiyo@ecampus.ut.ac.id::Yudhi Prasetiyo::199403262022031015
een.setyowati@ecampus.ut.ac.id::Een Setyowati::120030307202509201
muhammad.sayyid@ecampus.ut.ac.id::Muhammad Sayyid Assobri::119990903202509102
farkhan.raflesia@ecampus.ut.ac.id::Farkhan Raflesia::119960628202403101
malin@ecampus.ut.ac.id::M. Ali Nurdin::198203142005011001
turrohman@ecampus.ut.ac.id::Taufiqurrohman::119960820202403102
hakim.usmanto@ecampus.ut.ac.id::Hakim Usmanto::119990719202509101
moch_randy@ecampus.ut.ac.id::Mochammad Randy Oktaviano Varkevisser::119901023202307101
dhyan-alamandha@ecampus.ut.ac.id::Dhyan Alamandha::119940311202307101
imron@ecampus.ut.ac.id::M. Imron::119980727202403101
bangun@ecampus.ut.ac.id::Bangun Asmo Darmanto::198602262010121007
toraakadira@ecampus.ut.ac.id::Tora Akadira::197602062005011003
trieafia@ecampus.ut.ac.id::Trie Afia Farid::119900621202307201
nurul.rahma@ecampus.ut.ac.id::Nurul Aulia Rahma::119990717202403201
ibnu.haris@ecampus.ut.ac.id::Ibnu Abdul Haris::119990828202505101
juhana@ecampus.ut.ac.id::Juhana::197405302005012001
prima.andriani@ecampus.ut.ac.id::Prima Andriani::198701022010122001
mainindio@ecampus.ut.ac.id::Muhamad Ainindio::119930625202505101
trias@ecampus.ut.ac.id::Trias Rachmatika::198006282010122002
abdurrahman@ecampus.ut.ac.id::Abdurrahman Rahim Thaha::198612162022031003
irwandi@ecampus.ut.ac.id::Irwandi::197802112005011001
musowwir@ecampus.ut.ac.id::Milkul Musowwir::119950609202403101
caesario@ecampus.ut.ac.id::Caesario Satriatama::119940317202403101
radianti@ecampus.ut.ac.id::Radianti Febria Sari Wiedarti::119950227202403201
donyds@ecampus.ut.ac.id::Dony Darma Sagita::199011232024061002
muktia.pramitasari@ecampus.ut.ac.id::Muktia Pramitasari::198902062022032005
monika@ecampus.ut.ac.id::Monika Handayani::199111172018032001
madegs@ecampus.ut.ac.id::I Made Gunawan Sanjaya::198705122010121006
teguhmi@ecampus.ut.ac.id::Teguh Muhammad Ilham::197908232005011001
zorro@ecampus.ut.ac.id::Zorro Yogi Simanjuntak::119911125202403101
rudimuhammad@ecampus.ut.ac.id::Rudi Muhamad Nurdin::119890613202403101
tuti_@ecampus.ut.ac.id::Tuti::119980823202403201
macdi@ecampus.ut.ac.id::Macdi Fernanda::119950702202403101
ridhohm@ecampus.ut.ac.id::Ridho Harma Muhammad::119951008202403101
hamzah@ecampus.ut.ac.id::Hamzah Mujahid::119921225202403101
akhla@ecampus.ut.ac.id::Akhla Sabila::199301282018012003
fitri_yanti@ecampus.ut.ac.id::Fitri Yanti::119890610202307201
selly@ecampus.ut.ac.id::Selly Anastassia Amellia Kharis::199401082020122016
melisa.arisanty@ecampus.ut.ac.id::Melisa Arisanty::198905202019032024
muh.komarudin@ecampus.ut.ac.id::Muhamad Komarudin::199011302020121009
hendrabudiman@ecampus.ut.ac.id::Hendra Budiman::198102212005011002
hazmiadlan@ecampus.ut.ac.id::Hazmi Adlan Hawari::119970806202403101
ernayanti.widhi@ecampus.ut.ac.id::Ernayanti Nur Widhi::198408012019032006
harism@ecampus.ut.ac.id::Haris Masri::119921009202312101
nurrohman@ecampus.ut.ac.id::Nur Rohman Hadi::198002262006041001
cicilia.anggraini@ecampus.ut.ac.id::Cicilia Clara Devi Anggraini::199205012019032027
fransiskam@ecampus.ut.ac.id::Fransiska Meilani::119970518202403201
alfatri.anom@ecampus.ut.ac.id::Alfatri Anom::198508102019032016
nurjaya@ecampus.ut.ac.id::I Wayan Gde Nurjaya::197801302005011002
shufiazuhroh@ecampus.ut.ac.id::Shufia Zuhroh::199108272022032012
dyahpalupi@ecampus.ut.ac.id::Dyah Palupi Setiyoningrum::197607152005012001
yance@ecampus.ut.ac.id::Yance Bunga Ga Kore::197301072005011001
adrianto@ecampus.ut.ac.id::Adrianto::197501172006041001
yurigita@ecampus.ut.ac.id::Yuri Gita Putri::119960927202403201
afriliani@ecampus.ut.ac.id::Afriliani::199204192020122016
jalil@ecampus.ut.ac.id::Jalil::197208062006041002
nisa-fitria@ecampus.ut.ac.id::An Nissa Fitria::119940308202312201
restumonika@ecampus.ut.ac.id::Restu Monika Nia Betaubun::199007172020122006
khaerul.anam@ecampus.ut.ac.id::Khaerul Anam::199212312019031021
syahrinullah@ecampus.ut.ac.id::Syahrinullah::198303242009041002
supardiab@ecampus.ut.ac.id::Supardi Abas::197905102005011001
raflenaril@ecampus.ut.ac.id::Raflen Aril Gerungan::198708252019031011
patrick@ecampus.ut.ac.id::Patrick Nicolas Rambing::119930730202403101
hubertina@ecampus.ut.ac.id::Hubertina Karolina Ngarbingan::119921030202403201
prayoganugraha@ecampus.ut.ac.id::Prayoga Nugraha::119900526202403101
sittijamilah@ecampus.ut.ac.id::Sitti Jamilah::198602212019032011
mus@ecampus.ut.ac.id::Musliadi::197707162008011016
agung.muddianto@ecampus.ut.ac.id::Agung Muddianto Ketaren::119960725202312101
usymanurung@ecampus.ut.ac.id::Usy Nora Manurung::199105222020122002
steviani@ecampus.ut.ac.id::Steviani Batti'::198809262019032022
rezkyabdi@ecampus.ut.ac.id::Moh Rezky Abditaska Hasan::119930709202312101
rahmanhasim@ecampus.ut.ac.id::Rahman Hasim::198908102019031004
abraham@ecampus.ut.ac.id::Abraham Sarapil::119870825202307101
edy-fitriawan@ecampus.ut.ac.id::Edy Fitriawan Syahadat::198805172020121006
nur@ecampus.ut.ac.id::Nur Asiah::197808142002122002
hart@ecampus.ut.ac.id::Suhartono::197007142002121001


delete from ref_user where id >= 33000;

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33000, 'isdeo@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33000, '119970603202403101', 'Fantio Isdeo Margono', NULL, NULL, 33000);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33001, 'muqsith@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33001, '119971124202403101', 'Muhammad Muqsith Arsyad', NULL, NULL, 33001);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33002, 'endirekarti@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33002, '119670619202403101', 'Endi Rekarti', NULL, NULL, 33002);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33003, 'muhamad.farhan@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33003, '120011113202509101', 'Muhamad Farhan Wirakusuma', NULL, NULL, 33003);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33004, 'erika@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33004, '197901152005012002', 'Erika Darmayanti', NULL, NULL, 33004);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33005, 'nining@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33005, '197102122001122001', 'Nining Setianingsih', NULL, NULL, 33005);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33006, 'isti@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33006, '196207161988012001', 'Isti Rokhiyah', NULL, NULL, 33006);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33007, 'leonard_rh@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33007, '196412261991031002', 'Leonard Raden Hutasoit', NULL, NULL, 33007);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33008, 'faujatul.hasanah@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33008, '199510012024062002', 'Faujatul Hasanah', NULL, NULL, 33008);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33009, 'naufal_rc@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33009, '119910828202403101', 'Naufal Rifky Cahya', NULL, NULL, 33009);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33010, 'arie.aryanto@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33010, '198904092024061001', 'Arie Aryanto', NULL, NULL, 33010);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33011, 'dewis@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33011, '198310092010122005', 'Dewi Suranti', NULL, NULL, 33011);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33012, 'julianto@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33012, '197207112003121002', 'Julianto Mardimpu Pasaribu', NULL, NULL, 33012);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33013, 'andiharmoko@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33013, '198604162022031001', 'Andi Harmoko Arifin', NULL, NULL, 33013);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33014, 'habiburrahman@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33014, '199206092022031006', 'Habiburrahman', NULL, NULL, 33014);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33015, 'permanamirza@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33015, '119870530202403101', 'Mirza Permana', NULL, NULL, 33015);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33016, 'tessa@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33016, '198205072005012001', 'Tessa Melanie Wulandari', NULL, NULL, 33016);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33017, 'rizki@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33017, '119920311202312201', 'Rizki Annisha', NULL, NULL, 33017);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33018, 'yudhiprasetiyo@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33018, '199403262022031015', 'Yudhi Prasetiyo', NULL, NULL, 33018);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33019, 'een.setyowati@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33019, '120030307202509201', 'Een Setyowati', NULL, NULL, 33019);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33020, 'muhammad.sayyid@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33020, '119990903202509102', 'Muhammad Sayyid Assobri', NULL, NULL, 33020);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33021, 'farkhan.raflesia@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33021, '119960628202403101', 'Farkhan Raflesia', NULL, NULL, 33021);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33022, 'malin@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33022, '198203142005011001', 'M. Ali Nurdin', NULL, NULL, 33022);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33023, 'turrohman@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33023, '119960820202403102', 'Taufiqurrohman', NULL, NULL, 33023);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33024, 'hakim.usmanto@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33024, '119990719202509101', 'Hakim Usmanto', NULL, NULL, 33024);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33025, 'moch_randy@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33025, '119901023202307101', 'Mochammad Randy Oktaviano Varkevisser', NULL, NULL, 33025);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33026, 'dhyan-alamandha@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33026, '119940311202307101', 'Dhyan Alamandha', NULL, NULL, 33026);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33027, 'imron@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33027, '119980727202403101', 'M. Imron', NULL, NULL, 33027);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33028, 'bangun@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33028, '198602262010121007', 'Bangun Asmo Darmanto', NULL, NULL, 33028);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33029, 'toraakadira@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33029, '197602062005011003', 'Tora Akadira', NULL, NULL, 33029);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33030, 'trieafia@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33030, '119900621202307201', 'Trie Afia Farid', NULL, NULL, 33030);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33031, 'nurul.rahma@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33031, '119990717202403201', 'Nurul Aulia Rahma', NULL, NULL, 33031);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33032, 'ibnu.haris@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33032, '119990828202505101', 'Ibnu Abdul Haris', NULL, NULL, 33032);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33033, 'juhana@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33033, '197405302005012001', 'Juhana', NULL, NULL, 33033);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33034, 'prima.andriani@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33034, '198701022010122001', 'Prima Andriani', NULL, NULL, 33034);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33035, 'mainindio@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33035, '119930625202505101', 'Muhamad Ainindio', NULL, NULL, 33035);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33036, 'trias@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33036, '198006282010122002', 'Trias Rachmatika', NULL, NULL, 33036);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33037, 'abdurrahman@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33037, '198612162022031003', 'Abdurrahman Rahim Thaha', NULL, NULL, 33037);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33038, 'irwandi@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33038, '197802112005011001', 'Irwandi', NULL, NULL, 33038);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33039, 'musowwir@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33039, '119950609202403101', 'Milkul Musowwir', NULL, NULL, 33039);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33040, 'caesario@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33040, '119940317202403101', 'Caesario Satriatama', NULL, NULL, 33040);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33041, 'radianti@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33041, '119950227202403201', 'Radianti Febria Sari Wiedarti', NULL, NULL, 33041);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33042, 'donyds@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33042, '199011232024061002', 'Dony Darma Sagita', NULL, NULL, 33042);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33043, 'muktia.pramitasari@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33043, '198902062022032005', 'Muktia Pramitasari', NULL, NULL, 33043);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33044, 'monika@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33044, '199111172018032001', 'Monika Handayani', NULL, NULL, 33044);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33045, 'madegs@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33045, '198705122010121006', 'I Made Gunawan Sanjaya', NULL, NULL, 33045);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33046, 'teguhmi@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33046, '197908232005011001', 'Teguh Muhammad Ilham', NULL, NULL, 33046);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33047, 'zorro@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33047, '119911125202403101', 'Zorro Yogi Simanjuntak', NULL, NULL, 33047);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33048, 'rudimuhammad@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33048, '119890613202403101', 'Rudi Muhamad Nurdin', NULL, NULL, 33048);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33049, 'tuti_@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33049, '119980823202403201', 'Tuti', NULL, NULL, 33049);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33050, 'macdi@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33050, '119950702202403101', 'Macdi Fernanda', NULL, NULL, 33050);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33051, 'ridhohm@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33051, '119951008202403101', 'Ridho Harma Muhammad', NULL, NULL, 33051);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33052, 'hamzah@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33052, '119921225202403101', 'Hamzah Mujahid', NULL, NULL, 33052);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33053, 'akhla@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33053, '199301282018012003', 'Akhla Sabila', NULL, NULL, 33053);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33054, 'fitri_yanti@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33054, '119890610202307201', 'Fitri Yanti', NULL, NULL, 33054);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33055, 'selly@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33055, '199401082020122016', 'Selly Anastassia Amellia Kharis', NULL, NULL, 33055);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33056, 'melisa.arisanty@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33056, '198905202019032024', 'Melisa Arisanty', NULL, NULL, 33056);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33057, 'muh.komarudin@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33057, '199011302020121009', 'Muhamad Komarudin', NULL, NULL, 33057);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33058, 'hendrabudiman@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33058, '198102212005011002', 'Hendra Budiman', NULL, NULL, 33058);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33059, 'hazmiadlan@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33059, '119970806202403101', 'Hazmi Adlan Hawari', NULL, NULL, 33059);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33060, 'ernayanti.widhi@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33060, '198408012019032006', 'Ernayanti Nur Widhi', NULL, NULL, 33060);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33061, 'harism@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33061, '119921009202312101', 'Haris Masri', NULL, NULL, 33061);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33062, 'nurrohman@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33062, '198002262006041001', 'Nur Rohman Hadi', NULL, NULL, 33062);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33063, 'cicilia.anggraini@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33063, '199205012019032027', 'Cicilia Clara Devi Anggraini', NULL, NULL, 33063);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33064, 'fransiskam@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33064, '119970518202403201', 'Fransiska Meilani', NULL, NULL, 33064);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33065, 'alfatri.anom@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33065, '198508102019032016', 'Alfatri Anom', NULL, NULL, 33065);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33066, 'nurjaya@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33066, '197801302005011002', 'I Wayan Gde Nurjaya', NULL, NULL, 33066);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33067, 'shufiazuhroh@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33067, '199108272022032012', 'Shufia Zuhroh', NULL, NULL, 33067);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33068, 'dyahpalupi@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33068, '197607152005012001', 'Dyah Palupi Setiyoningrum', NULL, NULL, 33068);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33069, 'yance@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33069, '197301072005011001', 'Yance Bunga Ga Kore', NULL, NULL, 33069);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33070, 'adrianto@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33070, '197501172006041001', 'Adrianto', NULL, NULL, 33070);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33071, 'yurigita@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33071, '119960927202403201', 'Yuri Gita Putri', NULL, NULL, 33071);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33072, 'afriliani@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33072, '199204192020122016', 'Afriliani', NULL, NULL, 33072);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33073, 'jalil@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33073, '197208062006041002', 'Jalil', NULL, NULL, 33073);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33074, 'nisa-fitria@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33074, '119940308202312201', 'An Nissa Fitria', NULL, NULL, 33074);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33075, 'restumonika@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33075, '199007172020122006', 'Restu Monika Nia Betaubun', NULL, NULL, 33075);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33076, 'khaerul.anam@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33076, '199212312019031021', 'Khaerul Anam', NULL, NULL, 33076);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33077, 'syahrinullah@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33077, '198303242009041002', 'Syahrinullah', NULL, NULL, 33077);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33078, 'supardiab@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33078, '197905102005011001', 'Supardi Abas', NULL, NULL, 33078);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33079, 'raflenaril@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33079, '198708252019031011', 'Raflen Aril Gerungan', NULL, NULL, 33079);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33080, 'patrick@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33080, '119930730202403101', 'Patrick Nicolas Rambing', NULL, NULL, 33080);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33081, 'hubertina@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33081, '119921030202403201', 'Hubertina Karolina Ngarbingan', NULL, NULL, 33081);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33082, 'prayoganugraha@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33082, '119900526202403101', 'Prayoga Nugraha', NULL, NULL, 33082);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33083, 'sittijamilah@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33083, '198602212019032011', 'Sitti Jamilah', NULL, NULL, 33083);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33084, 'mus@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33084, '197707162008011016', 'Musliadi', NULL, NULL, 33084);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33085, 'agung.muddianto@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33085, '119960725202312101', 'Agung Muddianto Ketaren', NULL, NULL, 33085);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33086, 'usymanurung@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33086, '199105222020122002', 'Usy Nora Manurung', NULL, NULL, 33086);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33087, 'steviani@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33087, '198809262019032022', 'Steviani Batti', NULL, NULL, 33087);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33088, 'rezkyabdi@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33088, '119930709202312101', 'Moh Rezky Abditaska Hasan', NULL, NULL, 33088);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33089, 'rahmanhasim@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33089, '198908102019031004', 'Rahman Hasim', NULL, NULL, 33089);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33090, 'abraham@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33090, '119870825202307101', 'Abraham Sarapil', NULL, NULL, 33090);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33091, 'edy-fitriawan@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33091, '198805172020121006', 'Edy Fitriawan Syahadat', NULL, NULL, 33091);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33092, 'nur@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33092, '197808142002122002', 'Nur Asiah', NULL, NULL, 33092);

INSERT INTO "public"."ref_user" ("id", "email", "password", "status_user") VALUES
(33093, 'hart@ecampus.ut.ac.id', '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i', 'internal');
INSERT INTO "public"."ref_user_internal" ("id_user", "nip", "username", "udcr", "udch", "id") VALUES
(33093, '197007142002121001', 'Suhartono', NULL, NULL, 33093);










id_user: 198
id_user: 554
id_user: 32679
id_user: 33000
id_user: 33001
id_user: 29
id_user: 33002
id_user: 33003
id_user: 12656
id_user: 31420
id_user: 12608
id_user: 122
id_user: 33004
id_user: 33005
id_user: 33006
id_user: 33007
id_user: 12211
id_user: 12911
id_user: 33008
id_user: 33009
id_user: 12853
id_user: 33010
id_user: 33011
id_user: 33012
id_user: 12382
id_user: 33013
id_user: 33014
id_user: 12602
id_user: 33015
id_user: 12629
id_user: 33016
id_user: 12213
id_user: 12215
id_user: 33017
id_user: 12970
id_user: 12971
id_user: 12969
id_user: 33018
id_user: 33019
id_user: 33020
id_user: 12418
id_user: 35
id_user: 33021
id_user: 33022
id_user: 33023
id_user: 33024
id_user: 12464
id_user: 12461
id_user: 12457
id_user: 12465
id_user: 12469
id_user: 33025
id_user: 33026
id_user: 33027
id_user: 33028
id_user: 33029
id_user: 32211
id_user: 33030
id_user: 33031
id_user: 12519
id_user: 33032
id_user: 33033
id_user: 33034
id_user: 33035
id_user: 38
id_user: 12917
id_user: 37
id_user: 12273
id_user: 12265
id_user: 33036
id_user: 12258
id_user: 12545
id_user: 12254
id_user: 33037
id_user: 33038
id_user: 12953
id_user: 33039
id_user: 33040
id_user: 33041
id_user: 12394
id_user: 33
id_user: 12410
id_user: 12464
id_user: 12461
id_user: 33042
id_user: 12806
id_user: 33043
id_user: 33044
id_user: 12821
id_user: 12827
id_user: 33045
id_user: 33046
id_user: 12327
id_user: 12317
id_user: 12348
id_user: 12346
id_user: 12344
id_user: 12371
id_user: 33047
id_user: 33048
id_user: 33049
id_user: 12334
id_user: 12331
id_user: 12343
id_user: 33050
id_user: 33051
id_user: 33052
id_user: 33053
id_user: 12332
id_user: 17736
id_user: 33054
id_user: 12367
id_user: 12370
id_user: 12366
id_user: 12376
id_user: 33055
id_user: 33056
id_user: 13337
id_user: 32578
id_user: 13754
id_user: 13771
id_user: 13461
id_user: 87
id_user: 13465
id_user: 33057
id_user: 13414
id_user: 13411
id_user: 13247
id_user: 13246
id_user: 13254
id_user: 33058
id_user: 32591
id_user: 33059
id_user: 33060
id_user: 33061
id_user: 13727
id_user: 13807
id_user: 13812
id_user: 33062
id_user: 12190
id_user: 13292
id_user: 13295
id_user: 13631
id_user: 12537
id_user: 13638
id_user: 13074
id_user: 13077
id_user: 13079
id_user: 12629
id_user: 13494
id_user: 13513
id_user: 13632
id_user: 14195
id_user: 112
id_user: 33063
id_user: 32132
id_user: 33064
id_user: 33065
id_user: 13101
id_user: 13106
id_user: 32577
id_user: 13840
id_user: 13847
id_user: 13871
id_user: 13874
id_user: 33066
id_user: 33067
id_user: 32530
id_user: 13189
id_user: 13380
id_user: 33068
id_user: 13377
id_user: 13921
id_user: 13924
id_user: 33069
id_user: 33070
id_user: 13134
id_user: 33071
id_user: 33072
id_user: 13213
id_user: 13238
id_user: 13160
id_user: 13163
id_user: 13166
id_user: 14169
id_user: 14162
id_user: 14171
id_user: 13696
id_user: 13699
id_user: 13692
id_user: 11497
id_user: 33073
id_user: 101
id_user: 13667
id_user: 13672
id_user: 13685
id_user: 14273
id_user: 120
id_user: 33074
id_user: 14111
id_user: 33075
id_user: 14119
id_user: 33076
id_user: 13901
id_user: 13911
id_user: 13964
id_user: 33077
id_user: 33078
id_user: 33079
id_user: 14051
id_user: 33080
id_user: 14138
id_user: 11911
id_user: 14029
id_user: 12543
id_user: 33081
id_user: 33082
id_user: 33083
id_user: 33084
id_user: 33085
id_user: 33086
id_user: 33087
id_user: 33088
id_user: 33089
id_user: 33090
id_user: 383
id_user: 33091
id_user: 13021
id_user: 12859
id_user: 19382
id_user: 14098
id_user: 14144
id_user: 33092
id_user: 14064
id_user: 14072




delete from trx_group_user where kode_group in (
'G02.4',
'G04.5',
'G05.5'
);

INSERT INTO trx_group_user (kode_group, id_user, status) VALUES
('G02.4', 198, '1'),
('G04.5', 198, '1'),
('G05.5', 198, '1'),
('G02.4', 554, '1'),
('G04.5', 554, '1'),
('G05.5', 554, '1'),
('G02.4', 32679, '1'),
('G04.5', 32679, '1'),
('G05.5', 32679, '1'),
('G02.4', 33000, '1'),
('G04.5', 33000, '1'),
('G05.5', 33000, '1'),
('G02.4', 33001, '1'),
('G04.5', 33001, '1'),
('G05.5', 33001, '1'),
('G02.4', 29, '1'),
('G04.5', 29, '1'),
('G05.5', 29, '1'),
('G02.4', 33002, '1'),
('G04.5', 33002, '1'),
('G05.5', 33002, '1'),
('G02.4', 33003, '1'),
('G04.5', 33003, '1'),
('G05.5', 33003, '1'),
('G02.4', 12656, '1'),
('G04.5', 12656, '1'),
('G05.5', 12656, '1'),
('G02.4', 31420, '1'),
('G04.5', 31420, '1'),
('G05.5', 31420, '1'),
('G02.4', 12608, '1'),
('G04.5', 12608, '1'),
('G05.5', 12608, '1'),
('G02.4', 122, '1'),
('G04.5', 122, '1'),
('G05.5', 122, '1'),
('G02.4', 33004, '1'),
('G04.5', 33004, '1'),
('G05.5', 33004, '1'),
('G02.4', 33005, '1'),
('G04.5', 33005, '1'),
('G05.5', 33005, '1'),
('G02.4', 33006, '1'),
('G04.5', 33006, '1'),
('G05.5', 33006, '1'),
('G02.4', 33007, '1'),
('G04.5', 33007, '1'),
('G05.5', 33007, '1'),
('G02.4', 12211, '1'),
('G04.5', 12211, '1'),
('G05.5', 12211, '1'),
('G02.4', 12911, '1'),
('G04.5', 12911, '1'),
('G05.5', 12911, '1'),
('G02.4', 33008, '1'),
('G04.5', 33008, '1'),
('G05.5', 33008, '1'),
('G02.4', 33009, '1'),
('G04.5', 33009, '1'),
('G05.5', 33009, '1'),
('G02.4', 12853, '1'),
('G04.5', 12853, '1'),
('G05.5', 12853, '1'),
('G02.4', 33010, '1'),
('G04.5', 33010, '1'),
('G05.5', 33010, '1'),
('G02.4', 33011, '1'),
('G04.5', 33011, '1'),
('G05.5', 33011, '1'),
('G02.4', 33012, '1'),
('G04.5', 33012, '1'),
('G05.5', 33012, '1'),
('G02.4', 12382, '1'),
('G04.5', 12382, '1'),
('G05.5', 12382, '1'),
('G02.4', 33013, '1'),
('G04.5', 33013, '1'),
('G05.5', 33013, '1'),
('G02.4', 33014, '1'),
('G04.5', 33014, '1'),
('G05.5', 33014, '1'),
('G02.4', 12602, '1'),
('G04.5', 12602, '1'),
('G05.5', 12602, '1'),
('G02.4', 33015, '1'),
('G04.5', 33015, '1'),
('G05.5', 33015, '1'),
('G02.4', 12629, '1'),
('G04.5', 12629, '1'),
('G05.5', 12629, '1'),
('G02.4', 33016, '1'),
('G04.5', 33016, '1'),
('G05.5', 33016, '1'),
('G02.4', 12213, '1'),
('G04.5', 12213, '1'),
('G05.5', 12213, '1'),
('G02.4', 12215, '1'),
('G04.5', 12215, '1'),
('G05.5', 12215, '1'),
('G02.4', 33017, '1'),
('G04.5', 33017, '1'),
('G05.5', 33017, '1'),
('G02.4', 12970, '1'),
('G04.5', 12970, '1'),
('G05.5', 12970, '1'),
('G02.4', 12971, '1'),
('G04.5', 12971, '1'),
('G05.5', 12971, '1'),
('G02.4', 12969, '1'),
('G04.5', 12969, '1'),
('G05.5', 12969, '1'),
('G02.4', 33018, '1'),
('G04.5', 33018, '1'),
('G05.5', 33018, '1'),
('G02.4', 33019, '1'),
('G04.5', 33019, '1'),
('G05.5', 33019, '1'),
('G02.4', 33020, '1'),
('G04.5', 33020, '1'),
('G05.5', 33020, '1'),
('G02.4', 12418, '1'),
('G04.5', 12418, '1'),
('G05.5', 12418, '1'),
('G02.4', 35, '1'),
('G04.5', 35, '1'),
('G05.5', 35, '1'),
('G02.4', 33021, '1'),
('G04.5', 33021, '1'),
('G05.5', 33021, '1'),
('G02.4', 33022, '1'),
('G04.5', 33022, '1'),
('G05.5', 33022, '1'),
('G02.4', 33023, '1'),
('G04.5', 33023, '1'),
('G05.5', 33023, '1'),
('G02.4', 33024, '1'),
('G04.5', 33024, '1'),
('G05.5', 33024, '1'),
('G02.4', 12464, '1'),
('G04.5', 12464, '1'),
('G05.5', 12464, '1'),
('G02.4', 12461, '1'),
('G04.5', 12461, '1'),
('G05.5', 12461, '1'),
('G02.4', 12457, '1'),
('G04.5', 12457, '1'),
('G05.5', 12457, '1'),
('G02.4', 12465, '1'),
('G04.5', 12465, '1'),
('G05.5', 12465, '1'),
('G02.4', 12469, '1'),
('G04.5', 12469, '1'),
('G05.5', 12469, '1'),
('G02.4', 33025, '1'),
('G04.5', 33025, '1'),
('G05.5', 33025, '1'),
('G02.4', 33026, '1'),
('G04.5', 33026, '1'),
('G05.5', 33026, '1'),
('G02.4', 33027, '1'),
('G04.5', 33027, '1'),
('G05.5', 33027, '1'),
('G02.4', 33028, '1'),
('G04.5', 33028, '1'),
('G05.5', 33028, '1'),
('G02.4', 33029, '1'),
('G04.5', 33029, '1'),
('G05.5', 33029, '1'),
('G02.4', 32211, '1'),
('G04.5', 32211, '1'),
('G05.5', 32211, '1'),
('G02.4', 33030, '1'),
('G04.5', 33030, '1'),
('G05.5', 33030, '1'),
('G02.4', 33031, '1'),
('G04.5', 33031, '1'),
('G05.5', 33031, '1'),
('G02.4', 12519, '1'),
('G04.5', 12519, '1'),
('G05.5', 12519, '1'),
('G02.4', 33032, '1'),
('G04.5', 33032, '1'),
('G05.5', 33032, '1'),
('G02.4', 33033, '1'),
('G04.5', 33033, '1'),
('G05.5', 33033, '1'),
('G02.4', 33034, '1'),
('G04.5', 33034, '1'),
('G05.5', 33034, '1'),
('G02.4', 33035, '1'),
('G04.5', 33035, '1'),
('G05.5', 33035, '1'),
('G02.4', 38, '1'),
('G04.5', 38, '1'),
('G05.5', 38, '1'),
('G02.4', 12917, '1'),
('G04.5', 12917, '1'),
('G05.5', 12917, '1'),
('G02.4', 37, '1'),
('G04.5', 37, '1'),
('G05.5', 37, '1'),
('G02.4', 12273, '1'),
('G04.5', 12273, '1'),
('G05.5', 12273, '1'),
('G02.4', 12265, '1'),
('G04.5', 12265, '1'),
('G05.5', 12265, '1'),
('G02.4', 33036, '1'),
('G04.5', 33036, '1'),
('G05.5', 33036, '1'),
('G02.4', 12258, '1'),
('G04.5', 12258, '1'),
('G05.5', 12258, '1'),
('G02.4', 12545, '1'),
('G04.5', 12545, '1'),
('G05.5', 12545, '1'),
('G02.4', 12254, '1'),
('G04.5', 12254, '1'),
('G05.5', 12254, '1'),
('G02.4', 33037, '1'),
('G04.5', 33037, '1'),
('G05.5', 33037, '1'),
('G02.4', 33038, '1'),
('G04.5', 33038, '1'),
('G05.5', 33038, '1'),
('G02.4', 12953, '1'),
('G04.5', 12953, '1'),
('G05.5', 12953, '1'),
('G02.4', 33039, '1'),
('G04.5', 33039, '1'),
('G05.5', 33039, '1'),
('G02.4', 33040, '1'),
('G04.5', 33040, '1'),
('G05.5', 33040, '1'),
('G02.4', 33041, '1'),
('G04.5', 33041, '1'),
('G05.5', 33041, '1'),
('G02.4', 12394, '1'),
('G04.5', 12394, '1'),
('G05.5', 12394, '1'),
('G02.4', 33, '1'),
('G04.5', 33, '1'),
('G05.5', 33, '1'),
('G02.4', 12410, '1'),
('G04.5', 12410, '1'),
('G05.5', 12410, '1'),
('G02.4', 33042, '1'),
('G04.5', 33042, '1'),
('G05.5', 33042, '1'),
('G02.4', 12806, '1'),
('G04.5', 12806, '1'),
('G05.5', 12806, '1'),
('G02.4', 33043, '1'),
('G04.5', 33043, '1'),
('G05.5', 33043, '1'),
('G02.4', 33044, '1'),
('G04.5', 33044, '1'),
('G05.5', 33044, '1'),
('G02.4', 12821, '1'),
('G04.5', 12821, '1'),
('G05.5', 12821, '1'),
('G02.4', 12827, '1'),
('G04.5', 12827, '1'),
('G05.5', 12827, '1'),
('G02.4', 33045, '1'),
('G04.5', 33045, '1'),
('G05.5', 33045, '1'),
('G02.4', 33046, '1'),
('G04.5', 33046, '1'),
('G05.5', 33046, '1'),
('G02.4', 12327, '1'),
('G04.5', 12327, '1'),
('G05.5', 12327, '1'),
('G02.4', 12317, '1'),
('G04.5', 12317, '1'),
('G05.5', 12317, '1'),
('G02.4', 12348, '1'),
('G04.5', 12348, '1'),
('G05.5', 12348, '1'),
('G02.4', 12346, '1'),
('G04.5', 12346, '1'),
('G05.5', 12346, '1'),
('G02.4', 12344, '1'),
('G04.5', 12344, '1'),
('G05.5', 12344, '1'),
('G02.4', 12371, '1'),
('G04.5', 12371, '1'),
('G05.5', 12371, '1'),
('G02.4', 33047, '1'),
('G04.5', 33047, '1'),
('G05.5', 33047, '1'),
('G02.4', 33048, '1'),
('G04.5', 33048, '1'),
('G05.5', 33048, '1'),
('G02.4', 33049, '1'),
('G04.5', 33049, '1'),
('G05.5', 33049, '1'),
('G02.4', 12334, '1'),
('G04.5', 12334, '1'),
('G05.5', 12334, '1'),
('G02.4', 12331, '1'),
('G04.5', 12331, '1'),
('G05.5', 12331, '1'),
('G02.4', 12343, '1'),
('G04.5', 12343, '1'),
('G05.5', 12343, '1'),
('G02.4', 33050, '1'),
('G04.5', 33050, '1'),
('G05.5', 33050, '1'),
('G02.4', 33051, '1'),
('G04.5', 33051, '1'),
('G05.5', 33051, '1'),
('G02.4', 33052, '1'),
('G04.5', 33052, '1'),
('G05.5', 33052, '1'),
('G02.4', 33053, '1'),
('G04.5', 33053, '1'),
('G05.5', 33053, '1'),
('G02.4', 12332, '1'),
('G04.5', 12332, '1'),
('G05.5', 12332, '1'),
('G02.4', 17736, '1'),
('G04.5', 17736, '1'),
('G05.5', 17736, '1'),
('G02.4', 33054, '1'),
('G04.5', 33054, '1'),
('G05.5', 33054, '1'),
('G02.4', 12367, '1'),
('G04.5', 12367, '1'),
('G05.5', 12367, '1'),
('G02.4', 12370, '1'),
('G04.5', 12370, '1'),
('G05.5', 12370, '1'),
('G02.4', 12366, '1'),
('G04.5', 12366, '1'),
('G05.5', 12366, '1'),
('G02.4', 12376, '1'),
('G04.5', 12376, '1'),
('G05.5', 12376, '1'),
('G02.4', 33055, '1'),
('G04.5', 33055, '1'),
('G05.5', 33055, '1'),
('G02.4', 33056, '1'),
('G04.5', 33056, '1'),
('G05.5', 33056, '1'),
('G02.4', 13337, '1'),
('G04.5', 13337, '1'),
('G05.5', 13337, '1'),
('G02.4', 32578, '1'),
('G04.5', 32578, '1'),
('G05.5', 32578, '1'),
('G02.4', 13754, '1'),
('G04.5', 13754, '1'),
('G05.5', 13754, '1'),
('G02.4', 13771, '1'),
('G04.5', 13771, '1'),
('G05.5', 13771, '1'),
('G02.4', 13461, '1'),
('G04.5', 13461, '1'),
('G05.5', 13461, '1'),
('G02.4', 87, '1'),
('G04.5', 87, '1'),
('G05.5', 87, '1'),
('G02.4', 13465, '1'),
('G04.5', 13465, '1'),
('G05.5', 13465, '1'),
('G02.4', 33057, '1'),
('G04.5', 33057, '1'),
('G05.5', 33057, '1'),
('G02.4', 13414, '1'),
('G04.5', 13414, '1'),
('G05.5', 13414, '1'),
('G02.4', 13411, '1'),
('G04.5', 13411, '1'),
('G05.5', 13411, '1'),
('G02.4', 13247, '1'),
('G04.5', 13247, '1'),
('G05.5', 13247, '1'),
('G02.4', 13246, '1'),
('G04.5', 13246, '1'),
('G05.5', 13246, '1'),
('G02.4', 13254, '1'),
('G04.5', 13254, '1'),
('G05.5', 13254, '1'),
('G02.4', 33058, '1'),
('G04.5', 33058, '1'),
('G05.5', 33058, '1'),
('G02.4', 32591, '1'),
('G04.5', 32591, '1'),
('G05.5', 32591, '1'),
('G02.4', 33059, '1'),
('G04.5', 33059, '1'),
('G05.5', 33059, '1'),
('G02.4', 33060, '1'),
('G04.5', 33060, '1'),
('G05.5', 33060, '1'),
('G02.4', 33061, '1'),
('G04.5', 33061, '1'),
('G05.5', 33061, '1'),
('G02.4', 13727, '1'),
('G04.5', 13727, '1'),
('G05.5', 13727, '1'),
('G02.4', 13807, '1'),
('G04.5', 13807, '1'),
('G05.5', 13807, '1'),
('G02.4', 13812, '1'),
('G04.5', 13812, '1'),
('G05.5', 13812, '1'),
('G02.4', 33062, '1'),
('G04.5', 33062, '1'),
('G05.5', 33062, '1'),
('G02.4', 12190, '1'),
('G04.5', 12190, '1'),
('G05.5', 12190, '1'),
('G02.4', 13292, '1'),
('G04.5', 13292, '1'),
('G05.5', 13292, '1'),
('G02.4', 13295, '1'),
('G04.5', 13295, '1'),
('G05.5', 13295, '1'),
('G02.4', 13631, '1'),
('G04.5', 13631, '1'),
('G05.5', 13631, '1'),
('G02.4', 12537, '1'),
('G04.5', 12537, '1'),
('G05.5', 12537, '1'),
('G02.4', 13638, '1'),
('G04.5', 13638, '1'),
('G05.5', 13638, '1'),
('G02.4', 13074, '1'),
('G04.5', 13074, '1'),
('G05.5', 13074, '1'),
('G02.4', 13077, '1'),
('G04.5', 13077, '1'),
('G05.5', 13077, '1'),
('G02.4', 13079, '1'),
('G04.5', 13079, '1'),
('G05.5', 13079, '1'),
('G02.4', 13494, '1'),
('G04.5', 13494, '1'),
('G05.5', 13494, '1'),
('G02.4', 13513, '1'),
('G04.5', 13513, '1'),
('G05.5', 13513, '1'),
('G02.4', 13632, '1'),
('G04.5', 13632, '1'),
('G05.5', 13632, '1'),
('G02.4', 14195, '1'),
('G04.5', 14195, '1'),
('G05.5', 14195, '1'),
('G02.4', 112, '1'),
('G04.5', 112, '1'),
('G05.5', 112, '1'),
('G02.4', 33063, '1'),
('G04.5', 33063, '1'),
('G05.5', 33063, '1'),
('G02.4', 32132, '1'),
('G04.5', 32132, '1'),
('G05.5', 32132, '1'),
('G02.4', 33064, '1'),
('G04.5', 33064, '1'),
('G05.5', 33064, '1'),
('G02.4', 33065, '1'),
('G04.5', 33065, '1'),
('G05.5', 33065, '1'),
('G02.4', 13101, '1'),
('G04.5', 13101, '1'),
('G05.5', 13101, '1'),
('G02.4', 13106, '1'),
('G04.5', 13106, '1'),
('G05.5', 13106, '1'),
('G02.4', 32577, '1'),
('G04.5', 32577, '1'),
('G05.5', 32577, '1'),
('G02.4', 13840, '1'),
('G04.5', 13840, '1'),
('G05.5', 13840, '1'),
('G02.4', 13847, '1'),
('G04.5', 13847, '1'),
('G05.5', 13847, '1'),
('G02.4', 13871, '1'),
('G04.5', 13871, '1'),
('G05.5', 13871, '1'),
('G02.4', 13874, '1'),
('G04.5', 13874, '1'),
('G05.5', 13874, '1'),
('G02.4', 33066, '1'),
('G04.5', 33066, '1'),
('G05.5', 33066, '1'),
('G02.4', 33067, '1'),
('G04.5', 33067, '1'),
('G05.5', 33067, '1'),
('G02.4', 32530, '1'),
('G04.5', 32530, '1'),
('G05.5', 32530, '1'),
('G02.4', 13189, '1'),
('G04.5', 13189, '1'),
('G05.5', 13189, '1'),
('G02.4', 13380, '1'),
('G04.5', 13380, '1'),
('G05.5', 13380, '1'),
('G02.4', 33068, '1'),
('G04.5', 33068, '1'),
('G05.5', 33068, '1'),
('G02.4', 13377, '1'),
('G04.5', 13377, '1'),
('G05.5', 13377, '1'),
('G02.4', 13921, '1'),
('G04.5', 13921, '1'),
('G05.5', 13921, '1'),
('G02.4', 13924, '1'),
('G04.5', 13924, '1'),
('G05.5', 13924, '1'),
('G02.4', 33069, '1'),
('G04.5', 33069, '1'),
('G05.5', 33069, '1'),
('G02.4', 33070, '1'),
('G04.5', 33070, '1'),
('G05.5', 33070, '1'),
('G02.4', 13134, '1'),
('G04.5', 13134, '1'),
('G05.5', 13134, '1'),
('G02.4', 33071, '1'),
('G04.5', 33071, '1'),
('G05.5', 33071, '1'),
('G02.4', 33072, '1'),
('G04.5', 33072, '1'),
('G05.5', 33072, '1'),
('G02.4', 13213, '1'),
('G04.5', 13213, '1'),
('G05.5', 13213, '1'),
('G02.4', 13238, '1'),
('G04.5', 13238, '1'),
('G05.5', 13238, '1'),
('G02.4', 13160, '1'),
('G04.5', 13160, '1'),
('G05.5', 13160, '1'),
('G02.4', 13163, '1'),
('G04.5', 13163, '1'),
('G05.5', 13163, '1'),
('G02.4', 13166, '1'),
('G04.5', 13166, '1'),
('G05.5', 13166, '1'),
('G02.4', 14169, '1'),
('G04.5', 14169, '1'),
('G05.5', 14169, '1'),
('G02.4', 14162, '1'),
('G04.5', 14162, '1'),
('G05.5', 14162, '1'),
('G02.4', 14171, '1'),
('G04.5', 14171, '1'),
('G05.5', 14171, '1'),
('G02.4', 13696, '1'),
('G04.5', 13696, '1'),
('G05.5', 13696, '1'),
('G02.4', 13699, '1'),
('G04.5', 13699, '1'),
('G05.5', 13699, '1'),
('G02.4', 13692, '1'),
('G04.5', 13692, '1'),
('G05.5', 13692, '1'),
('G02.4', 11497, '1'),
('G04.5', 11497, '1'),
('G05.5', 11497, '1'),
('G02.4', 33073, '1'),
('G04.5', 33073, '1'),
('G05.5', 33073, '1'),
('G02.4', 101, '1'),
('G04.5', 101, '1'),
('G05.5', 101, '1'),
('G02.4', 13667, '1'),
('G04.5', 13667, '1'),
('G05.5', 13667, '1'),
('G02.4', 13672, '1'),
('G04.5', 13672, '1'),
('G05.5', 13672, '1'),
('G02.4', 13685, '1'),
('G04.5', 13685, '1'),
('G05.5', 13685, '1'),
('G02.4', 14273, '1'),
('G04.5', 14273, '1'),
('G05.5', 14273, '1'),
('G02.4', 120, '1'),
('G04.5', 120, '1'),
('G05.5', 120, '1'),
('G02.4', 33074, '1'),
('G04.5', 33074, '1'),
('G05.5', 33074, '1'),
('G02.4', 14111, '1'),
('G04.5', 14111, '1'),
('G05.5', 14111, '1'),
('G02.4', 33075, '1'),
('G04.5', 33075, '1'),
('G05.5', 33075, '1'),
('G02.4', 14119, '1'),
('G04.5', 14119, '1'),
('G05.5', 14119, '1'),
('G02.4', 33076, '1'),
('G04.5', 33076, '1'),
('G05.5', 33076, '1'),
('G02.4', 13901, '1'),
('G04.5', 13901, '1'),
('G05.5', 13901, '1'),
('G02.4', 13911, '1'),
('G04.5', 13911, '1'),
('G05.5', 13911, '1'),
('G02.4', 13964, '1'),
('G04.5', 13964, '1'),
('G05.5', 13964, '1'),
('G02.4', 33077, '1'),
('G04.5', 33077, '1'),
('G05.5', 33077, '1'),
('G02.4', 33078, '1'),
('G04.5', 33078, '1'),
('G05.5', 33078, '1'),
('G02.4', 33079, '1'),
('G04.5', 33079, '1'),
('G05.5', 33079, '1'),
('G02.4', 14051, '1'),
('G04.5', 14051, '1'),
('G05.5', 14051, '1'),
('G02.4', 33080, '1'),
('G04.5', 33080, '1'),
('G05.5', 33080, '1'),
('G02.4', 14138, '1'),
('G04.5', 14138, '1'),
('G05.5', 14138, '1'),
('G02.4', 11911, '1'),
('G04.5', 11911, '1'),
('G05.5', 11911, '1'),
('G02.4', 14029, '1'),
('G04.5', 14029, '1'),
('G05.5', 14029, '1'),
('G02.4', 12543, '1'),
('G04.5', 12543, '1'),
('G05.5', 12543, '1'),
('G02.4', 33081, '1'),
('G04.5', 33081, '1'),
('G05.5', 33081, '1'),
('G02.4', 33082, '1'),
('G04.5', 33082, '1'),
('G05.5', 33082, '1'),
('G02.4', 33083, '1'),
('G04.5', 33083, '1'),
('G05.5', 33083, '1'),
('G02.4', 33084, '1'),
('G04.5', 33084, '1'),
('G05.5', 33084, '1'),
('G02.4', 33085, '1'),
('G04.5', 33085, '1'),
('G05.5', 33085, '1'),
('G02.4', 33086, '1'),
('G04.5', 33086, '1'),
('G05.5', 33086, '1'),
('G02.4', 33087, '1'),
('G04.5', 33087, '1'),
('G05.5', 33087, '1'),
('G02.4', 33088, '1'),
('G04.5', 33088, '1'),
('G05.5', 33088, '1'),
('G02.4', 33089, '1'),
('G04.5', 33089, '1'),
('G05.5', 33089, '1'),
('G02.4', 33090, '1'),
('G04.5', 33090, '1'),
('G05.5', 33090, '1'),
('G02.4', 383, '1'),
('G04.5', 383, '1'),
('G05.5', 383, '1'),
('G02.4', 33091, '1'),
('G04.5', 33091, '1'),
('G05.5', 33091, '1'),
('G02.4', 13021, '1'),
('G04.5', 13021, '1'),
('G05.5', 13021, '1'),
('G02.4', 12859, '1'),
('G04.5', 12859, '1'),
('G05.5', 12859, '1'),
('G02.4', 19382, '1'),
('G04.5', 19382, '1'),
('G05.5', 19382, '1'),
('G02.4', 14098, '1'),
('G04.5', 14098, '1'),
('G05.5', 14098, '1'),
('G02.4', 14144, '1'),
('G04.5', 14144, '1'),
('G05.5', 14144, '1'),
('G02.4', 33092, '1'),
('G04.5', 33092, '1'),
('G05.5', 33092, '1'),
('G02.4', 14064, '1'),
('G04.5', 14064, '1'),
('G05.5', 14064, '1'),
('G02.4', 14072, '1'),
('G04.5', 14072, '1'),
('G05.5', 14072, '1'),
('G02.4', 33093, '1'),
('G04.5', 33093, '1'),
('G05.5', 33093, '1');

