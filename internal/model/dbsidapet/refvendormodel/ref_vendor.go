package refvendormodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type RefVendor struct {
	KodeVendor        pgtype.Int4
	KodeJenisVendor   pgtype.Int4
	NamaPerusahaan    pgtype.Text
	IsTetap           pgtype.Bool
	StatusFormLuarDpt pgtype.Text
	Verifikator       pgtype.Text
	WaktuVerifikasi   pgtype.Timestamptz
	StatusAktifVendor pgtype.Text
	Udcr              pgtype.Timestamptz
	Udch              pgtype.Timestamptz
}

func DeleteByKodeVendor(kodeVendor pgtype.Int4) {
	ctx := context.Background()

	qDelete := `DELETE FROM ref_vendor WHERE kode_vendor = $1`
	_, err := db.DbSidapet.Exec(ctx, qDelete, kodeVendor)
	if err != nil {
		log.Fatal("failed deleting RefVendor (refvendor.go), " + err.Error())
	}
}

func GetDataByKodeVendor(kodeVendor pgtype.Int4) RefVendor {
	ctx := context.Background()
	var vendor RefVendor

	qRefVendor := `
    SELECT
      kode_vendor,
      kode_jenis_vendor,
      nama_perusahaan,
      is_tetap,
      status_form_luar_dpt,
			verifikator,
			waktu_verifikasi,
			status_aktif_vendor,
      udcr,
      udch
    FROM ref_vendor
    WHERE kode_vendor = $1
    ORDER BY kode_vendor ASC`

	rwVendor, err := db.DbSidapet.Query(ctx, qRefVendor, kodeVendor)
	if err != nil {
		log.Fatal("qRefVendor Failed, " + err.Error() + " " + qRefVendor)
	}

	allVendors, err2 := pgx.CollectRows(rwVendor, pgx.RowToStructByName[RefVendor])
	if err2 != nil {
		log.Fatal("failed collecting rwVendor (ref_vendor.go), " + err2.Error())
	}
	defer rwVendor.Close()

	if len(allVendors) > 0 {
		vendor = allVendors[0]
	}

	return vendor
}
