package appdoc

import (
	"promise-migration/internal/g"
	"promise-migration/internal/model/mypromise_sibela/tblaktaperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tbldireksiperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tblfasilitasperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tblijinusahaperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpengalamaneroranganmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsertifperoranganmodel"

	"promise-migration/internal/model/mypromise_sibela/tblkomisarisperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpaketdptplmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpaketmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpaketplmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpengalaman10model"
	"promise-migration/internal/model/mypromise_sibela/tblpengalaman3model"
	"promise-migration/internal/model/mypromise_sibela/tblpengalamansekarangmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpersonaliaperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsahamperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsignaturemodel"
	"promise-migration/internal/model/mypromise_sibela/tblsptbdptplmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsptbplmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsptjmmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsptjmdptmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsuratbapmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsuratbapdptmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsuratpesananplmodel"
	"promise-migration/internal/model/mypromise_sibela/tblterminplmodel"
	"promise-migration/internal/model/mypromise_sibela/tbltermindptplmodel"
	"promise-migration/internal/model/mypromise_sibela/tblundanganplmodel"
	"promise-migration/internal/model/mypromise_sibela/tblundangandptplmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateFileFromPromiseSibelaTblPengalamanPerorangan() {

	allTblPengalamanPerorangan, _ := tblpengalamaneroranganmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblPengalamanPerorangan := range allTblPengalamanPerorangan {

		// promise_sibela.tbl_pengalaman_perorangan.path_pnglmn
		if tblPengalamanPerorangan.PathPnglmn.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_pengalaman_perorangan.path_pnglmn"
			g.LogDoc.PkId = tblPengalamanPerorangan.IdPengalaman.Int32

			originalPath.String = tblPengalamanPerorangan.PathPnglmn.String
			ProcessOriginalPath(originalPath)
		}
	}
}

func MigrateFileFromPromiseSibelaTblSertifPerorangan() {

	allTblSertifPerorangan, _ := tblsertifperoranganmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblSertifPerorangan := range allTblSertifPerorangan {

		// promise_sibela.tbl_sertif_perorangan.path_sertif
		if tblSertifPerorangan.PathSertif.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sertif_perorangan.path_sertif"
			g.LogDoc.PkId = tblSertifPerorangan.IdPengalaman.Int32

			originalPath.String = tblSertifPerorangan.PathSertif.String
			ProcessOriginalPath(originalPath)
		}
	}
}

func MigrateFileFromPromiseSibelaTblAktaPerusahaan() {

	allTblAktaPerusahaan, _ := tblaktaperusahaanmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblAktaPerusahaan := range allTblAktaPerusahaan {

		// promise_sibela.tbl_akta_perusahaan.path_akta
		if tblAktaPerusahaan.PathAkta.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_akta_perusahaan.path_akta"
			g.LogDoc.PkId = tblAktaPerusahaan.IdAkta.Int32

			originalPath.String = tblAktaPerusahaan.PathAkta.String
			ProcessOriginalPath(originalPath)
		}

		if tblAktaPerusahaan.PathAktaAkhir.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_akta_perusahaan.path_akta_akhir"
			g.LogDoc.PkId = tblAktaPerusahaan.IdAkta.Int32

			originalPath.String = tblAktaPerusahaan.PathAktaAkhir.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_direksi_perusahaan
func MigrateFileFromPromiseSibelaTblDireksiPerusahaan() {

	allTblDireksiPerusahaan, _ := tbldireksiperusahaanmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblDireksiPerusahaan := range allTblDireksiPerusahaan {

		// promise_sibela.tbl_direksi_perusahaan.path_ktp_direksi
		if tblDireksiPerusahaan.PathKtpDireksi.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_direksi_perusahaan.path_ktp_direksi"
			g.LogDoc.PkId = tblDireksiPerusahaan.IdDireksiPerus.Int32

			originalPath.String = tblDireksiPerusahaan.PathKtpDireksi.String
			ProcessOriginalPath(originalPath)
		}

	}
}

