// ref_vendor_register model

package refvendorregistermodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/internal/ghelper"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type RefVenReg struct {
	KodeRegister pgtype.Int4
}

type RefVendorRegister struct {
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

/*
func InsertRefVendorRegister(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) pgtype.Int4 {
  ctx := context.Background()

	if profilePenyedia.Email.Valid == false {
		log.Fatal("Email di tabel users kosong")
	}


		"kode_jenis_vendor":   profilePenyedia.IdJenisPenyedia,
		"nama_perusahaan":     profilePenyedia.Nama,
		"email":               helperUser.VmsUserEmail,
		"password":            helperUser.VmsUserPass,
		"no_telp":             profilePenyedia.NoTelp,
		"status_register":     sql.NullString{Valid: true, String: "terima"},
		"udcr":                profilePenyedia.CreateTime,
		"udch":                profilePenyedia.UpdateTime,
		"kode_vendor":         helperUser.KodeVendor,

	qIns := `
    INSERT INTO ref_vendor_register (
      kode_jenis_vendor,
      nama_perusahaan,
      email,
      "password",
      no_telp,
      nama_narahubung,
      swafoto,
      status_register,
      alasan_ditolak,
      user_verif,
      udcr,
      udch,
      "message",
      similarity,
      distance_percentage,
      distance_point,
      keypass,
      kode_vendor
    ) VALUES (
      @kode_jenis_vendor,
      @nama_perusahaan,
      @email,
      @password,
      @no_telp,
      @nama_narahubung,
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
      @kode_vendor
    ) RETURNING kode_register`

	args := pgx.NamedArgs{
		"kode_jenis_vendor":   profilePenyedia.IdJenisPenyedia,
		"nama_perusahaan":     profilePenyedia.Nama,
		"email":               helperUser.VmsUserEmail,
		"password":            helperUser.VmsUserPass,
		"no_telp":             profilePenyedia.NoTelp,
		"nama_narahubung":     profilePenyedia.ContactPerson,
		"swafoto":             sql.NullString{Valid: false},
		"status_register":     sql.NullString{Valid: true, String: "terima"},
		"alasan_ditolak":      sql.NullString{Valid: false},
		"user_verif":          sql.NullString{Valid: false},
		"udcr":                profilePenyedia.CreateTime,
		"udch":                profilePenyedia.UpdateTime,
		"message":             sql.NullString{Valid: false},
		"similarity":          sql.NullString{Valid: false},
		"distance_percentage": sql.NullInt32{Valid: false},
		"distance_point":      sql.NullInt32{Valid: false},
		"keypass":             sql.NullString{Valid: false},
		"kode_vendor":         helperUser.KodeVendor,
	}
	// connec, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	rwInsRefVenReg, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_vendor_register, " + errIns.Error())
	}
	defer rwInsRefVenReg.Close()

	allRefVenReg, errRwIns := pgx.CollectRows(rwInsRefVenReg, pgx.RowToStructByName[RefVenReg])
	if errRwIns != nil {
		fmt.Println("nama_perusahaan: " + profilePenyedia.Nama.String + ghelper.GetLen(profilePenyedia.Nama.String))
		fmt.Println("email: " + profilePenyedia.Email.String + ghelper.GetLen(profilePenyedia.Email.String))
		fmt.Println("password: " + helperUser.VmsUserPass.String + ghelper.GetLen(helperUser.VmsUserPass.String))
		fmt.Println("no_telp: " + profilePenyedia.NoTelp.String + ghelper.GetLen(profilePenyedia.NoTelp.String))
		log.Fatal("failed collecting RefVenReg, " + errRwIns.Error())
	}

	refVendorRegister := RefVendorRegister{
		KodeJenisVendor:    profilePenyedia.IdJenisPenyedia,
		NamaPerusahaan:     profilePenyedia.Nama,
		Email:              helperUser.VmsUserEmail,
		Password:           helperUser.VmsUserPass,
		NoTelp:             profilePenyedia.NoTelp,
		StatusRegister:     pgtype.Text{Valid: true, String: "terima"},
		Udcr:               profilePenyedia.CreateTime,
		Udch:               profilePenyedia.UpdateTime,
		KodeVendor:         helperUser.KodeVendor,
	}

	refVendorRegister = InsertNew(refVendorRegister)

	return refVendorRegister.KodeRegister
}
*/

func GetAllData() []RefVendorRegister {
	var allVendors []RefVendorRegister
	ctx := context.Background()

	qRefVendorRegister := `
  SELECT
		kode_register,
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
  FROM ref_vendor_register`

	rows, err := db.DbSidapet.Query(ctx, qRefVendorRegister)
	if err != nil {
		log.Fatal("qRefVendorRegister Failed, " + err.Error() + " " + qRefVendorRegister)
	}

	allVendors, err = pgx.CollectRows(rows, pgx.RowToStructByName[RefVendorRegister])
	if err != nil {
		log.Fatal("failed collecting rows (ref_vendor_register.go:GetAllData), " + err.Error())
	}
	defer rows.Close()

	return allVendors
}

func InsertNew(refVendorRegister RefVendorRegister) RefVendorRegister {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_vendor_register (
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
		"kode_jenis_vendor":    refVendorRegister.KodeJenisVendor,
		"nama_perusahaan":      refVendorRegister.NamaPerusahaan,
		"email":                refVendorRegister.Email,
		"password":             refVendorRegister.Password,
		"no_telp":              refVendorRegister.NoTelp,
		"nama_narahubung":      refVendorRegister.NamaNarahubung,
		"no_wa_narahubung":     refVendorRegister.NoWaNarahubung,
		"swafoto":              refVendorRegister.Swafoto,
		"status_register":      refVendorRegister.StatusRegister,
		"alasan_ditolak":       refVendorRegister.AlasanDitolak,
		"user_verif":           refVendorRegister.UserVerif,
		"udcr":                 refVendorRegister.Udcr,
		"udch":                 refVendorRegister.Udch,
		"message":              refVendorRegister.Message,
		"similarity":           refVendorRegister.Similarity,
		"distance_percentage":  refVendorRegister.DistancePercentage,
		"distance_point":       refVendorRegister.DistancePoint,
		"keypass":              refVendorRegister.Keypass,
		"kode_vendor":          refVendorRegister.KodeVendor,
		"npwp":                 refVendorRegister.Npwp,
		"file_npwp":            refVendorRegister.FileNpwp,
		"encrypt_key_npwp":     refVendorRegister.EncryptKeyNpwp,
		"nik":                  refVendorRegister.Nik,
	}

	rwInsRefVenReg, errIns := db.DbSidapet.Query(ctx, qInsert, args)

	if errIns != nil {
		log.Fatal("unable to insert ref_vendor_register, " + errIns.Error())
	}

	defer rwInsRefVenReg.Close()

	allRefVenReg, errRwIns := pgx.CollectRows(rwInsRefVenReg, pgx.RowToStructByName[RefVendorRegister])
	if errRwIns != nil {
		fmt.Println("nama_perusahaan: " + refVendorRegister.NamaPerusahaan.String + ghelper.GetLen(refVendorRegister.NamaPerusahaan.String))
		fmt.Println("email: " + refVendorRegister.Email.String + ghelper.GetLen(refVendorRegister.Email.String))
		fmt.Println("password: " + refVendorRegister.Password.String + ghelper.GetLen(refVendorRegister.Password.String))
		fmt.Println("no_telp: " + refVendorRegister.NoTelp.String + ghelper.GetLen(refVendorRegister.NoTelp.String))
		log.Fatal("failed collecting RefVenReg, " + errRwIns.Error())
	}

	return allRefVenReg[0]
}