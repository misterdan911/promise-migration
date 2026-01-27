package rsertiftamodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/sidapet/structs"
)

func InserRefSertifTa(kodeTA int32, vTPP structs.VmsTblPersonaliaPerush) {

	ctx := context.Background()

	  helperDokumen := helperdokumenmodel.GetByOriginalPath(vTPP.PathPersonal)
	  fileIjazah := helperDokumen.Newfilename
	  encryptKeyIjazah := helperDokumen.EncryptKey


	qIns := `
		INSERT INTO ref_sertif_ta (
		  kode_tenaga_ahli,
		  sertifikat,
		  file_bukti,
		  encrypt_key
		) VALUES (
		  @kode_tenaga_ahli,
		  @sertifikat,
		  @file_bukti,
		  @encrypt_key
		)`

	args := pgx.NamedArgs{
		"kode_tenaga_ahli": sql.NullInt32{Valid: true, Int32: kodeTA},
		"sertifikat":       vTPP.SertifPersonal,
		"file_bukti":       fileIjazah,
		"encrypt_key":      encryptKeyIjazah,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_sertif_ta, " + errIns.Error())
	}
}