// tbl_fasilitas_perusahaan
func MigrateFileFromPromiseSibelaTblFasilitasPerusahaan() {
	allTblFasilitasPerusahaan, _ := tblfasilitasperusahaanmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblFasilitasPerusahaan := range allTblFasilitasPerusahaan {

		// Process path_fasilitas field
		if tblFasilitasPerusahaan.PathFasilitas.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_fasilitas_perusahaan.path_fasilitas"
			g.LogDoc.PkId = tblFasilitasPerusahaan.IdPeralatan.Int32

			originalPath.String = tblFasilitasPerusahaan.PathFasilitas.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_ijin_usaha_perusahaan
func MigrateFileFromPromiseSibelaTblIjinUsahaPerusahaan() {
	allTblIjinUsahaPerusahaan, _ := tblijinusahaperusahaanmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblIjinUsahaPerusahaan := range allTblIjinUsahaPerusahaan {

		// Process path_file_ijin_usaha field
		if tblIjinUsahaPerusahaan.PathIzin.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_ijin_usaha_perusahaan.path_izin"
			g.LogDoc.PkId = tblIjinUsahaPerusahaan.IdIjinUsaha.Int32

			originalPath.String = tblIjinUsahaPerusahaan.PathIzin.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_komisaris_perusahaan
func MigrateFileFromPromiseSibelaTblKomisarisPerusahaan() {
	allTblKomisarisPerusahaan, _ := tblkomisarisperusahaanmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblKomisarisPerusahaan := range allTblKomisarisPerusahaan {

		// Process path_ktp_komisaris field
		if tblKomisarisPerusahaan.PathKtpKomisaris.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_komisaris_perusahaan.path_ktp_komisaris"
			g.LogDoc.PkId = tblKomisarisPerusahaan.IdKomisaris.Int32

			originalPath.String = tblKomisarisPerusahaan.PathKtpKomisaris.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_paket
func MigrateFileFromPromiseSibelaTblPaket() {
	allTblPaket, _ := tblpaketmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblPaket := range allTblPaket {

		// Process path_paket field
		if tblPaket.PathPaket.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_paket.path_paket"
			g.LogDoc.PkId = tblPaket.IdPaket.Int32

			originalPath.String = tblPaket.PathPaket.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_pengalaman_sekarang
func MigrateFileFromPromiseSibelaTblPengalamanSekarang() {
	allTblPengalamanSekarang, _ := tblpengalamansekarangmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblPengalamanSekarang := range allTblPengalamanSekarang {

		// Process path_pnglmn_skrg field
		if tblPengalamanSekarang.PathPnglmnSkrg.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_pengalaman_sekarang.path_pnglmn_skrg"
			g.LogDoc.PkId = tblPengalamanSekarang.IdPengalamanSekarang.Int32

			originalPath.String = tblPengalamanSekarang.PathPnglmnSkrg.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_pengalaman3
func MigrateFileFromPromiseSibelaTblPengalaman3() {
	allTblPengalaman3, _ := tblpengalaman3model.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblPengalaman3 := range allTblPengalaman3 {

		// Process path_pnglmn_3 field
		if tblPengalaman3.PathPnglmn3.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_pengalaman3.path_pnglmn_3"
			g.LogDoc.PkId = tblPengalaman3.IdPengalaman3.Int32

			originalPath.String = tblPengalaman3.PathPnglmn3.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_pengalaman10
func MigrateFileFromPromiseSibelaTblPengalaman10() {
	allTblPengalaman10, _ := tblpengalaman10model.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblPengalaman10 := range allTblPengalaman10 {

		// Process path_pnglmn_10 field
		if tblPengalaman10.PathPnglmn10.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_pengalaman10.path_pnglmn_10"
			g.LogDoc.PkId = tblPengalaman10.IdPengalaman10.Int32

			originalPath.String = tblPengalaman10.PathPnglmn10.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_personalia_perusahaan
func MigrateFileFromPromiseSibelaTblPersonaliaPerusahaan() {
	allTblPersonaliaPerusahaan, _ := tblpersonaliaperusahaanmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblPersonaliaPerusahaan := range allTblPersonaliaPerusahaan {

		// Process path_personal field
		if tblPersonaliaPerusahaan.PathPersonal.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_personalia_perusahaan.path_personal"
			g.LogDoc.PkId = tblPersonaliaPerusahaan.IdPersonalia.Int32

			originalPath.String = tblPersonaliaPerusahaan.PathPersonal.String
			ProcessOriginalPath(originalPath)
		}
	}
}

// tbl_saham_perusahaan
func MigrateFileFromPromiseSibelaTblSahamPerusahaan() {
	allTblSahamPerusahaan, _ := tblsahamperusahaanmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblSahamPerusahaan := range allTblSahamPerusahaan {

		// Process path_saham field
		if tblSahamPerusahaan.PathSaham.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_saham_perusahaan.path_saham"
			g.LogDoc.PkId = tblSahamPerusahaan.IdSaham.Int32

			originalPath.String = tblSahamPerusahaan.PathSaham.String
			ProcessOriginalPath(originalPath)
		}
	}
}

func MigrateFileFromPromiseSibelaTblPaketPl() {
	allRows, _ := tblpaketplmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {

		// Process path_sibela
		if row.PathSibela.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_paket_pl.path_sibela"
			g.LogDoc.PkId = row.IdPaket.Int32

			originalPath.String = row.PathSibela.String
			ProcessOriginalPath(originalPath)
		}

		// Process path_sibela
		if row.PathSibelaPenyedia.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_paket_pl.path_sibela_penyedia_pl"
			g.LogDoc.PkId = row.IdPaket.Int32

			originalPath.String = row.PathSibelaPenyedia.String
			ProcessOriginalPath(originalPath)
		}

	}

}

func MigrateFileFromPromiseSibelaTblPaketDptPl() {
	allRows, _ := tblpaketdptplmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {

		// Process path_sibela
		if row.PathSibela.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_paketdpt_pl.path_sibela_dptpl"
			g.LogDoc.PkId = row.IdPaket.Int32

			originalPath.String = row.PathSibela.String
			ProcessOriginalPath(originalPath)
		}

		// Process path_sibela
		if row.PathSibelaPenyedia.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_paketdpt_pl.path_sibela_penyedia_dptpl"
			g.LogDoc.PkId = row.IdPaket.Int32

			originalPath.String = row.PathSibelaPenyedia.String
			ProcessOriginalPath(originalPath)
		}

	}

}

func MigrateFileFromPromiseSibelaTblSignature() {
	allRows, _ := tblsignaturemodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {

		if row.PathFinalDok.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_signature.path_final_dok"
			g.LogDoc.PkId = row.IdSignature.Int32

			originalPath.String = row.PathFinalDok.String
			ProcessOriginalPath(originalPath)
		}

	}

}

func MigrateFileFromPromiseSibelaTblSptbPl() {
	allRows, _ := tblsptbplmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {

		// dok_non_pkp
		if row.DokNonPkp.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.dok_non_pkp"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.DokNonPkp.String
			ProcessOriginalPath(originalPath)
		}

		// dok_ketentuan_khusus
		if row.DokKetentuanKhusus.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.dok_ketentuan_khusus"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.DokKetentuanKhusus.String
			ProcessOriginalPath(originalPath)
		}

		// dok_ketentuan_khusus_jenis
		if row.DokKetentuanKhususJenis.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.dok_ketentuan_khusus_jenis"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.DokKetentuanKhususJenis.String
			ProcessOriginalPath(originalPath)
		}

		// sptb_file
		if row.SptbFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.sptb_file"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.SptbFile.String
			ProcessOriginalPath(originalPath)
		}

		// file_scan_sptb
		if row.FileScanSptb.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.file_scan_sptb"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.FileScanSptb.String
			ProcessOriginalPath(originalPath)
		}

		// ringkasankontrak_file
		if row.RingkasankontrakFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.ringkasankontrak_file"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.RingkasankontrakFile.String
			ProcessOriginalPath(originalPath)
		}

		// file_scan_rk
		if row.FileScanRk.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.file_scan_rk"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.FileScanRk.String
			ProcessOriginalPath(originalPath)
		}

		// faktur_pajak_file
		if row.FakturPajakFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.faktur_pajak_file"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.FakturPajakFile.String
			ProcessOriginalPath(originalPath)
		}

		// ssp_file
		if row.SspFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptb_pl.ssp_file"
			g.LogDoc.PkId = row.IdSptbPl.Int32

			originalPath.String = row.SspFile.String
			ProcessOriginalPath(originalPath)
		}
	}

}

