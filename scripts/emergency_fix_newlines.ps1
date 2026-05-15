$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath)

# The literal string injected by mistake
$buggyString = ']\n      })\n    ]\n  });\n}\n\n\n\nconst OurProjects'

# The correct restored string (since the user wants to UNDO, we revert to the simple end)
$correctString = "    ],`n  });`n}`n`n`n`nconst OurProjects"

if ($content.Contains($buggyString)) {
    $content = $content.Replace($buggyString, $correctString)
    Write-Host "Fixed the literal newline bug"
} else {
    Write-Host "Buggy string not found"
}

[System.IO.File]::WriteAllText($filePath, $content)
