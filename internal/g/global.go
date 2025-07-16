package g

import (
	"github.com/jackc/pgx/v5/pgtype"
)

type GUser struct {
	Id   pgtype.Int4
	Name pgtype.Text
}

var User GUser
var ExcludedEmails []string
var ExcludedVmsUserId []int32
var BasePath string
