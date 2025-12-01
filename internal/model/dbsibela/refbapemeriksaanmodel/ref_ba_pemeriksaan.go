package refbapemeriksaanmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefBaPemeriksaan struct {
	KodeBaPemerikasaan        pgtype.Int4
	KodeTrxRiwayatPelaksanaan pgtype.Int4
	KodeTte                   pgtype.Int4
	TanggalBap                pgtype.Timestamp
	Denda                     pgtype.Numeric
	DokHasilPekerjaan         pgtype.Text
	Catatan                   pgtype.Text
	NamaPemeriksa             pgtype.Text
	Ucr                       pgtype.Text
	Uch                       pgtype.Text
	Udcr                      pgtype.Timestamp
	Udch                      pgtype.Timestamp
}

func InsertNew(refBaPemeriksaan RefBaPemeriksaan) RefBaPemeriksaan {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_ba_pemeriksaan (
		kode_trx_riwayat_pelaksanaan,
		kode_tte,
		tanggal_bap,
		denda,
		dok_hasil_pekerjaan,
		catatan,
		nama_pemeriksa,
		ucr,
		uch,
		udcr,
		udch
	) VALUES (
		@kode_trx_riwayat_pelaksanaan,
		@kode_tte,
		@tanggal_bap,
		@denda,
		@dok_hasil_pekerjaan,
		@catatan,
		@nama_pemeriksa,
		@ucr,
		@uch,
		@udcr,
		@udch
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_trx_riwayat_pelaksanaan": refBaPemeriksaan.KodeTrxRiwayatPelaksanaan,
		"kode_tte":                     refBaPemeriksaan.KodeTte,
		"tanggal_bap":                  refBaPemeriksaan.TanggalBap,
		"denda":                        refBaPemeriksaan.Denda,
		"dok_hasil_pekerjaan":          refBaPemeriksaan.DokHasilPekerjaan,
		"catatan":                      refBaPemeriksaan.Catatan,
		"nama_pemeriksa":               refBaPemeriksaan.NamaPemeriksa,
		"ucr":                          refBaPemeriksaan.Ucr,
		"uch":                          refBaPemeriksaan.Uch,
		"udcr":                         refBaPemeriksaan.Udcr,
		"udch":                         refBaPemeriksaan.Udch,
	}

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_ba_pemeriksaan, " + errIns.Error())
	}
	defer rwIns.Close()

	allRefBaPemeriksaan, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefBaPemeriksaan])
	if err != nil {
		log.Fatal("failed collecting RefBaPemeriksaan, " + err.Error())
	}

	return allRefBaPemeriksaan[0]
}
