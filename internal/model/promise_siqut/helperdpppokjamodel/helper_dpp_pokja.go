package helperdpppokjamodel

import (
  "context"
  "log"

  "promise-migration/db"

  "github.com/jackc/pgx/v5"
  "github.com/jackc/pgx/v5/pgtype"
)

type HelperDppPokja struct {
  IdSiqutDppPokja pgtype.Int4
  IdSiqutDpp      pgtype.Int4
  IdPokja         pgtype.Int4
  UserIdV2        pgtype.Int4
  EmailReal       pgtype.Text
  Name            pgtype.Text
  Nip             pgtype.Text
}

func GetPokjaTerpilih(idSiqutDpp pgtype.Int4) []HelperDppPokja {
  ctx := context.Background()

  qAllData := `
  SELECT
    id_siqut_dpp_pokja,
    id_siqut_dpp,
    id_pokja,
    user_id_v2,
    email_real,
    name,
    nip
  FROM promise_siqut.helper_dpp_pokja
	WHERE id_siqut_dpp = $1
  ORDER BY id_siqut_dpp_pokja ASC`

  rwData, err := db.PromiseSiqut.Query(ctx, qAllData, idSiqutDpp)
  if err != nil {
		log.Fatal("Query failed (helper_dpp_pokja.go::GetPokjaTerpilih), " + err.Error() + " " + qAllData)
  }
  defer rwData.Close()

  allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[HelperDppPokja])
  if err2 != nil {
		log.Fatal("CollectRows failed (helper_dpp_pokja.go::GetPokjaTerpilih), " + err2.Error())
  }

  return allData
}
