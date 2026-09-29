package tblsiqutdpppokjamodel

import (
  "context"
  "log"

  "promise-migration/db"

  "github.com/jackc/pgx/v5"
  "github.com/jackc/pgx/v5/pgtype"
)

type TblSiqutDppPokja struct {
  IdSiqutDppPokja pgtype.Int4
  IdSiqutDpp      pgtype.Int4
  IdPokja         pgtype.Int4
  EvalPokja       pgtype.Text
  StatusPokja     pgtype.Int4
}

func GetPokjaTerpilih(idSiqutDpp pgtype.Int4) []TblSiqutDppPokja {
  ctx := context.Background()

  qAllData := `
  SELECT
    id_siqut_dpp_pokja,
    id_siqut_dpp,
    id_pokja,
    eval_pokja,
    status_pokja
  FROM tbl_siqut_dpp_pokja
	WHERE id_siqut_dpp = $1
  ORDER BY id_siqut_dpp_pokja ASC`

  rwData, err := db.PromiseSiqut.Query(ctx, qAllData, idSiqutDpp)
  if err != nil {
		log.Fatal("Query failed (tbl_siqut_dpp_pokja.go::GetPokjaTerpilih), " + err.Error() + " " + qAllData)
  }
  defer rwData.Close()

  allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[TblSiqutDppPokja])
  if err2 != nil {
		log.Fatal("CollectRows failed (tbl_siqut_dpp_pokja.go::GetPokjaTerpilih), " + err2.Error())
  }

  return allData
}
