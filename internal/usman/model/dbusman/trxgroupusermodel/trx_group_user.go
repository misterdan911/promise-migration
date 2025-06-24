package trxgroupusermodel

import (
 "context"
 "fmt"
 "github.com/jackc/pgx/v5"
 "github.com/jackc/pgx/v5/pgtype"
 "promise-migration/db"
)

type TrxGroupUser struct {
 IdGroupUser pgtype.Int4
 KodeGroup   pgtype.Text
 IdUser      pgtype.Int4
 Status      pgtype.Text
 Ucr         pgtype.Text
 Uch         pgtype.Text
 Udcr        pgtype.Text
 Udch        pgtype.Text
}

func InsertNew(trxgroupuser TrxGroupUser) {

  ctx := context.Background()

  qInsert := `
    INSERT INTO trx_group_user (
    kode_group,
    id_user,
    status,
    ucr,
    uch,
    udcr,
    udch
  ) VALUES (
    @kode_group,
    @id_user,
    @status,
    @ucr,
    @uch,
    @udcr,
    @udch
  )`

  args := pgx.NamedArgs{
    "kode_group": trxgroupuser.KodeGroup,
    "id_user":    trxgroupuser.IdUser,
    "status":     trxgroupuser.Status,
    "ucr":        trxgroupuser.Ucr,
    "uch":        trxgroupuser.Uch,
    "udcr":       trxgroupuser.Udcr,
    "udch":       trxgroupuser.Udch,
  }

  _, errIns := db.DbUsman.Exec(ctx, qInsert, args)
  if errIns != nil {
    fmt.Println("unable to insert trx_group_user, " + errIns.Error())
  }
}

/*
func InsertIfNotExists(kodeGroup pgtype.Text, idUser pgtype.Int4) {
  // TODO:
  // - select trx_group_user where kode_group = kodeGroup and id_user = idUser
  // - if record doesn't exists run InsertNew function above
  // - if record exists, do nothing
}
*/

func InsertIfNotExists(kodeGroup pgtype.Text, idUser pgtype.Int4) {
    ctx := context.Background()

    // First, check if the record exists
    qSelect := `
        SELECT COUNT(*) 
        FROM trx_group_user 
        WHERE kode_group = @kode_group AND id_user = @id_user
    `
    
    args := pgx.NamedArgs{
        "kode_group": kodeGroup,
        "id_user":    idUser,
    }

    var count int
    err := db.DbUsman.QueryRow(ctx, qSelect, args).Scan(&count)
    if err != nil {
        fmt.Println("unable to check if trx_group_user exists, " + err.Error())
        return
    }

    // If no record exists, insert a new one
    if count == 0 {
        newUser := TrxGroupUser{
            KodeGroup: kodeGroup,
            IdUser:    idUser,
            Status:    pgtype.Text{String: "1", Valid: true}, // Assuming default status
        }
        InsertNew(newUser)
    }
    // If record exists, do nothing
}