package sibelahelper

func TruncateTableAndLog() {

	TruncateTable("ref_permintaan")

	// Truncate Log File
	// helper.TruncateLog("pengalaman_bu.txt")
}
