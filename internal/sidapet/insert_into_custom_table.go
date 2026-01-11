package sidapet

import (
	"context"
	"log"
	"strconv"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

func InsertIntoCustomTable(kodePenjaringan pgtype.Int4, kodeVendor pgtype.Int4) {

	ctx := context.Background()

	// ref_komisaris_bu_custom
	qIns := `
	INSERT INTO public.ref_komisaris_bu_custom (
			kode_vendor,
			kode_penjaringan,
			nm_komisaris,
			jbtn_komisaris,
			hp_komisaris,
			no_ktp_komisaris,
			path_ktp_komisaris,
			encrypt_key,
			revisi_ke,
			kode_komisaris
	)
	SELECT 
			kode_vendor,
			@kode_penjaringan,
			nm_komisaris,
			jbtn_komisaris,
			hp_komisaris,
			no_ktp_komisaris,
			path_ktp_komisaris,
			encrypt_key,
			revisi_ke,
			kode_komisaris
	FROM ref_komisaris_bu
	WHERE kode_vendor = @kode_vendor`

	args := pgx.NamedArgs{
		"kode_penjaringan": kodePenjaringan,
		"kode_vendor":      kodeVendor,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		// fmt.Println("no_ktp_komisaris: " + vTK.NoKtpKomisaris.String + sidapethelper.GetLen(vTK.NoKtpKomisaris.String))
		log.Fatal("unable to insert ref_komisaris_bu_custom, " + errIns.Error())
	}

	qIns = `
	INSERT INTO ref_direksi_bu_custom (
			kode_vendor,
			kode_penjaringan,
			nm_direksi,
			jbtn_direksi,
			hp_direksi,
			no_ktp_direksi,
			path_ktp_direksi,
			encrypt_key,
			revisi_ke,
			kode_direksi
	)
	SELECT 
			kode_vendor,
			@kode_penjaringan, -- Use the provided parameter
			nm_direksi,
			jbtn_direksi,
			hp_direksi,
			no_ktp_direksi,
			path_ktp_direksi,
			encrypt_key,
			revisi_ke,
			kode_direksi -- Original kode_direksi for reference
	FROM ref_direksi_bu
	WHERE kode_vendor = @kode_vendor;`

	_, errIns = db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_direksi_bu_custom, " + errIns.Error())
	}

	qIns = `
	INSERT INTO ref_izin_usaha_bu_custom (
			kode_vendor,
			kode_penjaringan,
			jenis_izin_usaha,
			nama,
			nomor_izin,
			file_izin,
			is_izin_selamanya,
			izin_berlaku_awal,
			izin_berlaku_akhir,
			encrypt_key,
			revisi_ke,
			kode_izin_usaha
	)
	SELECT 
			kode_vendor,
			@kode_penjaringan,
			jenis_izin_usaha,
			nama,
			nomor_izin,
			file_izin,
			is_izin_selamanya,
			izin_berlaku_awal,
			izin_berlaku_akhir,
			encrypt_key,
			revisi_ke,
			kode_izin_usaha
	FROM ref_izin_usaha_bu
	WHERE kode_vendor = @kode_vendor`

	_, errIns = db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_izin_usaha_bu_custom, " + errIns.Error())
	}

	qIns = `
	INSERT INTO ref_fasilitas_bu_custom (
			kode_vendor,
			kode_penjaringan,
			nama,
			jumlah,
			kode_kondisi,
			kode_kepemilikan,
			file_kepemilikan,
			is_kepemilikan_selamanya,
			kepemilikan_berlaku_awal,
			kepemilikan_berlaku_akhir,
			encrypt_key_kepemilikan,
			file_foto,
			encrypt_key_foto,
			revisi_ke,
			kode_fasilitas
	)
	SELECT 
			kode_vendor,
			@kode_penjaringan,
			nama,
			jumlah,
			kode_kondisi,
			kode_kepemilikan,
			file_kepemilikan,
			is_kepemilikan_selamanya,
			kepemilikan_berlaku_awal,
			kepemilikan_berlaku_akhir,
			encrypt_key_kepemilikan,
			file_foto,
			encrypt_key_foto,
			revisi_ke,
			kode_fasilitas
	FROM ref_fasilitas_bu
	WHERE kode_vendor = @kode_vendor`

	_, errIns = db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_fasilitas_bu_custom, " + errIns.Error())
	}

	qIns = `
	INSERT INTO ref_saham_bu_custom (
			kode_vendor,
			kode_penjaringan,
			nm_saham,
			no_ktp_saham,
			posisi,
			persentase_saham,
			revisi_ke,
			kode_saham
	)
	SELECT 
			kode_vendor,
			@kode_penjaringan,  -- Use the provided parameter
			nm_saham,
			no_ktp_saham,
			posisi,
			persentase_saham,
			revisi_ke,
			kode_saham
	FROM ref_saham_bu
	WHERE kode_vendor = @kode_vendor`

	_, errIns = db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_saham_bu_custom, " + errIns.Error())
	}

	qIns = `
	INSERT INTO ref_kantor_bu_custom (
			kode_vendor,
			kode_penjaringan,
			nama_kantor,
			alamat,
			kode_kondisi,
			kode_kepemilikan,
			file_bukti,
			is_bukti_selamanya,
			bukti_berlaku_awal,
			bukti_berlaku_akhir,
			encrypt_key_bukti,
			file_foto,
			encrypt_key_foto,
			revisi_ke,
			kode_kantor
	)
	SELECT 
			kode_vendor,
			@kode_penjaringan,
			nama_kantor,
			alamat,
			kode_kondisi,
			kode_kepemilikan,
			file_bukti,
			is_bukti_selamanya,
			bukti_berlaku_awal,
			bukti_berlaku_akhir,
			encrypt_key_bukti,
			file_foto,
			encrypt_key_foto,
			revisi_ke,
			kode_kantor
	FROM ref_kantor_bu 
	WHERE kode_vendor = @kode_vendor`

	_, errIns = db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_kantor_bu_custom, " + errIns.Error())
	}

	qIns = `
	INSERT INTO ref_pengalaman_bu_custom (
			kode_vendor,
			kode_penjaringan,
			nama_pekerjaan,
			pemberi_kerja,
			nilai_pekerjaan,
			tgl_awal_pekerjaan,
			tgl_akhir_pekerjaan,
			no_kontrak,
			file_kontrak,
			encrypt_key_kontrak,
			revisi_ke,
			kode_pengalaman_bu
	)
	SELECT 
			pb.kode_vendor,
			@kode_penjaringan, -- Use the parameter value
			pb.nama_pekerjaan,
			pb.pemberi_kerja,
			pb.nilai_pekerjaan,
			pb.tgl_awal_pekerjaan,
			pb.tgl_akhir_pekerjaan,
			pb.no_kontrak,
			pb.file_kontrak,
			pb.encrypt_key_kontrak,
			pb.revisi_ke,
			pb.kode_pengalaman_bu -- Keep reference to original record
	FROM ref_pengalaman_bu pb
	WHERE pb.kode_vendor = @kode_vendor`

	_, errIns = db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_pengalaman_bu_custom, " + errIns.Error())
	}

	qIns = `
	INSERT INTO ref_sertifikat_usaha_bu_custom (
			kode_vendor,
			kode_penjaringan,
			nama_judul,
			nomor,
			penerbit,
			tanggal,
			file_sertif,
			is_sertif_selamanya,
			sertif_berlaku_awal,
			sertif_berlaku_akhir,
			encrypt_key,
			revisi_ke,
			kode_sertifikat_usaha
	)
	SELECT 
			kode_vendor,
			@kode_penjaringan, -- Use the parameter value
			nama_judul,
			nomor,
			penerbit,
			tanggal,
			file_sertif,
			is_sertif_selamanya,
			sertif_berlaku_awal,
			sertif_berlaku_akhir,
			encrypt_key,
			revisi_ke,
			kode_sertifikat_usaha
	FROM ref_sertifikat_usaha_bu
	WHERE kode_vendor = @kode_vendor`

	_, errIns = db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_sertifikat_usaha_bu_custom, " + errIns.Error())
	}

	strKodeVendor := strconv.Itoa(int(kodeVendor.Int32))
	strKodePenjaringan := strconv.Itoa(int(kodePenjaringan.Int32))

	qIns = "CALL copy_ref_to_custom(" + strKodeVendor + ", " + strKodePenjaringan + ")"
	_, errIns = db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to call copy_ref_to_custom, " + errIns.Error())
	}

// ref_kantor_bu_custom 	// skip, kantor tidak ada di DB lama
// ref_pengalaman_pero_custom
// ref_sertif_pero_custom



}
