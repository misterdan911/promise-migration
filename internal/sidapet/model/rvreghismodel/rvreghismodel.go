// ref_vendor_register_history model

package rvreghismodel

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"promise-migration/internal/model/dbsidapet/helperusermodel"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
	"promise-migration/internal/structs"
)

type RefVenReg struct {
	KodeRegister pgtype.Int4
}

func InsertRefVendorRegHistory(profilePenyedia structs.TblProfilePenyedia, helperuser helperusermodel.HelperUser, kodeRegister pgtype.Int4) {
	ctx := context.Background()

	qIns := `
    INSERT INTO ref_vendor_reg_history (
      kode_register,
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
      @kode_register,
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
		"kode_register":       kodeRegister,
		"kode_jenis_vendor":   profilePenyedia.IdJenisPenyedia,
		"nama_perusahaan":     profilePenyedia.Nama,
		"email":               profilePenyedia.Email,
		"password":            helperuser.VmsUserPass,
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
		"kode_vendor":         helperuser.KodeVendor,
	}
	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("no_telp: " + profilePenyedia.NoTelp.String)
		log.Fatal("unable to insert ref_vendor_reg_history, " + errIns.Error())
	}

}
