$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for OurProjects only
$searchOP = '      jsxRuntimeExports.jsx("div", {
        className: "mainmain",
        children: jsxRuntimeExports.jsx("h1", {'

$replaceOP = '      jsxRuntimeExports.jsx("div", {
        className: "mainmain",
        style: { backgroundImage: "url(' + "'/project.jpg'" + ')", backgroundSize: "cover", backgroundPosition: "center", minHeight: "100vh" },
        children: jsxRuntimeExports.jsx("h1", {'

if ($content.Contains($searchOP)) {
    $content = $content.Replace($searchOP, $replaceOP)
    Write-Host "Updated OurProjects with background image"
} else {
    Write-Host "Could not find current OurProjects structure"
}

[System.IO.File]::WriteAllText($filePath, $content)
