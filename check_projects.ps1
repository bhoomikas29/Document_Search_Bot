$h = @{
    "Authorization" = "Bearer frt_f9888b96f6f32f7aded1ed723b2fdb02dfe48009dd525a1e47798c3ba5a18096"
    "Content-Type"  = "application/json"
}

# Check the observability/git dashboard endpoint used by the frontend
Write-Host "=== Trying observability endpoint ==="
try {
    $obs = Invoke-RestMethod -Uri "http://localhost:8007/api/v1/metering/git-dashboard?customer_id=17544ca2-d5e4-47b5-9e58-06ebc348e2e5&project_id=00368bf5-e665-4432-b394-405dbdec703a" -Headers $h -TimeoutSec 10
    Write-Host ($obs | ConvertTo-Json -Depth 10)
} catch {
    Write-Host "git-dashboard not found: $($_.Exception.Message)"
}

# Try the lessons endpoint which may have git data
Write-Host "`n=== Trying lessons endpoint ==="
try {
    $lessons = Invoke-RestMethod -Uri "http://localhost:8007/api/v1/metering/lessons?customer_id=17544ca2-d5e4-47b5-9e58-06ebc348e2e5&project_id=00368bf5-e665-4432-b394-405dbdec703a" -Headers $h -TimeoutSec 10
    Write-Host ($lessons | ConvertTo-Json -Depth 10)
} catch {
    Write-Host "lessons error: $($_.Exception.Message)"
}

# Check what customer/project IDs the old frontier API key maps to
Write-Host "`n=== Checking old API key project ==="
$h2 = @{
    "Authorization" = "Bearer frt_1c5e300de405eb9cddde0ed52f8d4ce5898ab17745faf71e16174b2fa1dd9d84"
    "Content-Type"  = "application/json"
}
try {
    $dash2 = Invoke-RestMethod -Uri "http://localhost:8007/api/v1/metering/dashboard?customer_id=1ace6ae4-f9d1-4b16-8ad0-a10bd58b8b0c&project_id=40770761-36c2-428e-90a1-2dfe793c29f1" -Headers $h2 -TimeoutSec 10
    Write-Host "Old project top_event_types:"
    Write-Host ($dash2.top_event_types | ConvertTo-Json -Depth 5)
} catch {
    Write-Host "Old project error: $($_.Exception.Message)"
}

# Check raw events to see pr_review data
Write-Host "`n=== Raw metering events (new project) ==="
try {
    $events = Invoke-RestMethod -Uri "http://localhost:8007/api/v1/metering/events?customer_id=17544ca2-d5e4-47b5-9e58-06ebc348e2e5&project_id=00368bf5-e665-4432-b394-405dbdec703a&limit=20" -Headers $h -TimeoutSec 10
    Write-Host ($events | ConvertTo-Json -Depth 5)
} catch {
    Write-Host "Events error: $($_.Exception.Message)"
}
