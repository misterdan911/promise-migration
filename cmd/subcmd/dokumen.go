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

		db.ConnectMyPromiseSiplang()
		defer db.MyPromiseSiplang.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		ghelper.TruncateLog("dokumen.log")

		// g.BasePath = "https://sidapet-promiseterbuka.ut.ac.id"
		g.UrlBasePathExisting = "https://sidapet-promiseterbuka.ut.ac.id"
		g.AppName = "SI-DaPeT"

		// tbl_akta_perusahaan
		// appdoc.MigrateFileFromVmsDbTblAktaPercusahaan()

		// tbl_direksi_perusahaan
		// appdoc.MigrateFileFromVmsDbTblDireksiPerusahaan()

		// tbl_fasilitas_perusahaan
		// appdoc.MigrateFileFromVmsDbTblFasilitasPerusahaan()	// banyak yang 404

		// tbl_ijin_usaha_perusahaan
		// appdoc.MigrateFileFromVmsDbTblIjinUsahaPerusahaan()

		// tbl_internasional_legal_document

		// tbl_komisaris_perusahaan
		// appdoc.MigrateFileFromVmsDbTblKomisarisPerusahaan()

		// // tbl_paket
		// appdoc.MigrateFileFromVmsDbTblPaket()

		// tbl_pengalaman_perorangan
		// appdoc.MigrateFileFromVmsDbTblPengalamanPerorangan()

		// tbl_pengalaman_sekarang
		// appdoc.MigrateFileFromVmsDbTblPengalamanSekarang()

		// tbl_pengalaman3
		// appdoc.MigrateFileFromVmsDbTblPengalaman3()

		// tbl_pengalaman10
		// appdoc.MigrateFileFromVmsDbTblPengalaman10()

		// tbl_personalia_perusahaan
		// appdoc.MigrateFileFromVmsDbTblPersonaliaPerusahaan()

		// tbl_profile_penyedia
		// appdoc.MigrateFileFromVmsDbTblProfilePenyedia()

		// tbl_saham_perusahaan
		// appdoc.MigrateFileFromVmsDbTblSahamPerusahaan()

		// tbl_sertif_perorangan
		// appdoc.MigrateFileFromVmsDbTblSertifPerorangan()

		// tbl_surat_keputusan

		// g.BasePath = "https://sibela-promiseterbuka.ut.ac.id"
		g.UrlBasePathExisting = "https://sibela-promiseterbuka.ut.ac.id"

		// tbl_akta_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblAktaPerusahaan()

		// tbl_direksi_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblDireksiPerusahaan()

		// tbl_fasilitas_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblFasilitasPerusahaan()

		// tbl_ijin_usaha_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblIjinUsahaPerusahaan()

		// tbl_internasional_legal_document

		// tbl_komisaris_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblKomisarisPerusahaan()

		// tbl_pengalaman_perorangan
		// appdoc.MigrateFileFromPromiseSibelaTblPengalamanPerorangan()

		// tbl_pengalaman_sekarang
		// appdoc.MigrateFileFromPromiseSibelaTblPengalamanSekarang()

		// tbl_pengalaman3
		// appdoc.MigrateFileFromPromiseSibelaTblPengalaman3()

		// tbl_pengalaman10
		// appdoc.MigrateFileFromPromiseSibelaTblPengalaman10()

		// tbl_personalia_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblPersonaliaPerusahaan() // untested

		// tbl_profile_penyedia
		// appdoc.MigrateFileFromPromiseSibelaTblProfilePenyedia() //untested

		// tbl_saham_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblSahamPerusahaan() // untested

		// tbl_sertif_perorangan
		// appdoc.MigrateFileFromPromiseSibelaTblSertifPerorangan()

		// tbl_surat_keputusan

		g.AppName = "Si-BeLa"

		// tbl_paket_pl
		// appdoc.MigrateFileFromPromiseSibelaTblPaketPl()

		// tbl_paketdpt_pl
		// appdoc.MigrateFileFromPromiseSibelaTblPaketDptPl()	// skip dulu nama filenya panjang2

		// tbl_signature
		// appdoc.MigrateFileFromPromiseSibelaTblSignature()

		// tbl_sptb_pl
		// appdoc.MigrateFileFromPromiseSibelaTblSptbPl()

		// tbl_sptbdpt_pl
		// appdoc.MigrateFileFromPromiseSibelaTblSptbDptPl()

		// appdoc.MigrateFileFromPromiseSibelaTblSptjm()
		// appdoc.MigrateFileFromPromiseSibelaTblSptjmDpt()		//untested
		// appdoc.MigrateFileFromPromiseSibelaTblSuratBap()		//untested
		// appdoc.MigrateFileFromPromiseSibelaTblSuratBapDpt()		//untested


		// tbl_surat_pesanan_pl
		// appdoc.MigrateFileFromPromiseSibelaTblSuratPesananPl()


		// appdoc.MigrateFileFromPromiseSibelaTblTerminPl()
		// appdoc.MigrateFileFromPromiseSibelaTblTerminDptPl()
		// appdoc.MigrateFileFromPromiseSibelaTblUndanganPl()
		// appdoc.MigrateFileFromPromiseSibelaTblUndanganDptPl()


		g.AppName = "Si-PLang"
		g.UrlBasePathExisting = "https://siplang-promiseterbuka.ut.ac.id"

		// tbl_paket_pl
		appdoc.MigrateFileFromPromiseSiplangTblPaketPl()


	},
}

func init() {
	// Emang Kosongz
}
