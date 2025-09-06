package appdoc

import (
	"promise-migration/internal/g"
	"promise-migration/internal/model/myvmsdb/tblaktaperusahaanmodel"
	"promise-migration/internal/model/myvmsdb/tbldireksiperusahaanmodel"
	"promise-migration/internal/model/myvmsdb/tblfasilitasperusahaanmodel"
	"promise-migration/internal/model/myvmsdb/tblijinusahaperusahaanmodel"
	"promise-migration/internal/model/myvmsdb/tblkomisarisperusahaanmodel"
	"promise-migration/internal/model/myvmsdb/tblpaketmodel"
	"promise-migration/internal/model/myvmsdb/tblpengalaman10model"
	"promise-migration/internal/model/myvmsdb/tblpengalaman3model"
	"promise-migration/internal/model/myvmsdb/tblpengalamaneroranganmodel"
	"promise-migration/internal/model/myvmsdb/tblpengalamansekarangmodel"
	"promise-migration/internal/model/myvmsdb/tblpersonaliaperusahaanmodel"
	"promise-migration/internal/model/myvmsdb/tblsertifperoranganmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateFileFromVmsDbTblPengalamanPerorangan() {

  allTblPengalamanPerorangan, _ := tblpengalamaneroranganmodel.GetAllDocument()
  originalPath := pgtype.Text{Valid: true, String: ""}

  for _, tblPengalamanPerorangan := range allTblPengalamanPerorangan {

    // promise_sibela.tbl_pengalaman_perorangan.path_pnglmn
    if tblPengalamanPerorangan.PathPnglmn.String != "" {
      g.LogDoc.FieldName = "vms_db.tbl_pengalaman_perorangan.path_pnglmn"
      g.LogDoc.PkId = tblPengalamanPerorangan.IdProfilPenyedia.Int32

      originalPath.String = tblPengalamanPerorangan.PathPnglmn.String
      ProcessOriginalPath(originalPath)
    }
  }
}

func MigrateFileFromVmsDbTblSertifPerorangan() {

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

func MigrateFileFromVmsDbTblAktaPerusahaan() {

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
func MigrateFileFromVmsDbTblDireksiPerusahaan() {

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
func MigrateFileFromVmsDbTblFasilitasPerusahaan() {
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
func MigrateFileFromVmsDbTblIjinUsahaPerusahaan() {
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
func MigrateFileFromVmsDbTblKomisarisPerusahaan() {
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
func MigrateFileFromVmsDbTblPaket() {
    allTblPaket, _ := tblpaketmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, tblPaket := range allTblPaket {
        
        // Process path_paket field
        if tblPaket.PathPaket.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_paket.path_paket"
            g.LogDoc.PkId = tblPaket.IdProfilPenyedia.Int32

            originalPath.String = tblPaket.PathPaket.String
            ProcessOriginalPath(originalPath)
        }
    }
}

// tbl_pengalaman_sekarang
func MigrateFileFromVmsDbTblPengalamanSekarang() {
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
func MigrateFileFromVmsDbTblPengalaman3() {
    allTblPengalaman3, _ := tblpengalaman3model.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, tblPengalaman3 := range allTblPengalaman3 {
        
        // Process path_pnglmn_3 field
        if tblPengalaman3.PathPnglmn3.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_pengalaman3.path_pnglmn_3"
            g.LogDoc.PkId = tblPengalaman3.IdProfilPenyedia.Int32

            originalPath.String = tblPengalaman3.PathPnglmn3.String
            ProcessOriginalPath(originalPath)
        }
    }
}

// tbl_pengalaman10
func MigrateFileFromVmsDbTblPengalaman10() {
    allTblPengalaman10, _ := tblpengalaman10model.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, tblPengalaman10 := range allTblPengalaman10 {
        
        // Process path_pnglmn_10 field
        if tblPengalaman10.PathPnglmn10.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_pengalaman10.path_pnglmn_10"
            g.LogDoc.PkId = tblPengalaman10.IdProfilPenyedia.Int32

            originalPath.String = tblPengalaman10.PathPnglmn10.String
            ProcessOriginalPath(originalPath)
        }
    }
}

// tbl_personalia_perusahaan
func MigrateFileFromVmsDbTblPersonaliaPerusahaan() {
    allTblPersonaliaPerusahaan, _ := tblpersonaliaperusahaanmodel.GetAllDocument()
    originalPath := pgtype.Text{Valid: true, String: ""}

    for _, tblPersonaliaPerusahaan := range allTblPersonaliaPerusahaan {
        
        // Process path_personal field
        if tblPersonaliaPerusahaan.PathPersonal.String != "" {
            g.LogDoc.FieldName = "promise_sibela.tbl_personalia_perusahaan.path_personal"
            g.LogDoc.PkId = tblPersonaliaPerusahaan.IdProfilPenyedia.Int32

            originalPath.String = tblPersonaliaPerusahaan.PathPersonal.String
            ProcessOriginalPath(originalPath)
        }
    }
}
