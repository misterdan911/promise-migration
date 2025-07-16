package subcmd

import (
	"promise-migration/db"
	"promise-migration/internal/appdoc"
	"promise-migration/internal/g"

	"github.com/spf13/cobra"
)

var AppDocCmd = &cobra.Command{
  Use:   "appdoc",
  Short: "Migrasi semua file dan dokumen fisik",
  Long:  `Perintah ini untuk melakukan migrasi semua file dan dokumen fisik`,
  Run: func(cmd *cobra.Command, args []string) {

    db.ConnectMyVmsDb()
    defer db.MyVmsDb.Close()
    
    db.ConnectDbSidapet()
    defer db.DbSidapet.Close()

    g.BasePath = "https://sidapet-promiseterbuka.ut.ac.id"

    // tbl_akta_perusahaan
    // tbl_direksi_perusahaan
    // tbl_fasilitas_perusahaan
    // tbl_ijin_usaha_perusahaan
    // tbl_internasional_legal_document
    // tbl_komisaris_perusahaan
    // tbl_paket
    // tbl_pengalaman_perorangan
    // tbl_pengalaman_sekarang
    // tbl_pengalaman3
    // tbl_pengalaman10
    // tbl_personalia_perusahaan
    appdoc.MigrateFileFromVmsDbTblProfilePenyedia()
    // tbl_saham_perusahaan
    // tbl_sertif_perorangan
    // tbl_surat_keputusan

  },
}

func init() {
  // Emang Kosongz
}
