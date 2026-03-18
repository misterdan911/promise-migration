package tblpenyediainternasionalmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TblPenyediaInternasional struct {
	IdPenyediaInternasional      pgtype.Int4
	IdUser                       pgtype.Int4
	CompanyName                  pgtype.Text
	Telephone                    pgtype.Text
	Fax                          pgtype.Text
	MailingAddress               pgtype.Text
	Email                        pgtype.Text
	Website                      pgtype.Text
	ContactName                  pgtype.Text
	ContactTitle                 pgtype.Text
	ContactEmail                 pgtype.Text
	ContactPhone                 pgtype.Text
	ContactPhone2                pgtype.Text
	OverviewGeneral              pgtype.Text
	OverviewDateCompany          pgtype.Text
	OverviewGrossAnnualSales     pgtype.Text
	OverviewGeographicServiceArea pgtype.Text
	OverviewLegalStructure       pgtype.Text
	OverviewBusinessType         pgtype.Text
	OverviewYearsRegistered      pgtype.Text
	OverviewInsured              pgtype.Text
	OverviewBonded               pgtype.Text
	OverviewLicensed             pgtype.Text
	OverviewLicenseNumber        pgtype.Text
	OverviewAdditionalInfo       pgtype.Text
	BankName                     pgtype.Text
	BankBeneficiaryName          pgtype.Text
	BankAccountName              pgtype.Text
	BankAddress                  pgtype.Text
	CertificationName            pgtype.Text
	CertificationSignature       pgtype.Text
	CertificationTitle           pgtype.Text
	CertificationDate            pgtype.Date
	CreatedAt                    pgtype.Timestamptz
	UpdatedAt                    pgtype.Timestamptz
	Status                       pgtype.Int4
}

func GetAllData() []TblPenyediaInternasional {
	ctx := context.Background()

	qAllData := `
	SELECT
		id_penyedia_internasional,
		id_user,
		company_name,
		telephone,
		fax,
		mailing_address,
		email,
		website,
		contact_name,
		contact_title,
		contact_email,
		contact_phone,
		contact_phone2,
		overview_general,
		overview_date_company,
		overview_gross_annual_sales,
		overview_geographic_service_area,
		overview_legal_structure,
		overview_business_type,
		overview_years_registered,
		overview_insured,
		overview_bonded,
		overview_licensed,
		overview_license_number,
		overview_additional_info,
		bank_name,
		bank_beneficiary_name,
		bank_account_name,
		bank_address,
		certification_name,
		certification_signature,
		certification_title,
		certification_date,
		created_at,
		updated_at,
		status
	FROM tbl_penyedia_internasional
	ORDER BY id_penyedia_internasional ASC`

	rows, err := db.VmsDb.Query(ctx, qAllData)
	if err != nil {
		log.Fatal("qAllData Failed, " + err.Error() + " " + qAllData)
	}
	defer rows.Close()

	allData, err := pgx.CollectRows(rows, pgx.RowToStructByName[TblPenyediaInternasional])
	if err != nil {
		log.Fatal("failed collecting rows (tblpenyediainternasionalmodel), " + err.Error())
	}

	return allData
}
