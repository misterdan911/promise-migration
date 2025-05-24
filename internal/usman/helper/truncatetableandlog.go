package helper

func TruncateTableAndLog() {

	TruncateTable("ref_user")
	TruncateTable("ref_user_external")

	// Truncate Log File
	//TruncateLog("pengalaman_bu.txt")
}
