// ref_vendor_register model

package refvendorregistermodel

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbsidapet/helperusermodel"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
	"promise-migration/internal/structs"
)

type RefVenReg struct {
	KodeRegister pgtype.Int4
}

type RefVendorRegister struct {
	KodeRegister       pgtype.Int4
	KodeJenisVendor    pgtype.Int2
	NamaPerusahaan     pgtype.Text
	Email              pgtype.Text
	Password           pgtype.Text
	NoTelp             pgtype.Text
	NamaNarahubung     pgtype.Text
	NoWaNarahubung     pgtype.Text
	Swafoto            pgtype.Text
	StatusRegister     pgtype.Text // Assuming status_persetujuan is text-based
	AlasanDitolak      pgtype.Text
	UserVerif          pgtype.Text
	Udcr               pgtype.Timestamptz
	Udch               pgtype.Timestamptz
	Message            pgtype.Text
	Similarity         pgtype.Text
	DistancePercentage pgtype.Numeric
	DistancePoint      pgtype.Numeric
	Keypass            pgtype.Text
	KodeVendor         pgtype.Int4
}

func InsertRefVendorRegister(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) pgtype.Int4 {
	ctx := context.Background()

	if profilePenyedia.Email.Valid == false {
		log.Fatal("Email di tabel users kosong")
	}

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
		"email":               profilePenyedia.Email,
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

	return allRefVenReg[0].KodeRegister
}

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
    kode_vendor
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
