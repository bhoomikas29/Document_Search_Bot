$h = @{
    "Authorization" = "Bearer frt_f9888b96f6f32f7aded1ed723b2fdb02dfe48009dd525a1e47798c3ba5a18096"
    "Content-Type"  = "application/json"
}

# Check the dashboard endpoint to see what data it returns
$dash = Invoke-RestMethod -Uri "http://localhost:8007/api/v1/metering/dashboard?customer_id=17544ca2-d5e4-47b5-9e58-06ebc348e2e5&project_id=00368bf5-e665-4432-b394-405dbdec703a" -Headers $h -TimeoutSec 10
Write-Host "=== Dashboard Data ==="
Write-Host ($dash | ConvertTo-Json -Depth 10)