func MigrateFileFromPromiseSibelaTblSptbDptPl() {
	allRows, _ := tblsptbdptplmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {

		// dok_non_pkp
		if row.DokNonPkp.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.dok_non_pkp"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.DokNonPkp.String
			ProcessOriginalPath(originalPath)
		}

		// dok_ketentuan_khusus
		if row.DokKetentuanKhusus.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.dok_ketentuan_khusus"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.DokKetentuanKhusus.String
			ProcessOriginalPath(originalPath)
		}

		// dok_ketentuan_khusus_jenis
		if row.DokKetentuanKhususJenis.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.dok_ketentuan_khusus_jenis"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.DokKetentuanKhususJenis.String
			ProcessOriginalPath(originalPath)
		}

		// sptb_file
		if row.SptbFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.sptb_file"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.SptbFile.String
			ProcessOriginalPath(originalPath)
		}

		// file_scan_sptb
		if row.FileScanSptb.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.file_scan_sptb"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.FileScanSptb.String
			ProcessOriginalPath(originalPath)
		}

		// ringkasankontrak_file
		if row.RingkasankontrakFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.ringkasankontrak_file"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.RingkasankontrakFile.String
			ProcessOriginalPath(originalPath)
		}

		// file_scan_rk
		if row.FileScanRk.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.file_scan_rk"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.FileScanRk.String
			ProcessOriginalPath(originalPath)
		}

		// faktur_pajak_file
		if row.FakturPajakFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.faktur_pajak_file"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.FakturPajakFile.String
			ProcessOriginalPath(originalPath)
		}

		// ssp_file
		if row.SspFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptbdpt_pl.ssp_file"
			g.LogDoc.PkId = row.IdSptbDptpl.Int32

			originalPath.String = row.SspFile.String
			ProcessOriginalPath(originalPath)
		}
	}

}

