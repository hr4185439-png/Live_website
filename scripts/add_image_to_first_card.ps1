$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for first big card with image
$searchCard1 = '              jsxRuntimeExports.jsxs("div", { className: "project-row zig", children: [
                jsxRuntimeExports.jsx("div", { className: "big-card", children: jsxRuntimeExports.jsxs("div", { className: "project-content", children: [
                  jsxRuntimeExports.jsx("h2", { children: "Smart Infrastructure" }),
                  jsxRuntimeExports.jsx("p", { children: "Revolutionizing urban landscapes with AI-driven building management systems and sustainable energy grids." })
                ]})}),'

$replaceCard1 = '              jsxRuntimeExports.jsxs("div", { className: "project-row zig", children: [
                jsxRuntimeExports.jsxs("div", { className: "big-card large", children: [
                  jsxRuntimeExports.jsx("div", { className: "big-card-img-side", children: 
                    jsxRuntimeExports.jsx("img", { src: "/assets/zprincesssaffron.png", alt: "Project Saffron" })
                  }),
                  jsxRuntimeExports.jsxs("div", { className: "big-card-text-side", children: [
                    jsxRuntimeExports.jsx("h2", { children: "Smart Infrastructure" }),
                    jsxRuntimeExports.jsx("p", { children: "Revolutionizing urban landscapes with AI-driven building management systems and sustainable energy grids." })
                  ]})
                ]}),'

if ($content.Contains($searchCard1)) {
    $content = $content.Replace($searchCard1, $replaceCard1)
    Write-Host "Updated first big card with image"
} else {
    Write-Host "Could not find first big card structure"
}

[System.IO.File]::WriteAllText($filePath, $content)
