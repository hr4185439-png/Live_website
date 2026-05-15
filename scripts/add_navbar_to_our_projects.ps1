$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for OurProjects only
$searchOP = 'const OurProjects = () => {
  reactExports.useEffect(() => {
    window.scrollTo(0, 0);
  }, []);
  return jsxRuntimeExports.jsx("div", {
    className: "mainmain",
    children: jsxRuntimeExports.jsx("h1", {
      style: { color: "white", textAlign: "center", paddingTop: "40vh", fontSize: "2rem", fontWeight: "300" },
      children: "OUR PROJECTS COMING SOON"
    })
  });
};'

$replaceOP = 'const OurProjects = () => {
  reactExports.useEffect(() => {
    window.scrollTo(0, 0);
  }, []);
  return jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
    children: [
      jsxRuntimeExports.jsx(Navbar, {}),
      jsxRuntimeExports.jsx("div", {
        className: "mainmain",
        children: jsxRuntimeExports.jsx("h1", {
          style: { color: "white", textAlign: "center", paddingTop: "40vh", fontSize: "2rem", fontWeight: "300" },
          children: "OUR PROJECTS COMING SOON"
        })
      })
    ]
  });
};'

if ($content.Contains($searchOP)) {
    $content = $content.Replace($searchOP, $replaceOP)
    Write-Host "Updated OurProjects with Navbar"
} else {
    Write-Host "Could not find OurProjects component"
}

[System.IO.File]::WriteAllText($filePath, $content)
