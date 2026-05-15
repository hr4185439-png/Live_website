$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# 1. Update MainSection Enquiry Button
$search1 = '            children: jsxRuntimeExports.jsxs(motion.button, {
              onClick: () => er(!0),
              className:'
$replace1 = '            children: jsxRuntimeExports.jsxs(motion.button, {
              onClick: () => tr("/contact-us"),
              className:'

if ($content.Contains($search1)) {
    $content = $content.Replace($search1, $replace1)
    Write-Host "Updated MainSection Enquiry Button"
}

# 2. Update Card Enquiry Button
$search2 = '                jsxRuntimeExports.jsx("button", {
                  onClick: () => dr(!0),
                  children: "Enquire Now",
                }),'
$replace2 = '                jsxRuntimeExports.jsx("button", {
                  onClick: () => ar("/contact-us"),
                  children: "Enquire Now",
                }),'

if ($content.Contains($search2)) {
    $content = $content.Replace($search2, $replace2)
    Write-Host "Updated Card Enquiry Button"
}

# 3. Update Card2 Enquiry Button
$search3 = '            jsxRuntimeExports.jsx("button", {
              onClick: () => lr(!0),
              children: "Enquire Now",
            }),'
$replace3 = '            jsxRuntimeExports.jsx("button", {
              onClick: () => ar("/contact-us"),
              children: "Enquire Now",
            }),'

if ($content.Contains($search3)) {
    $content = $content.Replace($search3, $replace3)
    Write-Host "Updated Card2 Enquiry Button"
}

[System.IO.File]::WriteAllText($filePath, $content)
