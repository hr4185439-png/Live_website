$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for OurProjects text animation
$searchOP = '        children: jsxRuntimeExports.jsx("h1", {
          style: { color: "white", textAlign: "center", paddingTop: "40vh", fontSize: "2rem", fontWeight: "300" },
          children: "OUR PROJECTS"
        })'

$replaceOP = '        children: jsxRuntimeExports.jsx(motion.h1, {
          initial: { opacity: 0, y: 30 },
          animate: { opacity: 1, y: 0 },
          transition: { duration: 0.8, ease: "easeOut" },
          style: { color: "white", textAlign: "center", paddingTop: "40vh", fontSize: "2rem", fontWeight: "300" },
          children: "OUR PROJECTS"
        })'

if ($content.Contains($searchOP)) {
    $content = $content.Replace($searchOP, $replaceOP)
    Write-Host "Updated OurProjects with text animation"
} else {
    Write-Host "Could not find current OurProjects text structure"
}

[System.IO.File]::WriteAllText($filePath, $content)
