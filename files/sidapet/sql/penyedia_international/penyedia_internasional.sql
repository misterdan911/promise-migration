

DROP TYPE status_pengajuan_penjaringan_international;
CREATE TYPE status_pengajuan_penjaringan_international AS ENUM (
	'draft',
	'pengajuan',
	'diterima',
	'ditolak'
);

draft,pengajuan,diterima,ditolak


-- status_pengisian
selesai
belum

drop type if exists status_pengisian_data_internasional;
CREATE TYPE status_pengisian_data_internasional AS ENUM (
	'selesai',
	'belum'
);











ALTER TABLE public.tbl_internasional_legal_document DROP CONSTRAINT tbl_internasional_legal_document_id_penyedia_internasional_fkey;

drop table if exists tbl_penyedia_internasional;

CREATE TABLE public.tbl_penyedia_internasional (
	id_penyedia_internasional serial PRIMARY KEY,
	kode_vendor int8 NULL,
	company_name varchar(255) NULL,
	telephone varchar(255) NULL,
	fax varchar(255) NULL,
	mailing_address varchar(255) NULL,
	email varchar(255) NULL,
	website varchar(255) NULL,
	contact_name varchar(255) NULL,
	contact_title varchar(255) DEFAULT NULL::character varying NULL,
	contact_email varchar(255) NULL,
	contact_phone varchar(255) NULL,
	contact_phone2 varchar(255) DEFAULT NULL::character varying NULL,
	overview_general text NULL,
	overview_date_company date NULL,
	overview_date_company_old text NULL,
	overview_gross_annual_sales text NULL,
	overview_geographic_service_area text NULL,
	overview_legal_structure text NULL,
	overview_business_type text NULL,
	overview_years_registered int4,
	overview_years_registered_old text NULL,
	overview_insured varchar(10) DEFAULT NULL::character varying NULL,
	overview_bonded varchar(10) DEFAULT NULL::character varying NULL,
	overview_licensed varchar(10) DEFAULT NULL::character varying NULL,
	overview_license_number varchar(255) NULL,
	overview_additional_info text NULL,
	bank_name varchar(255) NULL,
	bank_beneficiary_name varchar(255) NULL,
	bank_account_name varchar(255) NULL,
	bank_address varchar(255) NULL,
	certification_name varchar(255) NULL,
	certification_signature varchar(255) NULL,
	certification_title varchar(255) NULL,
	certification_date date NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz NULL,
	status_pengisian public.status_pengisian_data_internasional DEFAULT 'belum'::status_pengisian_data_internasional NULL,
	"password" varchar(100) NULL,
	status_verifikasi public.status_verifikasi_penyedia_internasional NULL,
	kode_undangan int4 NULL
);

