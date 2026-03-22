-- use excel
="INSERT INTO trx_group_user (kode_group,id_user, status) VALUES ('"&D8&"', "&E8&", '"&F8&"');"











select ru.email, tgu.* from trx_group_user tgu
left join ref_user ru on ru.id = tgu.id_user
where id_user in (198,
401,
10195,
11494,
16408,
16494,
31772,
31973,
32728)
order by id_user;


select * from trx_user_tampung where email in ('dholy78@gmail.com',
'yusuffadilah58@gmail.com',
'ariefrs@ecampus.ut.ac.id',
'ihrom-lestari@ecampus.ut.ac.id',
'hobashitataketama@yahoo.co.id',
'irgyrflda@gmail.com',
'dciptadi@gmail.com',
'madkhan@ecampus.ut.ac.id',
'irgyr@ecampus.ut.ac.id')
order by email
;