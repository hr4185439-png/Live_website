$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# 1. Wrap Start
$searchStart = '  return (
    console.log(rr),
    jsxRuntimeExports.jsxs("div", {
      className: "careermain",'

$replaceStart = '  return (
    console.log(rr),
    jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
      children: [
        jsxRuntimeExports.jsx(Connect, {}),
        jsxRuntimeExports.jsx(Navbar, {}),
        jsxRuntimeExports.jsx(MenuButton, {}),
        jsxRuntimeExports.jsx(Menubar, {}),
        jsxRuntimeExports.jsxs("div", {
          className: "careermain",'

if ($content.Contains($searchStart)) {
    $content = $content.Replace($searchStart, $replaceStart)
    Write-Host "Replaced Start"
} else {
    Write-Host "Could not find start pattern"
}

# 2. Wrap End
$searchEnd = '  });
}
const OurProjects = () => {'

$replaceEnd = '        ]
      })
    ]
  });
}
const OurProjects = () => {'

if ($content.Contains($searchEnd)) {
    $content = $content.Replace($searchEnd, $replaceEnd)
    Write-Host "Replaced End"
} else {
    Write-Host "Could not find end pattern"
}

[System.IO.File]::WriteAllText($filePath, $content)
