// ref_vendor_register model

package rvregmodel

import (
	"context"
	"database/sql"
	"fmt"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

type RefVenReg struct {
	KodeRegister pgtype.Int4
}

func InsertRefVendorRegister(profilePenyedia structs.TblProfilePenyedia, user structs.User) pgtype.Int4 {
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
      nomor_handphone,
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
      @nomor_handphone,
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
		"password":            user.Password,
		"nomor_handphone":     sql.NullString{Valid: false},
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
		"kode_vendor":         profilePenyedia.IdProfilPenyedia,
	}
	// connec, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	rwInsRefVenReg, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_vendor_register, " + errIns.Error())
	}
	defer rwInsRefVenReg.Close()
  
	allRefVenReg, errRwIns := pgx.CollectRows(rwInsRefVenReg, pgx.RowToStructByName[RefVenReg])
	if errRwIns != nil {
		log.Fatal("failed collecting errRwIns, " + errRwIns.Error())
	}

	return allRefVenReg[0].KodeRegister
}