INSERT INTO "public"."tbl_penyedia_internasional" ("id_penyedia_internasional", "kode_vendor", "company_name", "telephone", "fax", "mailing_address", "email", "website", "contact_name", "contact_title", "contact_email", "contact_phone", "contact_phone2", "overview_general", "overview_date_company", "overview_date_company_old", "overview_gross_annual_sales", "overview_geographic_service_area", "overview_legal_structure", "overview_business_type", "overview_years_registered_old", "overview_insured", "overview_bonded", "overview_licensed", "overview_license_number", "overview_additional_info", "bank_name", "bank_beneficiary_name", "bank_account_name", "bank_address", "certification_name", "certification_signature", "certification_title", "certification_date", "created_at", "updated_at", "status_pengisian", "password", "status_verifikasi", "kode_undangan", "overview_years_registered") VALUES
(2, 11624, 'edX, LLC.', '+1 (617)-324-7059', 'N/A', '7900 Harkins Rd., Lanham, MD 20706, USA', 'collections@edx.org', 'www.edx.org', 'Peter Brau, VP of Finance', NULL, 'accounting@edx.org', '+1 (617)-324-7059', NULL, 'edX is a massive open online course (MOOC) provider, with MOOCs available on our platform at www.edx.org', '2012-08-13', '8/13/2012', '$65 million', 'Global', 'Other Tax Exempt Entity Under IRS Section 501 (c)(3)', 'edX Inc. is a Massachusetts (USA) non-profit corporation', 'N/A', 'insured', NULL, 'licensed', '46-0807740', NULL, 'Silicon Valley Bank', 'EDX', 'edX L.L.C', '7900 Harkins Rd., Lanham, MD 20706, USA', '', '', '', NULL, '2021-05-25 21:06:23+00', '2024-03-19 01:45:39+00', 'selesai', NULL, NULL, NULL, NULL),
(3, 11779, 'PT. TIGA KREASI SOLUTION', '021 82415391', '021 82415391', 'PERUMAHAN VILA NUSA INDAH 3 KB 3/1, BOJONG KULUR, GUNUNG PUTRI, KAB BOGOR', 'reinaldi@3k-solution.net', 'WWW.3K-SOLUTION.NET', 'REINALDI', NULL, 'REINALDI@3K-SOLUTION.NET', '021 82415391', NULL, 'IT SUPPLIER', '2015-06-03', '03 JUNI 2015', '2.500.000.000', 'ALL INDONESIA AREAS', 'PT', 'VENDOR IT', '6', 'insured', 'bonded', 'licensed', '4', NULL, 'BNI 46', 'TIGA KREASI SOLUTION', '1790001709', 'CABANG SENAYAN', '', '', '', NULL, '2021-07-26 07:57:36+00', '2021-07-26 07:57:36+00', 'selesai', NULL, NULL, NULL, NULL),
(5, 17273, 'Coursera, Inc.', '1(650) 963-9884', '(650) 265-2681', '381 E. Evelyn Ave., Mountain View, CA 94041', 'msatini@coursera.org', 'https://about.coursera.org/', 'Shah Satini / Account Director', NULL, 'msatini@coursera.org', '+6597334464', NULL, 'Coursera partners with more than 275 leading universities and companies to bring flexible, affordable, job-relevant online learning to individuals and organizations worldwide. We offer a range of learning opportunitiesÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Âfrom hands-on projects and courses to job-ready certificates and degree programs.', '2011-10-07', '10/7/2011', 'USD500,000,000', 'Global', '-', 'Edutech', '2022', NULL, NULL, 'licensed', '45-3560292', '-', 'Bank of America, N.A.', 'Coursera, Inc.', '1416817930', '222 broadway, New York, NY 10038', '', '', '', NULL, '2022-09-21 07:24:35+00', '2024-02-23 08:12:02+00', 'selesai', NULL, NULL, NULL, 2022),
(6, 17392, 'International Council for Open and Distance Education (ICDE)', '+47 22 06 26 32', 'N/A', 'MBE 132, Postboks 1 Youngstorget, 0028 Oslo, Norway', 'icde@icde.org', 'www.icde.org', 'Torunn Gjelsvik, Secretary General', NULL, 'gjelsvik@icde.org', '+47 40 43 23 97', NULL, 'ICDE Quality Review Service 2023. First instalment for QRS 2023.', NULL, '1938', 'NOK 5,944,889', 'Global', 'Non-governmental organisation', 'Non-profit NGO', 'N/A', 'insured', NULL, NULL, 'NO971286512', NULL, 'DNB Bank ASA', 'International Council for Open and Distance Education', 'IBAN NO9571010538070, SWIFT DNBANOKKXXX', 'DNB, Postboks 1600 Sentrum, 0021 Oslo, Norway', '', '', '', NULL, '2022-10-25 11:29:40+00', '2022-10-25 11:29:40+00', 'selesai', NULL, NULL, NULL, NULL),
(7, 17406, 'PT.Mega Akses Persda (Fiberstar)', '021-80621200', '021-80621299', 'Cyber 2 Tower Lt. 3. Jl. H. R. Rasuna Said. Blok X-5 No. 13. Jakarta Selatan 12950. Indonesia', 'aris.hidayat@fiberstar.co.id', 'www.fiberstar.co.id', 'Account Manager Of Government', NULL, 'aris.hidayat@fiberstar.co.id', '082122746869', NULL, 'Penyedia jasa layanan internet & Telekomunikasi', '2014-02-04', '04 Februari 2014', '2.136.862.452.530', 'Nasional', 'Komisaris', 'Jasa Pnyedia Layanan internet & Telekomunikasi', '28 Desember 2017', NULL, NULL, 'licensed', 'nomor 1265 tahun 2017', 'Izin NAP Nomor 29/TEL.02.02/2018', 'Bank Negara Indonesia ( BNI)', 'PT,Mega Akses Persada', '715916216', 'Jakarta Barat, DKI Jakarta', '', '', '', NULL, '2022-11-22 03:56:34+00', '2022-11-22 03:56:34+00', 'selesai', NULL, NULL, NULL, 2017),
(8, 17549, 'FIBAA - Foundation for International Business Administration Accreditation', '00492282803560', '004922828035620', 'international@fibaa.org^', 'international@fibaa.org', 'www.fibaa.org', 'Martin Rockenfeller', NULL, 'rockenfeller@fibaa.org', '004922828035635', NULL, 'International accreditation of study programmes and Higher educational entities', '1987-08-14', '14.08.1987', '1.889.664 Euro', 'Worldwide', 'Swiss Foundation', 'Accreditation agency', '0', NULL, NULL, NULL, '020.7.901.317-3', 'Swiss Register Zurich', 'Deutsche Bank Bonn', 'Foundation for International Business Administration Accreditation (FIBAA)', 'FIBAA', 'Kaiserplatz 7-9, 53113 Bonn', '', '', '', NULL, '2022-12-07 13:57:36+00', '2023-04-28 08:32:55+00', 'selesai', NULL, NULL, NULL, NULL),
(9, 17556, 'PT. Mitra Buana Koorporindo', '(021) 2957 9567', '(021) 2957 9568/69', 'Ketapang Business Center Blok B.10-11 Jalan KH Zainul Arifin No.20 Jakarta Barat 11140', 'adm.sales@mbk.co.id', 'https://wwwmbk.co.id', 'Ahmad Rianto', 'Business Development Manager', 'ahmad.rianto@mbk.co.id', '0856 7761 987', NULL, 'system integrator', '2007-02-13', '13 Februari 2007', '69.603.218.687', 'Sabang sampai Maroke', 'Hukum', 'System Integrator', '2007', NULL, 'bonded', NULL, '-', '-', 'Bank UOB Indonesia', 'PT. Mitra Buana Koorporindo', '3273008878', 'Head Office UOB Plaza Jalan M.H Thamrin No.10 Jakarta 10230', '', '', '', NULL, '2022-12-13 08:53:34+00', '2023-07-26 05:00:00+00', 'selesai', NULL, NULL, NULL, 2007),
(10, 17564, 'PT. ROMEO BRAVO KILO INDONESIA', '02159664506', '02159664500', 'Jl. Citra Boulevard Ruko Garden Boulevard Blok S-2 no.160 Citra Raya Tangerang - Banten', 'admin@romeobravokiloindonesia.com', 'romeobravokiloindonesia.com', 'ROBIN SAPUTRA', 'DIREKTUR', 'robin@romeobravokiloindonesia.com', '083111126000', '081285010725', 'MEKANIKAL ELEKTRIKAL, FIRE FIGHTING SYSTEM, IT SOLUTION', '2020-07-08', '08 JULI 2020', '1O BILLIONS', 'TANGERANG BANTEN', 'PERSEROAN', 'GENERAL CONTRACTOR', '2', NULL, NULL, NULL, '9120502811153', NULL, 'MANDIRI', 'PT. ROMEO BRAVO KILO INDONESIA', '1240010712744', 'CABANG LAPANGAN ROS', '', '', '', NULL, '2022-12-14 11:29:36+00', '2022-12-14 11:33:15+00', 'selesai', NULL, NULL, NULL, NULL),
(11, 17640, 'PT. POLA MITRA JAYA', '02129486581', '02129486581', 'Komplek Rukan Taman Pondok Kelapa Blok J No. 1, Jl Raya Pondok Kelapa Jakarta Timur', 'pama_const@yahoo.co.id', '-', 'Ir Bambang wahyudi', NULL, 'pama_const@yahoo.co.id', '081253793999', NULL, 'Akta Pendirian', '1999-09-27', '27 September 1999', '8079643708', 'Republik Indonesia', 'Akta Perubahan', 'Jasa Konstruksi', '1999', NULL, NULL, NULL, '01.920.658.0-008.000', NULL, 'PT. BANK RAKYAT INDONESIA', 'PT. POLA MITRA JAYA', '032001000405303', 'JL. Raya Boulevard Barat Blok LC6 Kav 69 Kelapa Gading Barang Jakarta Utara', '', '', '', NULL, '2023-02-24 07:53:04+00', '2023-06-09 02:48:09+00', 'selesai', NULL, NULL, NULL, 1999),
(12, 17749, 'ALOCITA MANDIRI', '022 87307478', '022 87307478', 'alocitamandiri19@gmail.com', 'alocitamandiri.pt07@gmail.com', 'alocitamandiri_pt.co.id', 'sandi mardani', NULL, 'sandymardany0260@gmail.com', '082126522323', NULL, 'Jasa Konsultansi', '1992-03-02', '2 Maret 1992', '15128036220', '-6.949915, 107.674644', 'HARRY SUSANTO, SH', 'JASA KONSULTAN', '13 Januari 2022', NULL, NULL, 'licensed', '11', NULL, 'BJB Cabang Tamansari Bandung', '0270010001367', 'ALOCITA MANDIRI', 'Jl. Tamansari No.18, Tamansari, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40116', '', '', '', NULL, '2023-04-26 06:04:48+00', '2023-04-26 06:04:48+00', 'selesai', NULL, NULL, NULL, 2022),
(13, 11, 'PT Telkom Akses', '02129337000', '02129336000', 'info@telkomakses.co.id', 'info@telkomakses.co.id', 'https://telkomakses.co.id', 'Herlina', NULL, 'lina.elisabeth@telkomakses.co.id', '085100129003', NULL, 'Broadband Network Management Services from the Planning, Development, To Operation and Maintenance Stages', '2012-12-12', '12 December 2012', '8 Million Subscribers', '7 Regional, 29 Territories, 61 Branch Areas', 'Limited Liability Company', 'Construction Telecomunication and Telecommunication Equipment Trading & Broadband Network Management Services', '2017', NULL, NULL, 'licensed', '912020036055100110001', NULL, 'Bank Mandiri', 'PT Telkom Akses', 'PT Telkom Akses', 'Jl. Kyai Tapa No.99', '', '', '', NULL, '2023-05-19 11:20:30+00', '2023-05-22 06:22:13+00', 'selesai', NULL, NULL, NULL, 2017),
(15, 17903, 'EdInvent Inc. DBA Accredible', '+1 650 677 1051', '+1 650 677 1051', '800 West El Camino Real, Suite 180, Accredible, Mountain View, CA, 94040', 'accounts@accredible.com', 'https://www.accredible.com/', 'Marla DiCandia', 'Chief Operating Officer', 'accounts@accredible.com', '+1 650 677 1051', NULL, 'Badges & Certificates', NULL, '2013', '-', 'USA & UK', 'Danny King | Co-Founder & CEO & Alan Heppenstall | Co-Founder & CTO', 'Startup & Blockchain Service Solutions', '10th', NULL, NULL, 'licensed', '-', '-', 'Wells Fargo Bank, NA', 'EdInvent Inc.', 'EdInvent Inc.', '420 Montgomery Street. San Francisco, CA 94104', '', '', '', NULL, '2023-07-10 02:47:25+00', '2023-07-11 01:46:19+00', 'selesai', NULL, NULL, NULL, NULL),
(16, 18660, 'PT Kreasi Berkah Sejahtera', '087776602017', '0212761717', 'JL WARU JAYA NO. 18 RT02/022 KEL BAKTIJAYA SUKMAJAYA DEPOK JAWA BARAT 16418', 'Kbs.cetak@gmail.com', 'www.kreasiberkahsejahtera.com', 'Rachman Pamungkas', 'sales & marketing', 'Kbs.cetak@gmail.com', '087776602017', NULL, 'Printing', '2021-04-13', '13 April 2021', '2000000000', 'Indonesia', 'PT', 'Printing', '2021', 'insured', NULL, NULL, '2', NULL, 'BNI', 'PT Kreasi Berkah Sejahtera', '7775672222 - PT Kreasi Berkah Sejahtera', 'Depok', '', '', '', NULL, '2024-02-18 09:51:22+00', '2024-05-03 17:44:26+00', NULL, NULL, NULL, NULL, 2021);