func MigrateFileFromPromiseSibelaTblSptjm() {
	allRows, _ := tblsptjmmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {

		// basts_file
		if row.BastsFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptjm.basts_file"
			g.LogDoc.PkId = row.IdSptjm.Int32

			originalPath.String = row.BastsFile.String
			ProcessOriginalPath(originalPath)
		}

		// sperkes_file
		if row.SperkesFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptjm.sperkes_file"
			g.LogDoc.PkId = row.IdSptjm.Int32

			originalPath.String = row.SperkesFile.String
			ProcessOriginalPath(originalPath)
		}

		// sperkes_file_penyedia
		if row.SperkesFilePenyedia.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptjm.sperkes_file_penyedia"
			g.LogDoc.PkId = row.IdSptjm.Int32

			originalPath.String = row.SperkesFilePenyedia.String
			ProcessOriginalPath(originalPath)
		}

		// sperpem_file
		if row.SperpemFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptjm.sperpem_file"
			g.LogDoc.PkId = row.IdSptjm.Int32

			originalPath.String = row.SperpemFile.String
			ProcessOriginalPath(originalPath)
		}

		// sperpem_file_penyedia
		if row.SperpemFilePenyedia.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptjm.sperpem_file_penyedia"
			g.LogDoc.PkId = row.IdSptjm.Int32

			originalPath.String = row.SperpemFilePenyedia.String
			ProcessOriginalPath(originalPath)
		}

		// sptjm_file
		if row.SptjmFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_sptjm.sptjm_file"
			g.LogDoc.PkId = row.IdSptjm.Int32

			originalPath.String = row.SptjmFile.String
			ProcessOriginalPath(originalPath)
		}
	}

}

