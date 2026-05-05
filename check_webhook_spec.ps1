$r = Invoke-WebRequest -Uri "http://localhost:8007/openapi.json" -UseBasicParsing -TimeoutSec 10
$spec = $r.Content | ConvertFrom-Json
$webhook = $spec.paths."/api/v1/metering/git-webhook".post
Write-Host "=== git-webhook POST ==="
Write-Host ($webhook | ConvertTo-Json -Depth 10)
