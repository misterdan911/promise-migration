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
// var BasePath string
var UrlBasePathExisting string

var FilePath string

var FileNameEncoded string

var FileExt string

var PathPlusFilename string

var AppName string

type LogDocument struct {
  FieldName string
  PkId      int32
  OriPath   string
  DownStat  string
UpStat    string
}

var LogDoc LogDocument
