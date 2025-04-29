# Path thư mục nguồn
$sourceFolder = Read-Host "Nhập đường dẫn thư mục nguồn: "

# path thư mục đích
$destinationFolder = Read-Host "Nhập đường dẫn thư mục đích: "

#kiểu file cần tìm (abc*.txt, *.docx, *.*)
$filePattern = Read-Host "Nhập kiểu file cần di chuyển (ví dụ: *.txt, *.jpg, *.*)"

# Kiểm tra thư mục nguồn có tồn tại không
if (!(Test-Path -Path $sourceFolder)) {
    Write-Host "Thư mục nguồn không tồn tại!" -ForegroundColor Red
    exit
}

# Tạo thư mục đích nếu chưa tồn tại
if (!(Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Tìm kiếm và di chuyển file
Get-ChildItem -Path $sourceFolder -Filter $filePattern -Recurse | ForEach-Object {
    $targetPath = Join-Path -Path $destinationFolder -ChildPath $_.Name

    if (Test-Path -Path $targetPath) {
        Write-Host "File $($_.Name) đã tồn tại ở thư mục đích. Bỏ qua." -ForegroundColor Yellow
    } else {
        Move-Item -Path $_.FullName -Destination $destinationFolder
        Write-Host "Đã di chuyển: $($_.FullName) -> $destinationFolder" -ForegroundColor Green
    }
}
