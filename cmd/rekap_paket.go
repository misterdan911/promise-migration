package cmd

import (
	"encoding/csv"
	"fmt"
	"os"
	"strconv"
	"github.com/spf13/cobra"
	// "promise-migration/cmd/subcmd"
	"promise-migration/db"
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/dbsippan/refrupmodel"
	"promise-migration/internal/model/dbusman/refmetodepengadaanmodel"
	"promise-migration/internal/model/dbusman/refjenispengadaanmodel"
	"promise-migration/internal/model/dbusman/refuserexternalmodel"
	"promise-migration/internal/model/dbusman/refunitpbjmodel"
	
	// "github.com/jackc/pgx/v5/pgtype"
)

type Person struct {
    Name       string
    Age        int
    City       string
    Occupation string
    Salary     float64
}

var RekapPaket = &cobra.Command{
	Use:   "rekap",
	Short: "Rekap Paket 2025 - 2026",
	Long: `Rekap Paket 2025 - 2026`,
	Run: func(cmd *cobra.Command, args []string) {


		/*
		db.ConnectDbEsign()
		defer db.DbEsign.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()


		db.ConnectDbSiplang()
		defer db.DbSiplang.Close()
		*/

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectDbSippan()
		defer db.DbSippan.Close()

		db.ConnectDbSibela()
		defer db.DbSibela.Close()


		allRefPermintaan := refpermintaanmodel.GetAllDataRekap_2025_2026()

    file, err := os.Create("people.csv")
    if err != nil {
        panic(err)
    }
    defer file.Close()

    writer := csv.NewWriter(file)
    defer writer.Flush()

    // Write header
    header := []string{
			"Nama Kegiatan",
			"Sumber Dana",
			"Metode Pemilihan Penyedia",
			"Nomor dan Tanggal Kontrak",
			"Nilai Kontrak (Rp)",
			"Nama Penyedia",
			"Jangka Waktu Pelaksanaan (Hari)",
			"Tanggal Mulai dan Berakhir Kontrak ",
			"Jumlah Addendum",
			"Status Pelaksanaan Pekerjaan",
			"Jenis (B/J/K/JK)",
			"Unit Kerja",
			"Nilai RUP (Rp)",
			"Tahun Anggaran",
		}
    if err := writer.Write(header); err != nil {
        panic(err)
    }

    // Write data from struct
    for _, refPermintaan := range allRefPermintaan {

				refRup := refrupmodel.GetByKodeRup(refPermintaan.KodeRup)

				// Get ref_metode_pengadaan
				refMetodePengadaan := refmetodepengadaanmodel.GetByKodeMetodePengadaan(refRup.KodeMetodePengadaan)
				// nomor dan tgl kontrak
				nomorDanTglKontrak := refproseskontrakmodel.GetNomorDanTglKontrak(refPermintaan.KodePermintaan)
				// nama Penyedia
				refUserExternal := refuserexternalmodel.GetById(refPermintaan.KodeVendor)
				// jangka_waktu
				jangkaWaktu := refproseskontrakmodel.GetTrxJangkaWaktuByKodePermintaan(refPermintaan.KodePermintaan)

				// status pelaksanaan Pekerjaan
				var statusPermintaan string
				if refPermintaan.KodeStatusPermintaan.Int32 == 9 {
					statusPermintaan = "Selesai"
				} else {
					statusPermintaan = "Sedang Berjalan"
				}

				// jenis_pengadaan
				refJenisPengadaan := refjenispengadaanmodel.GetByKodeJenisPengadaan(refRup.KodeJenisPengadaan)

				// unit_kerja
				refUnitPbj := refunitpbjmodel.GetByKodePbj(refPermintaan.KodeUnit)

				// jml_pagu
				/*
				var jmlPaguStr string
				err = refRup.JmlPagu.Scan(&jmlPaguStr)
				if err == nil {
					fmt.Printf("String: %s\n", jmlPaguStr)
				}
				*/

				jmlPaguValue, _ := refRup.JmlPagu.Value()
				jmlPaguStr := fmt.Sprintf("%v", jmlPaguValue)

        // Convert all fields to strings
        row := []string{
            refPermintaan.NamaPaket.String,
						refRup.SumberDana.String,
						refMetodePengadaan.MetodePengadaan.String,
						nomorDanTglKontrak.String,
						strconv.FormatInt(int64(refPermintaan.NilaiHps.Int32), 10),
						refUserExternal.Username.String,
						strconv.FormatInt(int64(jangkaWaktu.JangkaWaktu.Int32), 10),
						jangkaWaktu.TglMulaiAkhir.String,
						"-",
						statusPermintaan,
						refJenisPengadaan.JenisPengadaan.String,
						refUnitPbj.NamaPbj.String,
						jmlPaguStr,
						strconv.FormatInt(int64(refRup.TahunAnggaran.Int32), 10),
					}
        if err := writer.Write(row); err != nil {
            panic(err)
        }
    }

    println("CSV from struct created successfully!")


	},
}

