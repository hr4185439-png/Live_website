$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# 1. Add OurProjects component before App
$search1 = 'const App = () =>'
$replace1 = @'
const OurProjects = () => {
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
};
const App = () =>
'@
if ($content.Contains($search1)) {
    $content = $content.Replace($search1, $replace1)
    Write-Host "Replaced 1"
}

# 2. Add Menu Item in Menubar
$search2 = @'
                jsxRuntimeExports.jsx(SlideInSection$1, {
                  delayy: 0.5,
                  durationn: 0.5,
                  children: jsxRuntimeExports.jsx("div", {
                    onClick: () => ir("/careers"),
                    children: "Career",
                  }),
                }),
'@
$replace2 = @'
                jsxRuntimeExports.jsx(SlideInSection$1, {
                  delayy: 0.5,
                  durationn: 0.5,
                  children: jsxRuntimeExports.jsx("div", {
                    onClick: () => ir("/careers"),
                    children: "Career",
                  }),
                }),
                jsxRuntimeExports.jsx(SlideInSection$1, {
                  delayy: 0.55,
                  durationn: 0.5,
                  children: jsxRuntimeExports.jsx("div", {
                    onClick: () => ir("/our-projects"),
                    children: "OUR PROJECTS",
                  }),
                }),
'@

if ($content.Contains($search2)) {
    $content = $content.Replace($search2, $replace2)
    Write-Host "Replaced 2"
}

# 3. Add Route in App
$search3 = @'
                jsxRuntimeExports.jsx(Route, {
                  path: "/careers",
                  element: jsxRuntimeExports.jsx(Career, {}),
                }),
'@
$replace3 = @'
                jsxRuntimeExports.jsx(Route, {
                  path: "/careers",
                  element: jsxRuntimeExports.jsx(Career, {}),
                }),
                jsxRuntimeExports.jsx(Route, {
                  path: "/our-projects",
                  element: jsxRuntimeExports.jsx(OurProjects, {}),
                }),
'@

if ($content.Contains($search3)) {
    $content = $content.Replace($search3, $replace3)
    Write-Host "Replaced 3"
}

# Save back
[System.IO.File]::WriteAllText($filePath, $content)
