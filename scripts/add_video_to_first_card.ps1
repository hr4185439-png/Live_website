$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for first big card with video
$searchCardV = '              jsxRuntimeExports.jsxs("div", { className: "project-row zig", children: [
                jsxRuntimeExports.jsxs("div", { className: "big-card large", children: [
                  jsxRuntimeExports.jsx("div", { className: "big-card-img-side", children: 
                    jsxRuntimeExports.jsx("img", { src: "/assets/zprincesssaffron.png", alt: "Project Saffron" })
                  }),
                  jsxRuntimeExports.jsxs("div", { className: "big-card-text-side", children: [
                    jsxRuntimeExports.jsx("h2", { children: "Smart Infrastructure" }),
                    jsxRuntimeExports.jsx("p", { children: "Revolutionizing urban landscapes with AI-driven building management systems and sustainable energy grids." })
                  ]})
                ]}),'

$replaceCardV = '              jsxRuntimeExports.jsxs("div", { className: "project-row zig", children: [
                jsxRuntimeExports.jsxs("div", { className: "big-card video-card", children: [
                  jsxRuntimeExports.jsx("div", { className: "big-card-video-side", children: 
                    jsxRuntimeExports.jsx("video", { 
                      src: "/zsaffron.mp4", 
                      autoPlay: true, 
                      muted: true, 
                      loop: true, 
                      playsInline: true 
                    })
                  }),
                  jsxRuntimeExports.jsxs("div", { className: "big-card-text-bottom", children: [
                    jsxRuntimeExports.jsx("h2", { children: "Smart Infrastructure" }),
                    jsxRuntimeExports.jsx("p", { children: "Revolutionizing urban landscapes with AI-driven building management systems and sustainable energy grids." })
                  ]})
                ]}),'

if ($content.Contains($searchCardV)) {
    $content = $content.Replace($searchCardV, $replaceCardV)
    Write-Host "Updated first big card with video"
} else {
    Write-Host "Could not find first big card large structure"
}

[System.IO.File]::WriteAllText($filePath, $content)
