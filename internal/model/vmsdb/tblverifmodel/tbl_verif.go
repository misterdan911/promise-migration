package tblverifmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type IdProfile struct {
  IdProfile pgtype.Int4
}

type TblVerif struct {
  IdVerif            pgtype.Int4
  IdProfil           pgtype.Int4
  IdPaket            pgtype.Int4
  IdPegawai          pgtype.Int4
  StatusVerif        pgtype.Int4
  OrgDataPribadi     pgtype.Int4
  OrgNpwpPribadi     pgtype.Int4
  OrgPengalaman      pgtype.Float8
  OrgSertifikat      pgtype.Float8
  PerusLandasanHukum pgtype.Int4
  PerusPengurus      pgtype.Int4
  PerusIzinUsaha     pgtype.Int4
  PerusDataKeuangan  pgtype.Int4
  PerusPersonalia    pgtype.Float8
  PerusFasilitas     pgtype.Float8
  PerusPengalaman    pgtype.Float8
  PerusLapKeuangan   pgtype.Float8
  TotalNilai         pgtype.Float8
  Terpilih           pgtype.Int4
}

func GetDataByIdPaket(idPaket pgtype.Int4) []TblVerif {

  ctx := context.Background()

  qVmsTblVerif := `
  SELECT
    id_verif,
    id_profil,
    id_paket,
    id_pegawai,
    status_verif,
    org_data_pribadi,
    org_npwp_pribadi,
    org_pengalaman,
    org_sertifikat,
    perus_landasan_hukum,
    perus_pengurus,
    perus_izin_usaha,
    perus_data_keuangan,
    perus_personalia,
    perus_fasilitas,
    perus_pengalaman,
    perus_lap_keuangan,
    total_nilai,
    terpilih
  FROM tbl_verif
  WHERE id_paket = $1
  ORDER BY id_profil ASC`

  rwTblVerif, err := db.VmsDb.Query(ctx, qVmsTblVerif, idPaket)
  if err != nil {
    log.Fatal("qVmsTblVerif Failed, " + err.Error() + " " + qVmsTblVerif)
  }

  allTblVerif, err := pgx.CollectRows(rwTblVerif, pgx.RowToStructByName[TblVerif])
  if err != nil {
    log.Fatal("failed collecting rwTblVerif, " + err.Error())
  }
  defer rwTblVerif.Close()

  return allTblVerif
}