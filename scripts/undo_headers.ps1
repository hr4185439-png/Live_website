$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# 1. Undo Career Start
$searchCareerStart = '  return (
    console.log(rr),
    jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
      children: [
        jsxRuntimeExports.jsx(Connect, {}),
        jsxRuntimeExports.jsx(Navbar, {}),
        jsxRuntimeExports.jsx(MenuButton, {}),
        jsxRuntimeExports.jsx(Menubar, {}),
        jsxRuntimeExports.jsxs("div", {
          className: "careermain",'

$replaceCareerStart = '  return (
    console.log(rr),
    jsxRuntimeExports.jsxs("div", {
      className: "careermain",'

if ($content.Contains($searchCareerStart)) {
    $content = $content.Replace($searchCareerStart, $replaceCareerStart)
    Write-Host "Undone Career Start"
}

# 2. Undo Career End
$searchCareerEnd = '        ]
      })
    ]
  });
}'

$replaceCareerEnd = '    ],
  });
}'

if ($content.Contains($searchCareerEnd)) {
    $content = $content.Replace($searchCareerEnd, $replaceCareerEnd)
    Write-Host "Undone Career End"
}

# 3. Undo OurProjects Start
$searchOPStart = '  return jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
    children: [
      jsxRuntimeExports.jsx(Connect, {}),
      jsxRuntimeExports.jsx(Navbar, {}),
      jsxRuntimeExports.jsx(MenuButton, {}),
      jsxRuntimeExports.jsx(Menubar, {}),
      jsxRuntimeExports.jsx("div", {
        className: "mainmain",'

$replaceOPStart = '  return jsxRuntimeExports.jsx("div", {
    className: "mainmain",'

if ($content.Contains($searchOPStart)) {
    $content = $content.Replace($searchOPStart, $replaceOPStart)
    Write-Host "Undone OurProjects Start"
}

# 4. Undo OurProjects End
$searchOPEnd = '      })
    ]
  });
};'

$replaceOPEnd = '    })
  });
};'

if ($content.Contains($searchOPEnd)) {
    $content = $content.Replace($searchOPEnd, $replaceOPEnd)
    Write-Host "Undone OurProjects End"
}

[System.IO.File]::WriteAllText($filePath, $content)