select setval('tbl_penyedia_internasional_id_penyedia_internasional_seq', (select max(id_penyedia_internasional) from tbl_penyedia_internasional));

ALTER TABLE public.tbl_internasional_legal_document ADD CONSTRAINT tbl_internasional_legal_document_id_penyedia_internasional_fkey FOREIGN KEY (id_penyedia_internasional) REFERENCES tbl_penyedia_internasional(id_penyedia_internasional);














INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(2, NULL, 'Dokumen', 'archive_gambar/11623/pendaftaran_internasional/11623-legal-20210527-111524.svg');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(3, 2, 'edX W9 2021', 'archive_gambar/11624/pendaftaran_internasional/11624-legal-1.PDF');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(4, NULL, '1', 'archive_gambar/11623/pendaftaran_internasional/11623-legal-20210527-111538.png');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(5, 3, 'AKTA', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(6, 3, 'Asuransi BPJS KetenagaKerjaan', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-2.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(7, 3, 'Cetakan Surat Keterangan Fiskal', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-3.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(8, 3, 'Domisili Menara Hijau', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-4.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(9, 3, 'IZIN_USAHA', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-5.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(10, 3, 'KTP', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-6.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(11, 3, 'KUMHAM', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-7.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(12, 3, 'NIB_9120001981605', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-8.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(13, 3, 'NPWP', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-9.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(14, 3, 'SKT 3K-SOLUTION', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-10.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(15, 3, 'SPPK', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-20210726-145823.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(16, 3, 'SPT 2020', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-20210726-145848.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(17, 3, 'form_ikutsertaan', 'archive_gambar/11779/pendaftaran_internasional/11779-legal-20210726-150206.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(18, NULL, '1', 'archive_gambar/17275/pendaftaran_internasional/17275-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(19, NULL, '-', 'archive_gambar/17275/pendaftaran_internasional/17275-legal-20220921-140806.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(20, 5, 'Cert of incorporation', 'archive_gambar/17273/pendaftaran_internasional/17273-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(21, 5, 'Certificate of Incorporation', 'archive_gambar/17273/pendaftaran_internasional/17273-legal-20220922-075249.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(22, 6, 'Registration document', 'archive_gambar/17392/pendaftaran_internasional/17392-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(23, 7, 'Akte Pendirian PT.Mega Akses Persada', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(24, 7, 'Akte Perubahan PT.Mega Akses Persada', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-2.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(25, 7, 'SK Penerimaaan Pemberitahuan Akte', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-3.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(26, 7, 'Izin NAP PT.Mega Akses Persada', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-4.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(27, 7, 'Izin Jartup PT.Mega Akses Persada', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-5.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(28, 7, 'Izin Jartaplok PT.Mega Akses Persada', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-6.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(29, 7, 'NIB PT.Mega Akses Persada', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-7.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(30, 7, 'NPWP PT.Mega Akses Persada', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-8.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(31, 7, 'ISO 27001- Informasi Security Management System', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-9.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(32, 8, 'Document of registration at Zurich', 'archive_gambar/17549/pendaftaran_internasional/17549-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(33, 7, 'izin siskomdat ( Sistem informasi komunikasi data', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-20221212-134807.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(34, 7, 'Laporan keuangan tahun 2020', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-20221212-134920.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(35, 7, 'Laporan keuangan tahun 2021', 'archive_gambar/17406/pendaftaran_internasional/17406-legal-20221212-134952.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(44, 10, 'AKTE PENDIRIAN', 'archive_gambar/17564/pendaftaran_internasional/17564-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(45, 10, 'SIUP', 'archive_gambar/17564/pendaftaran_internasional/17564-legal-2.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(46, 10, 'KTP DIREKTUR', 'archive_gambar/17564/pendaftaran_internasional/17564-legal-3.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(47, 10, 'NPWP DIREKTUR', 'archive_gambar/17564/pendaftaran_internasional/17564-legal-4.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(48, 12, 'Akte Pendirian', 'archive_gambar/17749/pendaftaran_internasional/17749-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(49, 12, 'AKTE PERUBAHAN', 'archive_gambar/17749/pendaftaran_internasional/17749-legal-20230426-130530.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(50, 12, 'NIB', 'archive_gambar/17749/pendaftaran_internasional/17749-legal-20230426-130555.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(51, 12, 'IUJK', 'archive_gambar/17749/pendaftaran_internasional/17749-legal-20230426-130610.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(52, 13, 'Proposal Telkom Akses untuk UT', 'archive_gambar/17795/pendaftaran_internasional/17795-legal-1.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(53, 11, 'akta pendirian', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-092320.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(54, 11, 'akta perubahan', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-093206.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(55, 11, 'akta perubahan', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-093224.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(56, 11, 'NIB', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-094848.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(57, 11, 'NPWP PKP', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-095050.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(58, 11, 'SBU Bangunan Gedung', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-101418.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(59, 11, 'KTP Pengurus', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-101446.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(60, 11, 'SBU Elektrikal', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-101517.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(61, 11, 'IUJK', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-101547.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(62, 11, 'Akuntan Publik 2021', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-102145.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(63, 11, 'SPT Pajak Tahun 2021', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-112328.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(64, 11, 'Bpjs Ketenagakerjaan', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-162202.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(65, 11, 'Surat Pakta Integritas', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-162240.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(66, 11, 'Surat Pernyataan', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-162320.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(67, 11, 'Formulir Kualifikasi', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-162434.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(68, 11, 'Tenaga Ahli Tetap', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-162649.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(69, 11, 'Tenaga Ahli K3 Konstruksi', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-162920.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(70, 11, 'Pengalaman Perusahaan', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-163447.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(71, 11, 'Personil', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-163709.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(72, 11, 'Memiliki kantor', 'archive_gambar/17640/pendaftaran_internasional/17640-legal-20230609-163830.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(73, NULL, 'Hudjs', 'archive_gambar/17847/pendaftaran_internasional/17847-legal-1.php');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(74, NULL, 'H', 'archive_gambar/17847/pendaftaran_internasional/17847-legal-20230619-152412.php');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(75, NULL, 'Hss', 'archive_gambar/17847/pendaftaran_internasional/17847-legal-20230619-153047.php');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(77, 15, 'we', 'archive_gambar/17903/pendaftaran_internasional/17903-legal-20230711-102208.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(78, 9, 'Akta Pendirian 43', 'archive_gambar/17556/pendaftaran_internasional/17556-legal-20230726-120934.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(79, 9, 'Akta Perubahan 06', 'archive_gambar/17556/pendaftaran_internasional/17556-legal-20230726-141951.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(80, 9, 'Persetujuan Kesesuaian Kegiatan Pemanfaatan Ruang Untuk Kegiatan Berusaha', 'archive_gambar/17556/pendaftaran_internasional/17556-legal-20230726-142003.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(81, 9, 'Nomor Induk Berusaha', 'archive_gambar/17556/pendaftaran_internasional/17556-legal-20230726-142019.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(82, 9, 'Surat Izin Usaha Perdagangan', 'archive_gambar/17556/pendaftaran_internasional/17556-legal-20230726-142036.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(83, 9, 'Nomor Pokok Wajib Pajak', 'archive_gambar/17556/pendaftaran_internasional/17556-legal-20230726-142054.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(84, 9, 'Surat Keterangan Terdaftar', 'archive_gambar/17556/pendaftaran_internasional/17556-legal-20230726-142105.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(85, 9, 'Surat Pengukuhan Pengusaha Kena Pajak', 'archive_gambar/17556/pendaftaran_internasional/17556-legal-20230726-142121.pdf');
INSERT INTO tbl_internasional_legal_document (id_legal_document, id_penyedia_internasional, nama_dokumen, path_dokumen) VALUES(86, 16, 'SK Kumham', 'archive_gambar/18660/pendaftaran_internasional/18660-legal-1.pdf');





CREATE TABLE trx_undangan_penjaringan_internasional (
	kode_undangan serial4 NOT NULL,
	kode_penjaringan_internasional int4 NULL,
	nama varchar(255) NULL,
	no_telp varchar(80) NULL,
	email varchar(150) NULL,
	CONSTRAINT trx_undangan_penjaringan_internasional_pkey PRIMARY KEY (kode_undangan),
	CONSTRAINT trx_undangan_penjaringan_internasional_kode_penjaringan_interna FOREIGN KEY (kode_penjaringan_internasional) REFERENCES public.trx_penjaringan_internasional(kode_penjaringan_internasional)
);



drop type if exists email_status;
CREATE TYPE email_status AS ENUM (
	'terkirim',
	'tidakterkirim'
);


alter table add column email_status email_status;