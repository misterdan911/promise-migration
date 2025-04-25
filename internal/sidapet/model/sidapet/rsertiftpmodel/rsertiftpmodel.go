package rsertiftpmodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func InsertRefSertifTp(kodeTA int32, vTPP structs.VmsTblPersonaliaPerush) {

	ctx := context.Background()

	qIns := `
		INSERT INTO ref_sertif_tp (
		  kode_tenaga_pendukung,
		  sertifikat,
		  file_bukti
		) VALUES (
		  @kode_tenaga_pendukung,
		  @sertifikat,
		  @file_bukti
		)`

	args := pgx.NamedArgs{
		"kode_tenaga_pendukung": sql.NullInt32{Valid: true, Int32: kodeTA},
		"sertifikat":            vTPP.SertifPersonal,
		"file_bukti":            sql.NullString{},
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_sertif_tp, " + errIns.Error())
	}
}
