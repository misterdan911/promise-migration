#!/bin/bash

# Define array of database names
databases=(
    "db_sibela"
)

# Loop through each database
for db in "${databases[@]}"; do

  # Set the directory to scan (default: current directory)
  DIR="/mnt/backup-db/${db}"

  # Check if directory exists
  if [ ! -d "$DIR" ]; then
      echo "Error: Directory '$DIR' does not exist"
      exit 1
  fi

  # Get the latest file (including hidden files)
  latest_file=$(ls -t "$DIR" | head -n 1)

  # Check if any files exist
  if [ -z "$latest_file" ]; then
      echo "No files found in '$DIR'"
      exit 1
  fi

  echo "Latest file: $latest_file"

  TARGET_DIR="/home/dbpromise/${db}"

  # CREATE THE TARGET DIRECTORY if it doesn't exist
  if [ ! -d "$TARGET_DIR" ]; then
      echo "📁 Creating target directory: $TARGET_DIR"
      mkdir -p "$TARGET_DIR"
  fi

  # Copy latest file to /home/db_promise
  cp "$DIR/$latest_file" "$TARGET_DIR"

  if [ $? -eq 0 ]; then
      echo "✅ Successfully copied $latest_file to $TARGET_DIR"
  else
      echo "❌ Failed to copy $latest_file"
  fi

  GUNZIP_FILE="$TARGET_DIR/$latest_file"

  # Extract the file (this will remove the .gz file and keep the extracted file)
  gunzip -f "$GUNZIP_FILE"
  
  if [ $? -eq 0 ]; then
      # Get the extracted filename (without .gz)
      extracted_file="${GUNZIP_FILE%.gz}"
      echo "✅ Successfully extracted to: $extracted_file"
  else
      echo "❌ Failed to extract $GUNZIP_FILE"
      exit 1
  fi

  export PGPASSFILE="/home/dbpromise/.pgpass"
  psql -h localhost -U postgres -d postgres -c "DROP DATABASE ${db} WITH (FORCE);"
  psql -h localhost -U postgres -d postgres -c "CREATE DATABASE ${db};"
  psql -h localhost -U postgres -d "${db}" -f "$extracted_file"

done

