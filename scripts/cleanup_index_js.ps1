$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Remove duplicate OurProjects components
$comp = @'
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
'@
# Replace all occurrences with empty, then put one back
while ($content.Contains($comp)) {
    $content = $content.Replace($comp, "")
}
# Put one back before App
$content = $content.Replace("const App = () =>", $comp + "`n" + "const App = () =>")

# Remove duplicate Routes
$route = @'
                jsxRuntimeExports.jsx(Route, {
                  path: "/our-projects",
                  element: jsxRuntimeExports.jsx(OurProjects, {}),
                }),
'@
while ($content.Contains($route)) {
    $content = $content.Replace($route, "")
}
# Put one back after Careers
$careersRoute = @'
                jsxRuntimeExports.jsx(Route, {
                  path: "/careers",
                  element: jsxRuntimeExports.jsx(Career, {}),
                }),
'@
$content = $content.Replace($careersRoute, $careersRoute + "`n" + $route)

# Remove duplicate Menu Items
$menuItem = @'
                jsxRuntimeExports.jsx(SlideInSection$1, {
                  delayy: 0.55,
                  durationn: 0.5,
                  children: jsxRuntimeExports.jsx("div", {
                    onClick: () => ir("/our-projects"),
                    children: "OUR PROJECTS",
                  }),
                }),
'@
while ($content.Contains($menuItem)) {
    $content = $content.Replace($menuItem, "")
}
# Put one back after Careers menu item
$careersMenu = @'
                jsxRuntimeExports.jsx(SlideInSection$1, {
                  delayy: 0.5,
                  durationn: 0.5,
                  children: jsxRuntimeExports.jsx("div", {
                    onClick: () => ir("/careers"),
                    children: "Career",
                  }),
                }),
'@
$content = $content.Replace($careersMenu, $careersMenu + "`n" + $menuItem)

[System.IO.File]::WriteAllText($filePath, $content)