func MigrateFileFromPromiseSibelaTblSptjmDpt() {
    allRows, _ := tblsptjmdptmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, row := range allRows {

        // basts_file
        if row.BastsFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_sptjmdpt.basts_file"
            g.LogDoc.PkId = row.IdSptjmdpt.Int32

            originalPath.String = row.BastsFile.String
            ProcessOriginalPath(originalPath)
        }

        // sperkes_file
        if row.SperkesFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_sptjmdpt.sperkes_file"
            g.LogDoc.PkId = row.IdSptjmdpt.Int32

            originalPath.String = row.SperkesFile.String
            ProcessOriginalPath(originalPath)
        }

        // sperkes_file_penyedia
        if row.SperkesFilePenyedia.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_sptjmdpt.sperkes_file_penyedia"
            g.LogDoc.PkId = row.IdSptjmdpt.Int32

            originalPath.String = row.SperkesFilePenyedia.String
            ProcessOriginalPath(originalPath)
        }

        // sperpem_file
        if row.SperpemFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_sptjmdpt.sperpem_file"
            g.LogDoc.PkId = row.IdSptjmdpt.Int32

            originalPath.String = row.SperpemFile.String
            ProcessOriginalPath(originalPath)
        }

        // sperpem_file_penyedia
        if row.SperpemFilePenyedia.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_sptjmdpt.sperpem_file_penyedia"
            g.LogDoc.PkId = row.IdSptjmdpt.Int32

            originalPath.String = row.SperpemFilePenyedia.String
            ProcessOriginalPath(originalPath)
        }

        // sptjm_file
        if row.SptjmFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_sptjmdpt.sptjm_file"
            g.LogDoc.PkId = row.IdSptjmdpt.Int32

            originalPath.String = row.SptjmFile.String
            ProcessOriginalPath(originalPath)
        }
    }
}

func MigrateFileFromPromiseSibelaTblSuratBap(){
    allRows, _ := tblsuratbapmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, row := range allRows {

        // path_bap
        if row.PathBap.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_surat_bap.path_bap"
            g.LogDoc.PkId = row.IdSuratBap.Int32

            originalPath.String = row.PathBap.String
            ProcessOriginalPath(originalPath)
        }
    }
}

func MigrateFileFromPromiseSibelaTblSuratBapDpt(){
    allRows, _ := tblsuratbapdptmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, row := range allRows {

        // path_bapdpt
        if row.PathBapdpt.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_surat_bapdpt.path_bapdpt"
            g.LogDoc.PkId = row.IdSuratBapdpt.Int32

            originalPath.String = row.PathBapdpt.String
            ProcessOriginalPath(originalPath)
        }
    }
}



func MigrateFileFromPromiseSibelaTblSuratPesananPl() {
	allRows, _ := tblsuratpesananplmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {

		// suratpesanan_file
		if row.SuratpesananFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_suratpesanan_pl.suratpesanan_file"
			g.LogDoc.PkId = row.IdSuratpesananPl.Int32

			originalPath.String = row.SuratpesananFile.String
			ProcessOriginalPath(originalPath)
		}
	}
}

func MigrateFileFromPromiseSibelaTblTerminPl() {
    allRows, _ := tblterminplmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, row := range allRows {

        // path_kwitansi
        if row.PathKwitansi.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.path_kwitansi"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.PathKwitansi.String
            ProcessOriginalPath(originalPath)
        }

        // path_bast_penyedia
        if row.PathBastPenyedia.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.path_bast_penyedia"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.PathBastPenyedia.String
            ProcessOriginalPath(originalPath)
        }

        // path_bast_pp
        if row.PathBastPp.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.path_bast_pp"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.PathBastPp.String
            ProcessOriginalPath(originalPath)
        }

        // termin_file
        if row.TerminFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.termin_file"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.TerminFile.String
            ProcessOriginalPath(originalPath)
        }

        // file_scan_bast
        if row.FileScanBast.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.file_scan_bast"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.FileScanBast.String
            ProcessOriginalPath(originalPath)
        }

        // kwitansi_file
        if row.KwitansiFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.kwitansi_file"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.KwitansiFile.String
            ProcessOriginalPath(originalPath)
        }

        // spp_file
        if row.SppFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.spp_file"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.SppFile.String
            ProcessOriginalPath(originalPath)
        }

        // file_scan_spp
        if row.FileScanSpp.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.file_scan_spp"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.FileScanSpp.String
            ProcessOriginalPath(originalPath)
        }

        // path_kwitansi_ppk
        if row.PathKwitansiPpk.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.path_kwitansi_ppk"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.PathKwitansiPpk.String
            ProcessOriginalPath(originalPath)
        }

        // path_kwitansi_penyedia
        if row.PathKwitansiPenyedia.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termin_pl.path_kwitansi_penyedia"
            g.LogDoc.PkId = row.IdTerminPl.Int32

            originalPath.String = row.PathKwitansiPenyedia.String
            ProcessOriginalPath(originalPath)
        }
    }
}

