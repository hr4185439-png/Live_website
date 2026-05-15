$path = "app/assets/index.js"
$c = Get-Content $path
$found = $false
for($i=1; $i -lt $c.Count; $i++) {
    if ($c[$i] -like '*children: "Submit Application"*' -and $c[$i-1] -like '*className: "apply-submit-btn"*') {
        $c[$i] = $c[$i] -replace 'Submit Application', 'Submit'
        $found = $true
        Write-Host "Replaced at line $($i+1)"
        break
    }
}
if ($found) {
    $c | Set-Content $path
} else {
    Write-Error "Pattern not found"
    exit 1
}
