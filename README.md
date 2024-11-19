# Promise v.2.0 Database Migration Tools

Tools untuk migrasi database Promise v.1.0 ke v.2.0

## Build Instruction

Cara build tools ini di Windows

```bash
  go build -o bin/promise.exe
```


## Build on Windows for Linux

Buka PowerShell sebagai Administrator

```bash
go env
$env:GOOS = "linux"
set GOOS=linux
go build -o bin/promise main.go
```