func MigrateFileFromPromiseSibelaTblTerminDptPl() {
    allRows, _ := tbltermindptplmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, row := range allRows {

        // path_kwitansidpt
        if row.PathKwitansidpt.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.path_kwitansidpt"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.PathKwitansidpt.String
            ProcessOriginalPath(originalPath)
        }

        // path_bast_penyediadpt
        if row.PathBastPenyediadpt.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.path_bast_penyediadpt"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.PathBastPenyediadpt.String
            ProcessOriginalPath(originalPath)
        }

        // path_bast_ppdpt
        if row.PathBastPpdpt.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.path_bast_ppdpt"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.PathBastPpdpt.String
            ProcessOriginalPath(originalPath)
        }

        // termin_file
        if row.TerminFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.termin_file"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.TerminFile.String
            ProcessOriginalPath(originalPath)
        }

        // file_scan_bast
        if row.FileScanBast.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.file_scan_bast"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.FileScanBast.String
            ProcessOriginalPath(originalPath)
        }

        // path_kwitansi_ppk
        if row.PathKwitansiPpk.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.path_kwitansi_ppk"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.PathKwitansiPpk.String
            ProcessOriginalPath(originalPath)
        }

        // path_kwitansi_penyedia
        if row.PathKwitansiPenyedia.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.path_kwitansi_penyedia"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.PathKwitansiPenyedia.String
            ProcessOriginalPath(originalPath)
        }

        // kwitansi_file
        if row.KwitansiFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.kwitansi_file"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.KwitansiFile.String
            ProcessOriginalPath(originalPath)
        }

        // spp_file
        if row.SppFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.spp_file"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.SppFile.String
            ProcessOriginalPath(originalPath)
        }

        // file_scan_spp
        if row.FileScanSpp.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_termindpt_pl.file_scan_spp"
            g.LogDoc.PkId = row.IdTerminDptpl.Int32

            originalPath.String = row.FileScanSpp.String
            ProcessOriginalPath(originalPath)
        }
    }
}


func MigrateFileFromPromiseSibelaTblUndanganPl() {
    allRows, _ := tblundanganplmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, row := range allRows {

        // banego_file
        if row.BanegoFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_undangan_pl.banego_file"
            g.LogDoc.PkId = row.IdUndanganPl.Int32

            originalPath.String = row.BanegoFile.String
            ProcessOriginalPath(originalPath)
        }

        // file_scan_banego
        if row.FileScanBanego.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_undangan_pl.file_scan_banego"
            g.LogDoc.PkId = row.IdUndanganPl.Int32

            originalPath.String = row.FileScanBanego.String
            ProcessOriginalPath(originalPath)
        }
    }
}

func MigrateFileFromPromiseSibelaTblUndanganDptPl() {
    allRows, _ := tblundangandptplmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, row := range allRows {

        // banego_file
        if row.BanegoFile.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_undangandpt_pl.banego_file"
            g.LogDoc.PkId = row.IdUndanganDptpl.Int32

            originalPath.String = row.BanegoFile.String
            ProcessOriginalPath(originalPath)
        }

        // file_scan_banego
        if row.FileScanBanego.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_undangandpt_pl.file_scan_banego"
            g.LogDoc.PkId = row.IdUndanganDptpl.Int32

            originalPath.String = row.FileScanBanego.String
            ProcessOriginalPath(originalPath)
        }
    }
}