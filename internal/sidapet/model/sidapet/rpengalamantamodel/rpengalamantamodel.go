package rpengalamantamodel

import (
	"context"
	"database/sql"
	"fmt"
	"promise-migration/db"
  "promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/sidapet/structs"

	"github.com/jackc/pgx/v5"
)

func InsertRefPengalamanTa(kodeTA int32, vTPP structs.VmsTblPersonaliaPerush) {

 ctx := context.Background()

  helperDokumen := helperdokumenmodel.GetByOriginalPath(vTPP.PathPersonal)
  fileIjazah := helperDokumen.Newfilename
  encryptKeyIjazah := helperDokumen.EncryptKey


 qIns := `
  INSERT INTO ref_pengalaman_ta (
    kode_tenaga_ahli,
    pengalaman,
    file_bukti,
    encrypt_key
  ) VALUES (
    @kode_tenaga_ahli,
    @pengalaman,
    @file_bukti,
    @encrypt_key
  )`

 args := pgx.NamedArgs{
  "kode_tenaga_ahli": sql.NullInt32{Valid: true, Int32: kodeTA},
  "pengalaman":       vTPP.PengalamanPersonal,
  "file_bukti":       fileIjazah,
  "encrypt_key":      encryptKeyIjazah,
 }

 _, errIns := db.DbSidapet.Exec(ctx, qIns, args)
 if errIns != nil {
  fmt.Println("unable to insert ref_pengalaman_ta, " + errIns.Error())
 }
}
