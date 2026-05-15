$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Targeted update for OurProjects zigzag layout
$searchOP = '      jsxRuntimeExports.jsx("div", {
        className: "mainmain",
        style: { backgroundImage: "url(' + "'/project.jpg'" + ')", backgroundSize: "cover", backgroundPosition: "center", minHeight: "100vh" },
        children: jsxRuntimeExports.jsx(motion.h1, {
          initial: { opacity: 0, y: 30 },
          animate: { opacity: 1, y: 0 },
          transition: { duration: 0.8, ease: "easeOut" },
          style: { color: "white", textAlign: "center", paddingTop: "40vh", fontSize: "2rem", fontWeight: "300" },
          children: "OUR PROJECTS"
        })
      })'

$replaceOP = '      jsxRuntimeExports.jsxs("div", {
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
            children: [
              jsxRuntimeExports.jsxs("div", { className: "project-row zig", children: [
                jsxRuntimeExports.jsx("div", { className: "big-card", children: jsxRuntimeExports.jsxs("div", { className: "project-content", children: [
                  jsxRuntimeExports.jsx("h2", { children: "Smart Infrastructure" }),
                  jsxRuntimeExports.jsx("p", { children: "Revolutionizing urban landscapes with AI-driven building management systems and sustainable energy grids." })
                ]})}),
                jsxRuntimeExports.jsx("div", { className: "small-card", children: jsxRuntimeExports.jsxs("div", { children: [
                  jsxRuntimeExports.jsx("h3", { style: { fontWeight: "700" }, children: "AI Integration" }),
                  jsxRuntimeExports.jsx("p", { style: { fontSize: "0.8rem", opacity: 0.9 }, children: "Seamlessly connecting hardware with intelligent software." })
                ]})})
              ]}),
              jsxRuntimeExports.jsxs("div", { className: "project-row zag", children: [
                jsxRuntimeExports.jsx("div", { className: "big-card", children: jsxRuntimeExports.jsxs("div", { className: "project-content", children: [
                  jsxRuntimeExports.jsx("h2", { children: "Industrial Automation" }),
                  jsxRuntimeExports.jsx("p", { children: "Implementing cutting-edge robotics and real-time monitoring for next-generation manufacturing hubs." })
                ]})}),
                jsxRuntimeExports.jsx("div", { className: "small-card", children: jsxRuntimeExports.jsxs("div", { children: [
                  jsxRuntimeExports.jsx("h3", { style: { fontWeight: "700" }, children: "Precision Tech" }),
                  jsxRuntimeExports.jsx("p", { style: { fontSize: "0.8rem", opacity: 0.9 }, children: "Optimizing throughput with sub-millisecond latency." })
                ]})})
              ]}),
              jsxRuntimeExports.jsxs("div", { className: "project-row zig", children: [
                jsxRuntimeExports.jsx("div", { className: "big-card", children: jsxRuntimeExports.jsxs("div", { className: "project-content", children: [
                  jsxRuntimeExports.jsx("h2", { children: "Eco-Systems" }),
                  jsxRuntimeExports.jsx("p", { children: "Building green data centers that utilize advanced cooling and renewable resources for a net-zero future." })
                ]})}),
                jsxRuntimeExports.jsx("div", { className: "small-card", children: jsxRuntimeExports.jsxs("div", { children: [
                  jsxRuntimeExports.jsx("h3", { style: { fontWeight: "700" }, children: "Sustainability" }),
                  jsxRuntimeExports.jsx("p", { style: { fontSize: "0.8rem", opacity: 0.9 }, children: "Leading the industry in carbon-neutral operations." })
                ]})})
              ]})
            ]
          })
        ]
      })'

if ($content.Contains($searchOP)) {
    $content = $content.Replace($searchOP, $replaceOP)
    Write-Host "Updated OurProjects with zigzag layout"
} else {
    Write-Host "Could not find current OurProjects structure"
}

[System.IO.File]::WriteAllText($filePath, $content)
