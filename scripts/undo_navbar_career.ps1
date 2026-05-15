$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# 1. Undo Start Wrap
$searchStart = '  return (
    console.log(rr),
    jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
      children: [
        jsxRuntimeExports.jsx(Connect, {}),
        jsxRuntimeExports.jsx(Navbar, {}),
        jsxRuntimeExports.jsx(MenuButton, {}),
        jsxRuntimeExports.jsx(Menubar, {}),
        jsxRuntimeExports.jsxs("div", {
          className: "careermain",'

$replaceStart = '  return (
    console.log(rr),
    jsxRuntimeExports.jsxs("div", {
      className: "careermain",'

if ($content.Contains($searchStart)) {
    $content = $content.Replace($searchStart, $replaceStart)
    Write-Host "Undone Start"
}

# 2. Undo End Wrap
$searchEnd = '        ]
      })
    ]
  });
}



const OurProjects'

$replaceEnd = '    ],
  });
}



const OurProjects'

if ($content.Contains($searchEnd)) {
    $content = $content.Replace($searchEnd, $replaceEnd)
    Write-Host "Undone End"
}

[System.IO.File]::WriteAllText($filePath, $content)
