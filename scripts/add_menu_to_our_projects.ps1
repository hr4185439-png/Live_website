$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for OurProjects only
$searchOP = '  return jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
    children: [
      jsxRuntimeExports.jsx(Navbar, {}),
      jsxRuntimeExports.jsx("div", {
        className: "mainmain",'

$replaceOP = '  return jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
    children: [
      jsxRuntimeExports.jsx(Connect, {}),
      jsxRuntimeExports.jsx(Navbar, {}),
      jsxRuntimeExports.jsx(MenuButton, {}),
      jsxRuntimeExports.jsx(Menubar, {}),
      jsxRuntimeExports.jsx("div", {
        className: "mainmain",'

if ($content.Contains($searchOP)) {
    $content = $content.Replace($searchOP, $replaceOP)
    Write-Host "Updated OurProjects with full Menu suite"
} else {
    Write-Host "Could not find current OurProjects structure"
}

[System.IO.File]::WriteAllText($filePath, $content)
