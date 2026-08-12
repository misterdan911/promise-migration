#!/bin/bash

# Define array of database names
databases=(
    "db_esign"
    "db_sibela"
    "db_sidapet"
    "db_siplang"
    "db_sippan"
    "db_usman"
)

# Loop through each database
for db in "${databases[@]}"; do

  HOME_DIR="/home/dbpromise"

  # Set the directory to scan (default: current directory)
  BACKUP_DIR="/mnt/backup-db/${db}"

  # Check if directory exists
  if [ ! -d "$BACKUP_DIR" ]; then
      echo "Error: Directory '$BACKUP_DIR' does not exist"
      exit 1
  fi

  # Get the latest file (including hidden files)
  latest_file=$(ls -t "$BACKUP_DIR" | head -n 1)

  # Check if any files exist
  if [ -z "$latest_file" ]; then
      echo "No files found in '$BACKUP_DIR'"
      exit 1
  fi

  echo "Latest file: $latest_file"

  TARGET_DIR="${HOME_DIR}/${db}"

  # CREATE THE TARGET DIRECTORY if it doesn't exist
  if [ ! -d "$TARGET_DIR" ]; then
      echo "📁 Creating target directory: $TARGET_DIR"
      mkdir -p "$TARGET_DIR"
  fi

  # Copy latest file to /home/db_promise
  WAKTU_COPY_START=$(date +"%H:%M")
  cp "$BACKUP_DIR/$latest_file" "$TARGET_DIR"
  WAKTU_COPY_END=$(date +"%H:%M")

  if [ $? -eq 0 ]; then
    echo "✅ Successfully copied $latest_file to $TARGET_DIR"
    COMPLETE1="✓"
    ERROR1=""
  else
    echo "❌ Failed to copy $latest_file"
    COMPLETE1=""
    ERROR1="✓"
  fi

  GUNZIP_FILE="$TARGET_DIR/$latest_file"

  # Extract the file (this will remove the .gz file and keep the extracted file)
  WAKTU_GUNZIP_START=$(date +"%H:%M")
  gunzip -f "$GUNZIP_FILE"
  WAKTU_GUNZIP_END=$(date +"%H:%M")
  
  if [ $? -eq 0 ]; then
    # Get the extracted filename (without .gz)
    extracted_file="${GUNZIP_FILE%.gz}"
    echo "✅ Successfully extracted to: $extracted_file"
    COMPLETE2="✓"
    ERROR2=""
  else
    echo "❌ Failed to extract $GUNZIP_FILE"
    COMPLETE2=""
    ERROR2="✓"
    # exit 1
  fi

  export PGPASSFILE="/home/dbpromise/.pgpass"
  psql -h localhost -U postgres -d postgres -c "DROP DATABASE ${db} WITH (FORCE);"
  psql -h localhost -U postgres -d postgres -c "CREATE DATABASE ${db};"

  # Restore Database
  # psql -h localhost -U postgres -d "${db}" -f "$extracted_file"
  
  # Restore Database with ON_ERROR_STOP
  if PGOPTIONS="-c client_min_messages=WARNING" psql -h localhost -U postgres -d "${db}" -v ON_ERROR_STOP=1 -f "$extracted_file"; then
      echo "✅ Restore completed successfully"
  else
      echo "❌ Restore failed"
      exit 1
  fi

  # Get just the size value without the header and footer
  DB_SIZE=$(psql -h localhost -U postgres -d postgres -t -A -c "SELECT pg_size_pretty(pg_database_size('$db'));")

  # echo "Database size: $DB_SIZE"
  
  tanggal=$(date +"%d/%m/%Y")
  
  # Check if csv file exist
  REPORT_FILE="$HOME_DIR/report.csv"
  if [ ! -f "$REPORT_FILE" ]; then
      echo "NO,Nama Database,Validate 1,Validate2,Nama File Backup,Mulai,Selesai,Complete,Error,Mulai,Selesai,Complete,Error,Total Ukuran DB,Tanggal" > "$REPORT_FILE"
  fi

  echo "1,$db,172.16.40.123,172.16.40.123,$latest_file,$WAKTU_COPY_START,$WAKTU_COPY_END,$COMPLETE1,$ERROR1,$WAKTU_GUNZIP_START,$WAKTU_GUNZIP_END,$COMPLETE2,$ERROR2,$DB_SIZE,$tanggal" >> "$REPORT_FILE"

done

