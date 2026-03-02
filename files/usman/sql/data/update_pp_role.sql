DELETE FROM trx_group_user WHERE id_user = (SELECT id FROM ref_user WHERE email = 'adrian@ecampus.ut.ac.id');
DELETE FROM trx_user_tampung WHERE email = 'adrian@ecampus.ut.ac.id';
