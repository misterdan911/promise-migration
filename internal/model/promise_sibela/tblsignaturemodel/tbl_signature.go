package tblsignaturemodel

import (
	"context"
	"fmt"
	"log"
	"strconv"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/db"
)

type TblSignature struct {
	IdSignature       pgtype.Int4
	IdSignatureOtp    pgtype.Int4
	IdUser            pgtype.Int4
	IdProfilPenyedia  pgtype.Text
	IdDireksiPerus    pgtype.Text
	JenisPaket        pgtype.Text
	IdPaketDptpl      pgtype.Text
	IdTerminDptpl     pgtype.Text
	IdPaketPl         pgtype.Text
	IdTerminPl        pgtype.Text
	IdLangganan       pgtype.Int4
	JenisSignature    pgtype.Text
	Tte               pgtype.Text
	PathFinalBarcode  pgtype.Text
	PathFinalDok      pgtype.Text
	HashFinalBarcode  pgtype.Text
	HashFinalDok      pgtype.Text
	PathDokManual     pgtype.Text
	StatusSignature   pgtype.Int4
	CreatedAt         pgtype.Timestamptz
}

// Dapatkan Signature Surat Pesanan
// jenisPaket -> dpt / luardpt
func GetAllSignatureSP(idPaketPl pgtype.Int4, jenisPaket pgtype.Text) []TblSignature{

	ctx := context.Background()
	jenisSignature := pgtype.Text{Valid: true, String: "Surat Pesanan/SPK"}

	var qTblSignature string

	switch jenisPaket.String {
	case "luardpt":

		qTblSignature = `
		SELECT * from tbl_signature
		WHERE
		id_paket_pl = @id_paket_pl AND
		jenis_signature = @jenis_signature
		`
	case "dpt":

		qTblSignature = `
		SELECT * from tbl_signature
		WHERE
		id_termin_dptpl = @id_paket_pl AND
		jenis_signature = @jenis_signature
		`

	default:
		log.Fatal("Invalid Jenis Paket")
	}
	
	strIdPaketPl := pgtype.Text{Valid:true, String: strconv.Itoa(int(idPaketPl.Int32))}
	// fmt.Println("strIdPaketPl: ", strIdPaketPl.String)

	args := pgx.NamedArgs{
		"id_paket_pl": strIdPaketPl,
		"jenis_signature": jenisSignature,
		"jenis_paket": jenisPaket,
	}

  rwTblPesanan, err := db.PromiseSibela.Query(ctx, qTblSignature, args)
  if err != nil {
    log.Fatal("qTblSignature Failed, " + err.Error() + " " + qTblSignature)
  }

  allTblSignature, err := pgx.CollectRows(rwTblPesanan, pgx.RowToStructByName[TblSignature])
  if err != nil {
    log.Fatal("failed collecting rwTblPesanan, " + err.Error())
  }
  defer rwTblPesanan.Close()

	return allTblSignature
}

func GetAllSignature(idPaketPl pgtype.Int4, jenisPaket pgtype.Text, idTerminPl pgtype.Int4, jenisSignature  pgtype.Text) []TblSignature{

	ctx := context.Background()

	var qTblSignature string

	switch jenisPaket.String {
	case "luardpt":

		qTblSignature = `
		SELECT * from tbl_signature
		WHERE
		id_paket_pl = @id_paket_pl AND
		id_termin_pl = @id_termin_pl AND
		jenis_signature = @jenis_signature
		`
	case "dpt":

		qTblSignature = `
		SELECT * from tbl_signature
		WHERE
		id_paket_dptpl = @id_paket_pl AND
		id_termin_dptpl = @id_termin_pl AND
		jenis_signature = @jenis_signature
		`

	default:
		log.Fatal("Invalid Jenis Paket")
	}
	
	strIdPaketPl := pgtype.Text{Valid:true, String: strconv.Itoa(int(idPaketPl.Int32))}
	// fmt.Println("strIdPaketPl: ", strIdPaketPl.String)

	strIdTerminPl := pgtype.Text{Valid:true, String: strconv.Itoa(int(idTerminPl.Int32))}
	// fmt.Println("strIdTerminPl: ", strIdTerminPl.String)


	args := pgx.NamedArgs{
		"id_paket_pl": strIdPaketPl,
		"jenis_signature": jenisSignature,
		"id_termin_pl": strIdTerminPl,
	}

  rwTblPesanan, err := db.PromiseSibela.Query(ctx, qTblSignature, args)
  if err != nil {
    log.Fatal("qTblSignature Failed, " + err.Error() + " " + qTblSignature)
  }

  allTblSignature, err := pgx.CollectRows(rwTblPesanan, pgx.RowToStructByName[TblSignature])
  if err != nil {
    log.Fatal("failed collecting rwTblPesanan, " + err.Error())
  }
  defer rwTblPesanan.Close()

	return allTblSignature
}

func GetAllSignatureSptjm(idPaketPl pgtype.Int4, jenisPaket pgtype.Text, idTerminPl pgtype.Int4, jenisSignature  pgtype.Text) []TblSignature{

	ctx := context.Background()

	var qTblSignature string

	switch jenisPaket.String {
	case "luardpt":

		qTblSignature = `
		SELECT * from tbl_signature
		WHERE
		id_paket_pl = @id_paket_pl AND
		jenis_signature = @jenis_signature
		`
	case "dpt":

		qTblSignature = `
		SELECT * from tbl_signature
		WHERE
		id_paket_dptpl = @id_paket_pl AND
		jenis_signature = @jenis_signature
		`

	default:
		log.Fatal("Invalid Jenis Paket")
	}
	
	strIdPaketPl := pgtype.Text{Valid:true, String: strconv.Itoa(int(idPaketPl.Int32))}
	// fmt.Println("strIdPaketPl: ", strIdPaketPl.String)

	strIdTerminPl := pgtype.Text{Valid:true, String: strconv.Itoa(int(idTerminPl.Int32))}
	// fmt.Println("strIdTerminPl: ", strIdTerminPl.String)


	debugSQL := `
	SELECT * from tbl_signature
	WHERE
	id_paket_pl = %v AND
	id_termin_pl = %v AND
	jenis_signature = %v`

	fmt.Printf(debugSQL, strIdPaketPl.String, strIdTerminPl.String, jenisSignature.String)


	args := pgx.NamedArgs{
		"id_paket_pl": strIdPaketPl,
		"jenis_signature": jenisSignature,
	}

  rwTblPesanan, err := db.PromiseSibela.Query(ctx, qTblSignature, args)
  if err != nil {
    log.Fatal("qTblSignature Failed, " + err.Error() + " " + qTblSignature)
  }

  allTblSignature, err := pgx.CollectRows(rwTblPesanan, pgx.RowToStructByName[TblSignature])
  if err != nil {
    log.Fatal("failed collecting rwTblPesanan, " + err.Error())
  }
  defer rwTblPesanan.Close()

	return allTblSignature
}
