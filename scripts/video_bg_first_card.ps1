$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for first big card with video background
$searchCardVB = '              jsxRuntimeExports.jsxs("div", { className: "project-row zig", children: [
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

$replaceCardVB = '              jsxRuntimeExports.jsxs("div", { className: "project-row zig", children: [
                jsxRuntimeExports.jsxs("div", { className: "big-card video-bg", children: [
                  jsxRuntimeExports.jsx("div", { className: "card-video-background", children: 
                    jsxRuntimeExports.jsx("video", { 
                      src: "/zsaffron.mp4", 
                      autoPlay: true, 
                      muted: true, 
                      loop: true, 
                      playsInline: true 
                    })
                  }),
                  jsxRuntimeExports.jsx("div", { className: "card-video-overlay", children: "" }),
                  jsxRuntimeExports.jsxs("div", { className: "card-content-overlay", children: [
                    jsxRuntimeExports.jsx("h2", { children: "Smart Infrastructure" }),
                    jsxRuntimeExports.jsx("p", { children: "Revolutionizing urban landscapes with AI-driven building management systems and sustainable energy grids." })
                  ]})
                ]}),'

if ($content.Contains($searchCardVB)) {
    $content = $content.Replace($searchCardVB, $replaceCardVB)
    Write-Host "Updated first big card with video background"
} else {
    Write-Host "Could not find first big card video structure"
}

[System.IO.File]::WriteAllText($filePath, $content)
