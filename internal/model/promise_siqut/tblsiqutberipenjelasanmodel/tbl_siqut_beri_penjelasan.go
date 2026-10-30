package tblsiqutberipenjelasanmodel

import (
	"context"
	"log"

	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TblSiqutBeriPenjelasan struct {
	IdSiqutBeriPenjelasan pgtype.Int4
	KomenPenjelasan       pgtype.Int4
	IdSiqutDpp            pgtype.Int4
	IdUser                pgtype.Int4
	Penjelasan            pgtype.Text
	CreatedAt             pgtype.Timestamp
}

func GetAllPenjelasanPerPaket(idSiqutDpp pgtype.Int4) []TblSiqutBeriPenjelasan {
	ctx := context.Background()

	qAllData := `
  SELECT
    id_siqut_beri_penjelasan,
		CASE 
			WHEN komen_penjelasan = 'pokja' THEN 999999
			ELSE CAST(komen_penjelasan AS integer)
		END AS komen_penjelasan,
    id_siqut_dpp,
    id_user,
    penjelasan,
    created_at
  FROM tbl_siqut_beri_penjelasan
	WHERE id_siqut_dpp = $1
  ORDER BY id_siqut_beri_penjelasan ASC`

	rwData, err := db.PromiseSiqut.Query(ctx, qAllData, idSiqutDpp)
	if err != nil {
		log.Fatal("Query failed (tbl_siqut_beri_penjelasan.go::GetAllPenjelasanPerPaket), " + err.Error() + " " + qAllData)
	}
	defer rwData.Close()

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[TblSiqutBeriPenjelasan])
	if err2 != nil {
		log.Fatal("CollectRows failed (tbl_siqut_beri_penjelasan.go::GetAllPenjelasanPerPaket), " + err2.Error())
	}

	return allData
}
