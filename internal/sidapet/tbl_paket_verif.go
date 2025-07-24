package sidapet

/*
import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/model/sidapet/rvendormodel"
	"promise-migration/internal/sidapet/model/sidapet/trxpenjaringanmodel"
	"promise-migration/internal/sidapet/model/sidapet/trxvendorpenjrmodel"
	"promise-migration/internal/sidapet/model/vmsdb/tverifmodel"
)

func MigrateTblVerif() {

	ctx := context.Background()

	qVmsTblVerif := `
  SELECT
		id_verif,
		id_profil,
		id_paket,
		id_pegawai,
		status_verif,
		org_data_pribadi,
		org_npwp_pribadi,
		org_pengalaman,
		org_sertifikat,
		perus_landasan_hukum,
		perus_pengurus,
		perus_izin_usaha,
		perus_data_keuangan,
		perus_personalia,
		perus_fasilitas,
		perus_pengalaman,
		perus_lap_keuangan,
		total_nilai,
		terpilih
  FROM tbl_verif
  ORDER BY id_profil ASC`

	rwVTV, err := db.VmsDb.Query(ctx, qVmsTblVerif)
	if err != nil {
		log.Fatal("qVmsTblVerif Failed, " + err.Error() + " " + qVmsTblVerif)
	}

	allVTV, err := pgx.CollectRows(rwVTV, pgx.RowToStructByName[tverifmodel.TblVerif])
	if err != nil {
		log.Fatal("failed collecting rwVTV, " + err.Error())
	}
	defer rwVTV.Close()

	for _, vTV := range allVTV {
		vendor := rvendormodel.GetVendorByKodeVendor(int(vTV.IdProfil.Int32))
		if (vendor == rvendormodel.RefVendor{}) {
			fmt.Println("Vendor not found")
			continue
		}

		penjaringan := trxpenjaringanmodel.GetPenjaringanByKodePenjaringan(int(vTV.IdPaket.Int32))
		if (penjaringan == trxpenjaringanmodel.TrxPenjaringan{}) {
			fmt.Println("Penjaringan not found")
			continue
		}

		kodeJenisVendor := int(vendor.KodeJenisVendor.Int32)
		trxvendorpenjrmodel.InsertTrxVendorPenjr(vTV, kodeJenisVendor)
	}

}
*/