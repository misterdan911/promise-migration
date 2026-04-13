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
		// g.UrlBasePathExisting = "https://sidapet-promiseterbuka.ut.ac.id"
		g.UrlBasePathExisting = "https://prodev.ut.ac.id/sidapetuat"
		g.AppName = "SI-DaPeT"

		// tbl_akta_perusahaan
		// appdoc.MigrateFileFromVmsDbTblAktaPerusahaan()	// nothing new

		// tbl_direksi_perusahaan
		// appdoc.MigrateFileFromVmsDbTblDireksiPerusahaan()	// nothing new

		// tbl_fasilitas_perusahaan
		// appdoc.MigrateFileFromVmsDbTblFasilitasPerusahaan()	// banyak yang 404	// nothing new

		// tbl_ijin_usaha_perusahaan
		// appdoc.MigrateFileFromVmsDbTblIjinUsahaPerusahaan()	nothing new

		// tbl_internasional_legal_document
		// appdoc.MigrateFileFromVmsDbTblInternasionalLegalDocument() // jalanin 1 kali aja, data hampir gak pernah berubah

		// tbl_komisaris_perusahaan
		// appdoc.MigrateFileFromVmsDbTblKomisarisPerusahaan()	nothing new

		// // tbl_paket
		// appdoc.MigrateFileFromVmsDbTblPaket()	nothing new

		// tbl_pengalaman_perorangan
		// appdoc.MigrateFileFromVmsDbTblPengalamanPerorangan()	nothing new

		// tbl_pengalaman_sekarang
		// appdoc.MigrateFileFromVmsDbTblPengalamanSekarang()	nothing new

		// tbl_pengalaman3
		// appdoc.MigrateFileFromVmsDbTblPengalaman3()	nothing new

		// tbl_pengalaman10
		// appdoc.MigrateFileFromVmsDbTblPengalaman10()	nothing new

		// tbl_personalia_perusahaan
		// appdoc.MigrateFileFromVmsDbTblPersonaliaPerusahaan()	nothing new

		// tbl_profile_penyedia
		// appdoc.MigrateFileFromVmsDbTblProfilePenyedia()	nothing new

		// tbl_saham_perusahaan
		// appdoc.MigrateFileFromVmsDbTblSahamPerusahaan()	nothing new

		// tbl_sertif_perorangan
		// appdoc.MigrateFileFromVmsDbTblSertifPerorangan()	nothing new

		// tbl_surat_keputusan

		// g.BasePath = "https://sibela-promiseterbuka.ut.ac.id"
		g.UrlBasePathExisting = "https://prodev.ut.ac.id/sibelauat"

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
		// appdoc.MigrateFileFromPromiseSibelaTblPersonaliaPerusahaan()

		// tbl_profile_penyedia
		// appdoc.MigrateFileFromPromiseSibelaTblProfilePenyedia() // New

		// tbl_saham_perusahaan
		// appdoc.MigrateFileFromPromiseSibelaTblSahamPerusahaan()

		// tbl_sertif_perorangan
		// appdoc.MigrateFileFromPromiseSibelaTblSertifPerorangan()

		// tbl_surat_keputusan

		g.AppName = "Si-BeLa"

		// tbl_paket_pl
		// appdoc.MigrateFileFromPromiseSibelaTblPaketPl()

		// tbl_paketdpt_pl
		// appdoc.MigrateFileFromPromiseSibelaTblPaketDptPl()

		// tbl_signature
		// appdoc.MigrateFileFromPromiseSibelaTblSignature()

		// tbl_sptb_pl
		// appdoc.MigrateFileFromPromiseSibelaTblSptbPl()

		// tbl_sptbdpt_pl
		// appdoc.MigrateFileFromPromiseSibelaTblSptbDptPl()

		// appdoc.MigrateFileFromPromiseSibelaTblSptjm()
		// appdoc.MigrateFileFromPromiseSibelaTblSptjmDpt()
		// appdoc.MigrateFileFromPromiseSibelaTblSuratBap()
		// appdoc.MigrateFileFromPromiseSibelaTblSuratBapDpt()

		// tbl_surat_pesanan_pl
		// appdoc.MigrateFileFromPromiseSibelaTblSuratPesananPl()

		// appdoc.MigrateFileFromPromiseSibelaTblTerminPl()
		// appdoc.MigrateFileFromPromiseSibelaTblTerminDptPl()
		// appdoc.MigrateFileFromPromiseSibelaTblUndanganPl()
		// appdoc.MigrateFileFromPromiseSibelaTblUndanganDptPl()
		appdoc.MigrateFileFromPromiseSibelaUangPersediaanBukti()

		g.AppName = "Si-PLang"
		// g.UrlBasePathExisting = "https://siplang-promiseterbuka.ut.ac.id"
		g.UrlBasePathExisting = "https://prodev.ut.ac.id/siplanguat"

		// tbl_paket_pl
		// appdoc.MigrateFileFromPromiseSiplangTblPaketPl()

		// tbl_signature
		// appdoc.MigrateFileFromPromiseSiplangTblSignature()

		// tbl_sptb_pl
		// appdoc.MigrateFileFromPromiseSiplangTblSptbPl()

		// appdoc.MigrateFileFromPromiseSiplangTblSptjm()
		// appdoc.MigrateFileFromPromiseSiplangTblSuratBap()

		// tbl_surat_pesanan_pl
		// appdoc.MigrateFileFromPromiseSiplangTblSuratPesananPl()

		// appdoc.MigrateFileFromPromiseSiplangTblTerminPl()
		// appdoc.MigrateFileFromPromiseSiplangTblUndanganPl()

	},
}

func init() {
	// Emang Kosongz
}


// kode_helper_dokumen terakhir: 163178