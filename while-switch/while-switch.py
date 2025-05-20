# Biến điều kiện chạy vòng lặp
$running = $true
$global:data = $null

while ($running) {
    Write-Host "=== MENU ==="
    Write-Host "1. Gán giá trị A vào biến"
    Write-Host "2. Gán giá trị B vào biến"
    Write-Host "3. Gán giá trị C vào biến"
    Write-Host "4. Gán giá trị D vào biến"
    Write-Host "5. Gán giá trị E vào biến"
    Write-Host "0. Thoát chương trình"
    
    $choice = Read-Host "Nhập lựa chọn (0-5)"

    switch ($choice.ToString()) {
        '1' { $global:data = "Giá trị A"; Write-Host "Đã gán: $global:data" }
        '2' { $global:data = "Giá trị B"; Write-Host "Đã gán: $global:data" }
        '3' { $global:data = "Giá trị C"; Write-Host "Đã gán: $global:data" }
        '4' { $global:data = "Giá trị D"; Write-Host "Đã gán: $global:data" }
        '5' { $global:data = "Giá trị E"; Write-Host "Đã gán: $global:data" }
        '0' { 
            Write-Host "Thoát chương trình."
            $running = $false  # Đặt biến vòng lặp = false để kết thúc
        }
        default { Write-Host "Lựa chọn không hợp lệ, vui lòng chọn từ 0 đến 5." }
    }

    Start-Sleep -Seconds 1
}