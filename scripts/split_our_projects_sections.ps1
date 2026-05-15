$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for OurProjects section splitting
$searchOP = '      jsxRuntimeExports.jsxs("div", {
        className: "mainmain",
        style: { backgroundImage: "url(' + "'/project.jpg'" + ')", backgroundSize: "cover", backgroundPosition: "center", minHeight: "100vh", overflowX: "hidden" },
        children: [
          jsxRuntimeExports.jsx(motion.h1, {
            initial: { opacity: 0, y: 30 },
            animate: { opacity: 1, y: 0 },
            transition: { duration: 0.8, ease: "easeOut" },
            style: { color: "white", textAlign: "center", paddingTop: "15vh", fontSize: "3.5rem", fontWeight: "800", marginBottom: "30px", trackingSpacing: "2px" },
            children: "OUR PROJECTS"
          }),
          jsxRuntimeExports.jsxs("div", {
            className: "projects-container",
            children: ['

$replaceOP = '      jsxRuntimeExports.jsxs("div", {
        className: "mainmain",
        style: { overflowX: "hidden" },
        children: [
          jsxRuntimeExports.jsx("div", {
            style: { backgroundImage: "url(' + "'/project.jpg'" + ')", backgroundSize: "cover", backgroundPosition: "center", height: "100vh", display: "flex", alignItems: "center", justifyContent: "center" },
            children: jsxRuntimeExports.jsx(motion.h1, {
              initial: { opacity: 0, y: 30 },
              animate: { opacity: 1, y: 0 },
              transition: { duration: 0.8, ease: "easeOut" },
              style: { color: "white", textAlign: "center", fontSize: "3.5rem", fontWeight: "800", trackingSpacing: "2px" },
              children: "OUR PROJECTS"
            })
          }),
          jsxRuntimeExports.jsx("div", {
            style: { background: "#050505", minHeight: "100vh", paddingBottom: "100px" },
            children: jsxRuntimeExports.jsxs("div", {
              className: "projects-container",
              children: ['

if ($content.Contains($searchOP)) {
    $content = $content.Replace($searchOP, $replaceOP)
    Write-Host "Updated OurProjects section split"
} else {
    Write-Host "Could not find current OurProjects structure"
}

[System.IO.File]::WriteAllText($filePath, $content)
