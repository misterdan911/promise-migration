package rpengalamantamodel

import (
	"context"
	"database/sql"
	"fmt"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"

	"github.com/jackc/pgx/v5"
)

func InsertRefPengalamanTa(kodeTA int32, vTPP structs.VmsTblPersonaliaPerush) {

 ctx := context.Background()

 qIns := `
  INSERT INTO ref_pengalaman_ta (
    kode_tenaga_ahli,
    pengalaman,
    file_bukti
  ) VALUES (
    @kode_tenaga_ahli,
    @pengalaman,
    @file_bukti
  )`

 args := pgx.NamedArgs{
  "kode_tenaga_ahli": sql.NullInt32{Valid: true, Int32: kodeTA},
  "pengalaman":       vTPP.PengalamanPersonal,
  "file_bukti":       sql.NullString{},
 }

 _, errIns := db.DbSidapet.Exec(ctx, qIns, args)
 if errIns != nil {
  fmt.Println("unable to insert ref_pengalaman_ta, " + errIns.Error())
 }
}
