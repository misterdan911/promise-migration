package refvendorreghistorymodel

import (
	"context"
	"fmt"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type RefVendorRegHistory struct {
	KodeRegister         pgtype.Int4
	KodeJenisVendor      pgtype.Int4
	NamaPerusahaan       pgtype.Text
	Email                pgtype.Text
	Password             pgtype.Text
	NoTelp               pgtype.Text
	NamaNarahubung       pgtype.Text
	NoWaNarahubung       pgtype.Text
	Swafoto              pgtype.Text
	StatusRegister       pgtype.Text
	AlasanDitolak        pgtype.Text
	UserVerif            pgtype.Text
	Udcr                 pgtype.Timestamptz
	Udch                 pgtype.Timestamptz
	Message              pgtype.Text
	Similarity           pgtype.Text
	DistancePercentage   pgtype.Numeric
	DistancePoint        pgtype.Numeric
	Keypass              pgtype.Text
	KodeVendor           pgtype.Int4
	Npwp                 pgtype.Text
	FileNpwp             pgtype.Text
	EncryptKeyNpwp       pgtype.Text
	Nik                  pgtype.Text
}



func InsertNew(refVendorRegisterHistory RefVendorRegHistory) {

	fmt.Printf("Masuk sini\n")

	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_vendor_reg_history (
		kode_jenis_vendor,
		nama_perusahaan,
		email,
		password,
		no_telp,
		nama_narahubung,
		no_wa_narahubung,
		swafoto,
		status_register,
		alasan_ditolak,
		user_verif,
		udcr,
		udch,
		message,
		similarity,
		distance_percentage,
		distance_point,
		keypass,
		kode_vendor,
		npwp,
		file_npwp,
		encrypt_key_npwp,
		nik
	) VALUES (
		@kode_jenis_vendor,
		@nama_perusahaan,
		@email,
		@password,
		@no_telp,
		@nama_narahubung,
		@no_wa_narahubung,
		@swafoto,
		@status_register,
		@alasan_ditolak,
		@user_verif,
		@udcr,
		@udch,
		@message,
		@similarity,
		@distance_percentage,
		@distance_point,
		@keypass,
		@kode_vendor,
		@npwp,
		@file_npwp,
		@encrypt_key_npwp,
		@nik
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_jenis_vendor":    refVendorRegisterHistory.KodeJenisVendor,
		"nama_perusahaan":      refVendorRegisterHistory.NamaPerusahaan,
		"email":                refVendorRegisterHistory.Email,
		"password":             refVendorRegisterHistory.Password,
		"no_telp":              refVendorRegisterHistory.NoTelp,
		"nama_narahubung":      refVendorRegisterHistory.NamaNarahubung,
		"no_wa_narahubung":     refVendorRegisterHistory.NoWaNarahubung,
		"swafoto":              refVendorRegisterHistory.Swafoto,
		"status_register":      refVendorRegisterHistory.StatusRegister,
		"alasan_ditolak":       refVendorRegisterHistory.AlasanDitolak,
		"user_verif":           refVendorRegisterHistory.UserVerif,
		"udcr":                 refVendorRegisterHistory.Udcr,
		"udch":                 refVendorRegisterHistory.Udch,
		"message":              refVendorRegisterHistory.Message,
		"similarity":           refVendorRegisterHistory.Similarity,
		"distance_percentage":  refVendorRegisterHistory.DistancePercentage,
		"distance_point":       refVendorRegisterHistory.DistancePoint,
		"keypass":              refVendorRegisterHistory.Keypass,
		"kode_vendor":          refVendorRegisterHistory.KodeVendor,
		"npwp":                 refVendorRegisterHistory.Npwp,
		"file_npwp":            refVendorRegisterHistory.FileNpwp,
		"encrypt_key_npwp":     refVendorRegisterHistory.EncryptKeyNpwp,
		"nik":                  refVendorRegisterHistory.Nik,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qInsert, args)

	if errIns != nil {
		log.Fatal("unable to insert ref_vendor_reg_history, " + errIns.Error())
	}

	// defer rwInsRefVenReg.Close()

	// allRefVenReg, errRwIns := pgx.CollectRows(rwInsRefVenReg, pgx.RowToStructByName[refvendorregistermodel.RefVendorRegisterHistory])
	// if errRwIns != nil {
	// 	fmt.Println("nama_perusahaan: " + refVendorRegisterHistory.NamaPerusahaan.String + ghelper.GetLen(refVendorRegisterHistory.NamaPerusahaan.String))
	// 	fmt.Println("email: " + refVendorRegisterHistory.Email.String + ghelper.GetLen(refVendorRegisterHistory.Email.String))
	// 	fmt.Println("password: " + refVendorRegisterHistory.Password.String + ghelper.GetLen(refVendorRegisterHistory.Password.String))
	// 	fmt.Println("no_telp: " + refVendorRegisterHistory.NoTelp.String + ghelper.GetLen(refVendorRegisterHistory.NoTelp.String))
	// 	log.Fatal("failed collecting RefVenReg, " + errRwIns.Error())
	// }

	// return allRefVenReg[0]
}