package subcmd

import (
	"promise-migration/db"
	"promise-migration/internal/appdoc"
	"promise-migration/internal/g"
	"promise-migration/internal/ghelper"

	"github.com/spf13/cobra"
)

var DokumenCmd = &cobra.Command{
	Use:   "dokumen",
	Short: "Migrasi semua file dan dokumen fisik",
	Long:  `Perintah ini untuk melakukan migrasi semua file dan dokumen fisik`,
	Run: func(cmd *cobra.Command, args []string) {

		db.ConnectMyVmsDb()
		defer db.MyVmsDb.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		ghelper.TruncateLog("dokumen.log")

		g.BasePath = "https://sidapet-promiseterbuka.ut.ac.id"

		// tbl_akta_perusahaan
		// appdoc.MigrateFileFromVmsDbTblAktaPerusahaan()

		// tbl_direksi_perusahaan
		// tbl_fasilitas_perusahaan
		// tbl_ijin_usaha_perusahaan
		// tbl_internasional_legal_document
		// tbl_komisaris_perusahaan
		// tbl_paket

		// tbl_pengalaman_perorangan
		// appdoc.MigrateFileFromVmsDbTblPengalamanPerorangan() // untested

		// tbl_pengalaman_sekarang
		// tbl_pengalaman3
		// tbl_pengalaman10
		// tbl_personalia_perusahaan

		appdoc.MigrateFileFromVmsDbTblProfilePenyedia()

		// tbl_saham_perusahaan


		// tbl_sertif_perorangan
		// appdoc.MigrateFileFromVmsDbTblSertifPerorangan() // untested


		// tbl_surat_keputusan

		g.BasePath = "https://sibela-promiseterbuka.ut.ac.id/"

		// tbl_akta_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblAktaPerusahaan()	// belum ada

		// tbl_pengalaman_perorangan
		// appdoc.MigrateFileFromPromiseSibelaTblPengalamanPerorangan() // untested

		// tbl_sertif_perorangan
		// appdoc.MigrateFileFromPromiseSibelaTblSertifPerorangan() // untested

	},
}

func init() {
	// Emang Kosongz
}
