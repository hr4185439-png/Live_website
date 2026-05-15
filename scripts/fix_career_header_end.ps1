$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Flexible search for Career end before OurProjects
$regexPattern = '(?s)    \],\n  }\);\n}\n\n\n\nconst OurProjects'
$regexReplace = "        ]\n      })\n    ]\n  });\n}\n\n\n\nconst OurProjects"

if ([regex]::IsMatch($content, $regexPattern)) {
    $content = [regex]::Replace($content, $regexPattern, $regexReplace)
    Write-Host "Updated Career End with Regex"
} else {
    Write-Host "Regex failed, trying simpler anchor"
    # Try just the end of the return
    $search = "    ],`n  });`n}"
    $replace = "        ]`n      })`n    ]`n  });`n}"
    # But only replace the last one before OurProjects
    $split = $content -split "const OurProjects"
    if ($split.Length -gt 1) {
        $lastPart = $split[0]
        if ($lastPart.EndsWith("    ],`n  });`n}`n`n`n`n")) {
             $split[0] = $lastPart.SubString(0, $lastPart.Length - 16) + $replace + "`n`n`n`n"
             $content = $split -join "const OurProjects"
             Write-Host "Updated Career End with anchor"
        }
    }
}

[System.IO.File]::WriteAllText($filePath, $content)
