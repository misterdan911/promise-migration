package sidapet

import (
	"regexp"
	"strings"

	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/refvendorreghistorymodel"
	"promise-migration/internal/model/dbsidapet/refvendorregistermodel"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefVendorRegister(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) pgtype.Int4 {

  namaNarahubung := ExtractNamaNarahubung(profilePenyedia.ContactPerson.String)
  noWanarahubung := ExtractPhoneNumber(profilePenyedia.ContactPerson.String)

  /*
  if profilePenyedia.ContactPerson.String != "" {
    fmt.Printf("contact_person: %s\n", profilePenyedia.ContactPerson.String)
    fmt.Printf("nama_narahubung: %s\n", namaNarahubung)
  }

  if profilePenyedia.ContactPerson.String != "" {
    fmt.Printf("contact_person: %s\n", profilePenyedia.ContactPerson.String)
    fmt.Printf("no_wa_narahubung: %s\n", noWanarahubung)
  }
  */

 refVendorRegister := refvendorregistermodel.RefVendorRegister{
  KodeJenisVendor:    profilePenyedia.IdJenisPenyedia,
  NamaPerusahaan:     profilePenyedia.Nama,
  Email:              helperUser.VmsUserEmail,
  Password:           helperUser.VmsUserPass,
  NoTelp:             profilePenyedia.NoTelp,
  NamaNarahubung:     pgtype.Text{Valid: true, String: namaNarahubung},
  NoWaNarahubung:     pgtype.Text{Valid: true, String: noWanarahubung},
  StatusRegister:     pgtype.Text{Valid: true, String: "terima"},
  Udcr:               profilePenyedia.CreateTime,
  Udch:               profilePenyedia.UpdateTime,
  KodeVendor:         helperUser.KodeVendor,
 }

 refVendorRegister = refvendorregistermodel.InsertNew(refVendorRegister)

 refVendorRegHistory := refvendorreghistorymodel.RefVendorRegHistory{
  KodeRegister:       refVendorRegister.KodeRegister,
  KodeJenisVendor:    profilePenyedia.IdJenisPenyedia,
  NamaPerusahaan:     profilePenyedia.Nama,
  Email:              helperUser.VmsUserEmail,
  Password:           helperUser.VmsUserPass,
  NoTelp:             profilePenyedia.NoTelp,
  NamaNarahubung:     pgtype.Text{Valid: true, String: namaNarahubung},
  NoWaNarahubung:     pgtype.Text{Valid: true, String: noWanarahubung},
  StatusRegister:     pgtype.Text{Valid: true, String: "terima"},
  Udcr:               profilePenyedia.CreateTime,
  Udch:               profilePenyedia.UpdateTime,
  KodeVendor:         helperUser.KodeVendor,
 }

 refvendorreghistorymodel.InsertNew(refVendorRegHistory)


 return refVendorRegister.KodeRegister
}

/*
dilta, 08121309602 -> dilta
Ramadhoni (081285655484) -> Ramadhoni
081513498571 Roby -> Roby
0818259581 - Sri Rukmiyati -> Sri Rukmiyati
Erwin Bastari - 089664221833 -> Erwin Bastari
085741234547/NOFIANTO -> NOFIANTO
JIMMY JUNAN -> JIMMY JUNAN
Anisa Bella +62 822-4979-9282 -> Anisa Bella
AGUS WAHIDIN / 08881862899 -> AGUS WAHIDIN
081287176305 (DEBI) -> DEBI
0858-8873-7355  - Rani -> Rani
085394481993 / HARDINAN SUPERSEMAR BAYU MANGALA -> HARDINAN SUPERSEMAR BAYU MANGALA
081225992015 , SWASONO EKO SAPUTRO -> SWASONO EKO SAPUTRO
Imam Munandar | 081259981984 -> Imam Munandar
*/

func ExtractNamaNarahubung(input string) string {
 // Patterns to remove: phone numbers and separators
 patterns := []*regexp.Regexp{
  regexp.MustCompile(`\d[\d\s\-\+\(\)]*\d`), // Phone numbers
  regexp.MustCompile(`[\+\-\/\(\)\|,]`),     // Separators
 }
 
 // Remove phone numbers and separators
 result := input
 for _, pattern := range patterns {
  result = pattern.ReplaceAllString(result, " ")
 }
 
 // Clean up extra spaces and return
 return strings.TrimSpace(result)
}

/*
08113608910 -> 08113608910
+62 812-8709-2012 -> +62 812-8709-2012
dilta, 08121309602 -> 08121309602
Ramadhoni (081285655484) -> 081285655484
081513498571 Roby -> 081513498571
0818259581 - Sri Rukmiyati -> 0818259581
Erwin Bastari - 089664221833 -> 089664221833
085741234547/NOFIANTO -> 085741234547
Anisa Bella +62 822-4979-9282 -> +62 822-4979-9282
AGUS WAHIDIN / 08881862899 -> 08881862899
081287176305 (DEBI) -> 081287176305
0858-8873-7355  - Rani -> 0858-8873-7355
085394481993 / HARDINAN SUPERSEMAR BAYU MANGALA -> 085394481993
081225992015 , SWASONO EKO SAPUTRO -> 081225992015
Imam Munandar | 081259981984 -> 081259981984
Yuminanto Dwi Putro Nugroho - +62 813-2740-1234 -> +62 813-2740-1234
*/
func ExtractPhoneNumber(input string) string {
// Regular expression to match various phone number formats
  // Supports: +62, 08, with/without spaces, dashes, parentheses
  phonePattern := `(?:\+\d{1,3}[\s-]*)?(?:\(?\d{2,}\)?[\s-]*)?\d{2,}[\s-]*\d{2,}[\s-]*\d{2,}[\s-]*\d*`
  
  re := regexp.MustCompile(phonePattern)
  
  // Find all matches
  matches := re.FindAllString(input, -1)
  
  if len(matches) == 0 {
    return ""
  }
  
  // Return the first match (assuming there's only one phone number per string)
  // Clean up the result by removing any non-digit characters except + and -
  phone := matches[0]
  
  // Remove any extra spaces around the phone number
  phone = strings.TrimSpace(phone)
  
  return phone
}