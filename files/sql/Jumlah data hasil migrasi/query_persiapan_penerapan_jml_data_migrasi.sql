-- data RUP hingga tanggal 9 maret 2026
select count(*) as total_rup from ref_rup;


-- data penyedia DPT Badan usaha sampai dengan 6 Jan 2026
select count(kode_vendor) as jml from ref_vendor
where
kode_vendor in (select kode_vendor from trx_vendor_penjr tvp where status_dpt = 'terpilih')
-- and kode_vendor < 32513
and kode_jenis_vendor = 1;


-- data penyedia DPT Perorangan sampai dengan 6 Jan 2026
select count(kode_vendor) as jml from ref_vendor
where
-- and kode_vendor < 32513
kode_vendor in (select kode_vendor from trx_vendor_penjr tvp where status_dpt = 'terpilih')
and kode_jenis_vendor = 2;


-- data penyedia luar DPT Badan usaha  sampai dengan 6 jan 2026
select count(kode_vendor) as jml from ref_vendor
where
kode_vendor not in (select kode_vendor from trx_vendor_penjr tvp where status_dpt = 'terpilih')
-- and kode_vendor < 32513
and kode_jenis_vendor = 1;

-- data penyedia luar DPT Perorangan  sampai dengan 6 jan 2026
select count(kode_vendor) as jml from ref_vendor
where
kode_vendor not in (select kode_vendor from trx_vendor_penjr tvp where status_dpt = 'terpilih')
-- and kode_vendor < 32513
and kode_jenis_vendor = 2;

-- data paket hingga 7 Jan 2026
select count(*) as jml from ref_permintaan rp where rp.kode_permintaan < 7641;

-- data paket hingga 13 Jan 2026
select count(*) as jml from ref_permintaan rp where rp.kode_permintaan < 1259;
