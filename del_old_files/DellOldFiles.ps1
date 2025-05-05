# Cấu hình

$folderPath = "E:\..."
$daysOld = 3

# Tính ngày giới hạn
$limitDate = (Get-Date).AddDays(-$daysOld)

# Tìm và xóa các file cũ
Get-ChildItem -Path $folderPath -Recurse -File | Where-Object {
    $_.LastWriteTime -lt $limitDate
} | ForEach-Object {
    Write-Host "Xóa: $($_.FullName)"
    Remove-Item $_.FullName -Force
}
