package refproseskontrakmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefProsesKontrak struct {
	KodeProsesKontrak        pgtype.Int4
	KodePermintaan           pgtype.Int4
	KodeStatusKontrak        pgtype.Int4
	KodeStepPersiapanKontrak pgtype.Int4
	Ucr                      pgtype.Text
	Uch                      pgtype.Text
	Udcr                     pgtype.Timestamp
	Udch                     pgtype.Timestamp
	StatusPengisian          pgtype.Text
}

func InsertNewData(refProsesKontrak RefProsesKontrak) RefProsesKontrak {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_proses_kontrak (
		kode_permintaan,
		kode_status_kontrak,
		kode_step_persiapan_kontrak,
		ucr,
		uch,
		udcr,
		udch,
		status_pengisian
	) VALUES (
		@kode_permintaan,
		@kode_status_kontrak,
		@kode_step_persiapan_kontrak,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@status_pengisian
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_permintaan":             refProsesKontrak.KodePermintaan,
		"kode_status_kontrak":         refProsesKontrak.KodeStatusKontrak,
		"kode_step_persiapan_kontrak": refProsesKontrak.KodeStepPersiapanKontrak,
		"ucr":                         refProsesKontrak.Ucr,
		"uch":                         refProsesKontrak.Uch,
		"udcr":                        refProsesKontrak.Udcr,
		"udch":                        refProsesKontrak.Udch,
		"status_pengisian":            refProsesKontrak.StatusPengisian,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_proses_kontrak, " + errIns.Error())
	}
	defer rwIns.Close()

	allProsesKontrak, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefProsesKontrak])
	if err != nil {
		log.Fatal("failed collecting RefProsesKontrak, " + err.Error())
	}

	return allProsesKontrak[0]
}

func GetNomorDanTglKontrak(kodePermintaan pgtype.Int4) pgtype.Text {

	ctx := context.Background()

	qSelect := `
	SELECT
		concat(tdk.nomor_surat_pesanan, ' tanggal ', TO_CHAR(tdk.tgl_surat, 'YYYY-MM-DD')) as nomor_dan_tgl
	FROM ref_proses_kontrak rpk
	LEFT JOIN trx_dokumen_kontrak tdk on tdk.kode_proses_kontrak = rpk.kode_proses_kontrak 
	WHERE
	kode_permintaan = $1 AND
	kode_status_kontrak = 2`

  var nomorDanTgl pgtype.Text
  
  err := db.DbSibela.QueryRow(ctx, qSelect, kodePermintaan).Scan(&nomorDanTgl)
  if err != nil {
    if err == pgx.ErrNoRows {
      return pgtype.Text{String: "", Valid: false}
    }
    log.Fatal("failed querying GetNomorDanTglKontrak, " + err.Error())
  }
  
  return nomorDanTgl
}


type JangkaWaktu struct {
	JangkaWaktu        pgtype.Int4
	TglMulaiAkhir           pgtype.Text
}

func GetTrxJangkaWaktuByKodePermintaan(kodePermintaan pgtype.Int4) JangkaWaktu {

	ctx := context.Background()

	qSelect := `
	SELECT
		tjw.jangka_waktu,
		concat(TO_CHAR(tjw.dari, 'YYYY-MM-DD'), ' s.d ', TO_CHAR(tjw.sampai_dengan, 'YYYY-MM-DD')) as tgl_mulai_akhir
	FROM ref_proses_kontrak rpk
	LEFT JOIN trx_jangka_waktu tjw  on tjw.kode_proses_kontrak = rpk.kode_proses_kontrak 
	WHERE
	kode_permintaan = $1 AND
	kode_status_kontrak = 1`

	var jangkaWaktu JangkaWaktu
	
	err := db.DbSibela.QueryRow(ctx, qSelect, kodePermintaan).Scan(&jangkaWaktu.JangkaWaktu, &jangkaWaktu.TglMulaiAkhir)
	if err != nil {
		if err == pgx.ErrNoRows {
			return JangkaWaktu{}
		}
		log.Fatal("failed querying GetTrxJangkaWaktuByKodePermintaan, " + err.Error())
	}
	
	return jangkaWaktu
}
