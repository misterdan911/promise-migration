-- ref_user

-- 1. Field email di index karena sering dipakai untuk pengecekan login
CREATE INDEX idx_ref_user_email ON ref_user(email);

-- 2. Field token di index karena sering dipakai untuk pengecekan
CREATE INDEX idx_ref_user_api_token ON ref_user(api_token) 
WHERE api_token IS NOT NULL;

-- 3. status user di index karena pasti di cek
CREATE INDEX idx_ref_user_status ON ref_user(status_user);



-- ref_user_internal
-- id_user
CREATE INDEX idx_ref_user_internal_id_user 
ON ref_user_internal (id_user);

-- Username
CREATE INDEX idx_ref_user_internal_username 
ON ref_user_internal (username);

-- NIP
CREATE INDEX idx_ref_user_internal_nip 
ON ref_user_internal (nip);


-- ref_user_external
-- id_user
CREATE INDEX idx_ref_user_external_id_user 
ON ref_user_external (id_user);

-- username
CREATE INDEX idx_ref_user_external_username 
ON ref_user_external (username);

-- Status filter index (for filtering by user status)
CREATE INDEX idx_ref_user_external_status 
ON ref_user_external (status_pengguna);






-- ref_akses_aplikasi_eksternal (data cuma sedikit)

-- ref_jabatan (PK sudah otomatis di-index)

-- ref_jabatan_struktural (PK sudah otomatis di-index)

-- ref_jabatan_struktural_sub (Data kosong)

-- ref_jenis_pengadaan (PK sudah otomatis di-index)

-- ref_kat_metode (data cuma sedikit)

-- ref_ket_pertor (data cuma sedikit)

-- ref_level (PK sudah otomatis di-index)

-- ref_metode_pengadaan (data cuma sedikit)

-- ref_token_app
CREATE INDEX idx_token_app_id_user ON ref_token_app(id_user);
CREATE INDEX idx_token_app_kode_group ON ref_token_app(kode_group);
CREATE INDEX idx_token_app_token ON ref_token_app(token);
CREATE INDEX idx_token_app_user_group ON ref_token_app(id_user, kode_group);

-- ref_unit_pbj (already has PK on kode_unit_pbj)
CREATE INDEX idx_unit_pbj_kode_unit ON ref_unit_pbj(kode_unit);
CREATE INDEX idx_unit_pbj_kode_pbj ON ref_unit_pbj(kode_pbj);

-- trx_jabatan_struktural (data kosong)

-- ref_aplikasi
CREATE INDEX idx_aplikasi_nama_aplikasi ON ref_aplikasi(nama_aplikasi);
CREATE INDEX idx_aplikasi_kode_metode ON ref_aplikasi(kode_metode_pengadaan);
CREATE INDEX idx_aplikasi_status ON ref_aplikasi(status);

-- ref_group
CREATE INDEX idx_group_kode_aplikasi ON ref_group(kode_aplikasi);
CREATE INDEX idx_group_kode_level ON ref_group(kode_level);
CREATE INDEX idx_group_kode_jabatan ON ref_group(kode_jabatan);

-- ref_menu1
CREATE INDEX idx_menu1_kode_aplikasi ON ref_menu1(kode_aplikasi);
CREATE INDEX idx_menu1_kode_level ON ref_menu1(kode_level);
CREATE INDEX idx_menu1_status ON ref_menu1(status);

-- ref_menu2
CREATE INDEX idx_menu2_kode_aplikasi ON ref_menu2(kode_aplikasi);
CREATE INDEX idx_menu2_status ON ref_menu2(status);

-- ref_menu3 (data kosong)

-- ref_threeshold
CREATE INDEX idx_threeshold_min_max ON ref_threeshold(nilai_min, nilai_max);

-- trx_group_menu
CREATE INDEX idx_group_menu_kode_group ON trx_group_menu(kode_group);
CREATE INDEX idx_group_menu_akses ON trx_group_menu(akses);

-- trx_user_tampung
CREATE INDEX idx_user_tampung_email ON trx_user_tampung(email);
CREATE INDEX idx_user_tampung_status ON trx_user_tampung(status_aktif);

-- trx_group_user
CREATE INDEX idx_group_user_id_user ON trx_group_user(id_user);
CREATE INDEX idx_group_user_status ON trx_group_user(status);
