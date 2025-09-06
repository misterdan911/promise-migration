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

		db.ConnectMyPromiseSibela()
		defer db.MyPromiseSibela.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		ghelper.TruncateLog("dokumen.log")

		g.BasePath = "https://sidapet-promiseterbuka.ut.ac.id"
		g.AppName = "SI-DaPeT"

		// tbl_akta_perusahaan
		// appdoc.MigrateFileFromVmsDbTblAktaPerusahaan()	// untested

		// tbl_direksi_perusahaan
		// appdoc.MigrateFileFromVmsDbTblDireksiPerusahaan()	// untested

		// tbl_fasilitas_perusahaan
		// appdoc.MigrateFileFromVmsDbTblFasilitasPerusahaan() // untested

		// tbl_ijin_usaha_perusahaan
		// appdoc.MigrateFileFromVmsDbTblIjinUsahaperusahaan()	// untested

		// tbl_internasional_legal_document

		// tbl_komisaris_perusahaan
		// appdoc.MigrateFileFromVmsDbTblKomisarisPerusahaan()	// untested

		// tbl_paket
		// appdoc.MigrateFileFromVmsDbTblPaket()	// untested

		// tbl_pengalaman_perorangan
		// appdoc.MigrateFileFromVmsDbTblPengalamanPerorangan()

		// tbl_pengalaman_sekarang
		// appdoc.MigrateFileFromVmsDbTblPengalamanSekarang()	// untested

		// tbl_pengalaman3
		// appdoc.MigrateFileFromVmsDbTblPengalaman3()	// untested

		// tbl_pengalaman10
		// appdoc.MigrateFileFromVmsDbTblPengalaman10()	// untested

		// tbl_personalia_perusahaan
		// appdoc.MigrateFileFromVmsDbTblPersonaliaPerusahaan()	// untested

		// tbl_profile_penyedia
		// appdoc.MigrateFileFromVmsDbTblProfilePenyedia()

		// tbl_saham_perusahaan
		// appdoc.MigrateFileFromVmsDbTblSahamPerusahaan() // untested

		// tbl_sertif_perorangan
		// appdoc.MigrateFileFromVmsDbTblSertifPerorangan()

		// tbl_surat_keputusan

		g.BasePath = "https://sibela-promiseterbuka.ut.ac.id"

		// tbl_akta_perusahaan
		appdoc.MigrateFileFromPromiseSibelaTblAktaPerusahaan() // belum ada

		// tbl_direksi_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblDireksiPerusahaan()	// untested

		// tbl_fasilitas_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblFasilitasPerusahaan	// incomplete

		// tbl_ijin_usaha_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblIjinUsahaperusahaan()	// incomplete

		// tbl_internasional_legal_document

		// tbl_komisaris_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblKomisarisPerusahaan()	// incomplete

		// tbl_paket
		// appdoc.MigrateFileFromPromiseSibelaTblPaket()	// incomplete

		// tbl_pengalaman_perorangan
		// appdoc.MigrateFileFromPromiseSibelaTblPengalamanPerorangan()

		// tbl_pengalaman_sekarang
		// appdoc.MigrateFileFromPromiseSibelaTblPengalamanSekarang()	// incomplete

		// tbl_pengalaman3
		// appdoc.MigrateFileFromPromiseSibelaTblPengalaman3()	// incomplete

		// tbl_pengalaman10
		// appdoc.MigrateFileFromPromiseSibelaTblPengalaman10()	// incomplete

		// tbl_personalia_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblPersonaliaPerusahaan()	// incomplete

		// tbl_profile_penyedia
		// appdoc.MigrateFileFromPromiseSibelaTblProfilePenyedia()

		// tbl_saham_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblSahamPerusahaan()	// incomplete

		// tbl_sertif_perorangan
		// appdoc.MigrateFileFromPromiseSibelaTblSertifPerorangan()

		// tbl_surat_keputusan

	},
}

func init() {
	// Emang Kosongz
}
