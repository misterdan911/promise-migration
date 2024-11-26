package sippan

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
)

type RefKeyword struct {
	KwLokasi       pgtype.Text
	KwDetailLokasi pgtype.Text
	KodeKabKota    pgtype.Text
	KodeProvinsi   pgtype.Text
}

type RefRup struct {
	KodeRup pgtype.Int4
}

func UpdateProvKabKota() {
	ctx := context.Background()
	qKeyword := `
		SELECT
			kw_lokasi,
			kw_detail_lokasi,
			r_kw.kode_kab_kota AS kode_kab_kota,
			kode_provinsi
		FROM ref_keyword r_kw
		LEFT JOIN ref_kab_kota r_kk ON r_kk.kode_kab_kota = r_kw.kode_kab_kota`
	rKeyword, errKw := db.DbSippan.Query(ctx, qKeyword)
	if errKw != nil {
		log.Fatal("qRuptUt Failed, " + errKw.Error() + " " + qKeyword)
	}

	allKeyword, errCollect := pgx.CollectRows(rKeyword, pgx.RowToStructByName[RefKeyword])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rKeyword.Close()

	fmt.Println("Updating Provinsi Kab Kota...")

	for _, kw := range allKeyword {
		kwDetailLok := kw.KwDetailLokasi.String
		kwLokasi := kw.KwLokasi.String

		if kwDetailLok != "" {
			//fmt.Println("Masuk kwDetailLok")
			//fmt.Println(kwDetailLok)
			qRup := "SELECT kode_rup FROM ref_rup WHERE detail_lokasi ILIKE '%' || $1 || '%'"
			rRup, errRup := db.DbSippan.Query(ctx, qRup, kwDetailLok)
			if errRup != nil {
				log.Fatal("qRuptUt Failed, " + errRup.Error() + " " + qRup)
			}

			allRup, errCollect := pgx.CollectRows(rRup, pgx.RowToStructByName[RefRup])
			if errCollect != nil {
				log.Fatal("failed collecting rows, " + errCollect.Error())
			}
			defer rRup.Close()

			for _, rup := range allRup {
				qUpdate := "UPDATE ref_rup SET kode_kab_kota = @kodeKabKota WHERE kode_rup = @kodeRup"
				args := pgx.NamedArgs{
					"kodeRup":     rup.KodeRup,
					"kodeKabKota": kw.KodeKabKota,
				}
				_, errUpdate := db.DbSippan.Exec(ctx, qUpdate, args)
				if errUpdate != nil {
					fmt.Println("unable to update row, " + errUpdate.Error())
				}

			}
		}
		if kwLokasi != "" {
			//fmt.Println("Masuk kwLokasi")
			//fmt.Println(kwLokasi)
			qRup := "SELECT kode_rup FROM ref_rup WHERE lokasi ILIKE '%' || $1 || '%'"
			rRup, errRup := db.DbSippan.Query(ctx, qRup, kwLokasi)
			if errRup != nil {
				log.Fatal("qRuptUt Failed, " + errRup.Error() + " " + qRup)
			}

			allRup, errCollect := pgx.CollectRows(rRup, pgx.RowToStructByName[RefRup])
			if errCollect != nil {
				log.Fatal("failed collecting rRup, " + errCollect.Error())
			}
			defer rRup.Close()

			for _, rup := range allRup {
				qUpdate := "UPDATE ref_rup SET kode_kab_kota = @kodeKabKota WHERE kode_rup = @kodeRup"
				args := pgx.NamedArgs{
					"kodeRup":     rup.KodeRup,
					"kodeKabKota": kw.KodeKabKota,
				}
				_, errUpdate := db.DbSippan.Exec(ctx, qUpdate, args)
				if errUpdate != nil {
					fmt.Println("unable to update row, " + errUpdate.Error())
				}
			}
		}
	}

	fmt.Println("Updating Provinsi Kab Kota... SELESAI")
}
