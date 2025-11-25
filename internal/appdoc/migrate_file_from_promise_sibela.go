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
	"promise-migration/internal/model/mypromise_sibela/tblpaketmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpengalaman10model"
	"promise-migration/internal/model/mypromise_sibela/tblpengalaman3model"
	"promise-migration/internal/model/mypromise_sibela/tblpengalamansekarangmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpersonaliaperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tblsahamperusahaanmodel"
	"promise-migration/internal/model/mypromise_sibela/tblpaketplmodel"
	
	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateFileFromPromiseSibelaTblPengalamanPerorangan() {

  allTblPengalamanPerorangan, _ := tblpengalamaneroranganmodel.GetAllDocument()
  originalPath := pgtype.Text{Valid: true, String: ""}

  for _, tblPengalamanPerorangan := range allTblPengalamanPerorangan {

    // promise_sibela.tbl_pengalaman_perorangan.path_pnglmn
    if tblPengalamanPerorangan.PathPnglmn.String != "" {
      g.LogDoc.FieldName = "promise_sibela.tbl_pengalaman_perorangan.path_pnglmn"
      g.LogDoc.PkId = tblPengalamanPerorangan.IdProfilPenyedia.Int32

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
      g.LogDoc.PkId = tblSertifPerorangan.IdProfilPenyedia.Int32

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
      g.LogDoc.PkId = tblAktaPerusahaan.IdProfilPenyedia.Int32

      originalPath.String = tblAktaPerusahaan.PathAkta.String
      ProcessOriginalPath(originalPath)
    }

    if tblAktaPerusahaan.PathAktaAkhir.String != "" {
      g.LogDoc.FieldName = "promise_sibela.tbl_akta_perusahaan.path_akta_akhir"
      g.LogDoc.PkId = tblAktaPerusahaan.IdProfilPenyedia.Int32

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
      g.LogDoc.PkId = tblDireksiPerusahaan.IdProfilPenyedia.Int32

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
            g.LogDoc.PkId = tblFasilitasPerusahaan.IdProfilPenyedia.Int32

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
            g.LogDoc.PkId = tblIjinUsahaPerusahaan.IdProfilPenyedia.Int32

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
            g.LogDoc.PkId = tblKomisarisPerusahaan.IdProfilPenyedia.Int32

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
            g.LogDoc.PkId = tblPengalamanSekarang.IdProfilPenyedia.Int32

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
            g.LogDoc.FieldName = "promise_sibela.tbl_personalia_perusahaan.path_saham"
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
    }
	
}

/*
func MigrateFileFromPromiseSibelaTblSuratPesananPl() {
	allRows, _ := tblsuratpesananplmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {
			
		// Process suratpesanan_file
		if row.SuratpesananFile.String != "" {
			g.LogDoc.FieldName = "promise_sibela.tbl_suratpesanan_pl.suratpesanan_file"
			g.LogDoc.PkId = row.IdSuratPesananPl.Int32

			originalPath.String = row.SuratpesananFile.String
			ProcessOriginalPath(originalPath)
		}
	}
}
*/



