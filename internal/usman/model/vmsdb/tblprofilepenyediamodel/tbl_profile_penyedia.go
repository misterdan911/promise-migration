package tblprofilepenyediamodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/usman/structs"
)

func GetPenyediaByUserId(userId pgtype.Int4) structs.TblProfilePenyedia {

	ctx := context.Background()
	var penyedia structs.TblProfilePenyedia

	qTblProfilePenyedia := `
    SELECT
      id_profil_penyedia,
      id_user,
      id_jenis_penyedia,
      id_paket,
      nama,
      path_ktp,
      id_domisili,
      path_domisili,
      id_cabang_ut,
      alamat,
      no_telp,
      no_fax,
      email,
      nm_bank,
      pemilik_rek,
      kode_bank,
      no_rek,
      path_rek,
      npwp,
      path_npwp,
      lap_uang_perus,
      path_lap_perus,
      path_ikut_serta,
      path_kuasa,
      path_skb,
      path_skpp23,
      path_pph_dibebaskan,
      contact_person,
      p_status,
      klarifikasi,
      penyedia_terpilih,
      create_time,
      update_time
    FROM tbl_profile_penyedia
		WHERE id_user = $1
    ORDER BY id_profil_penyedia ASC`

	rwPenyedia, err := db.VmsDb.Query(ctx, qTblProfilePenyedia, userId)
	if err != nil {
		log.Fatal("qTblProfilePenyedia Failed, " + err.Error() + " " + qTblProfilePenyedia)
	}

	allPenyedia, err2 := pgx.CollectRows(rwPenyedia, pgx.RowToStructByName[structs.TblProfilePenyedia])
	if err2 != nil {
		log.Fatal("failed collecting rwUser (tbl_profile_penyedia.go), " + err2.Error())
	}
	defer rwPenyedia.Close()

	if len(allPenyedia) > 0 {
		penyedia = allPenyedia[0]
	}

	return penyedia
}
