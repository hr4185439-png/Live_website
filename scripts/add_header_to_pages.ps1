$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# 1. Update Career Start
$searchCareerStart = '  return (
    console.log(rr),
    jsxRuntimeExports.jsxs("div", {
      className: "careermain",'

$replaceCareerStart = '  return (
    console.log(rr),
    jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
      children: [
        jsxRuntimeExports.jsx(Connect, {}),
        jsxRuntimeExports.jsx(Navbar, {}),
        jsxRuntimeExports.jsx(MenuButton, {}),
        jsxRuntimeExports.jsx(Menubar, {}),
        jsxRuntimeExports.jsxs("div", {
          className: "careermain",'

if ($content.Contains($searchCareerStart)) {
    $content = $content.Replace($searchCareerStart, $replaceCareerStart)
    Write-Host "Updated Career Start"
}

# 2. Update Career End
$searchCareerEnd = '    ],
  });
}'

$replaceCareerEnd = '        ]
      })
    ]
  });
}'

# We only want to replace the ONE before OurProjects to avoid catching other components
$anchor = "const OurProjects = () => {"
if ($content.Contains($searchCareerEnd + "`n" + $anchor)) {
    $content = $content.Replace($searchCareerEnd + "`n" + $anchor, $replaceCareerEnd + "`n" + $anchor)
    Write-Host "Updated Career End"
}

# 3. Update OurProjects Start
$searchOPStart = '  return jsxRuntimeExports.jsx("div", {
    className: "mainmain",'

$replaceOPStart = '  return jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
    children: [
      jsxRuntimeExports.jsx(Connect, {}),
      jsxRuntimeExports.jsx(Navbar, {}),
      jsxRuntimeExports.jsx(MenuButton, {}),
      jsxRuntimeExports.jsx(Menubar, {}),
      jsxRuntimeExports.jsx("div", {
        className: "mainmain",'

if ($content.Contains($searchOPStart)) {
    $content = $content.Replace($searchOPStart, $replaceOPStart)
    Write-Host "Updated OurProjects Start"
}

# 4. Update OurProjects End
$searchOPEnd = '    })
  });
};'

$replaceOPEnd = '      })
    ]
  });
};'

if ($content.Contains($searchOPEnd)) {
    $content = $content.Replace($searchOPEnd, $replaceOPEnd)
    Write-Host "Updated OurProjects End"
}

[System.IO.File]::WriteAllText($filePath, $content)
