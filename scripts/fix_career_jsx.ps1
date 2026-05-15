$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Find the end of Career component and close the fragment
$searchEnd = '    ],
  });
}



const OurProjects'

$replaceEnd = '        ]
      })
    ]
  });
}



const OurProjects'

if ($content.Contains($searchEnd)) {
    $content = $content.Replace($searchEnd, $replaceEnd)
    Write-Host "Replaced End"
} else {
    Write-Host "Could not find end pattern, trying regex"
    $regexPattern = '(?s)    \],\n  }\);\n}\n\n\n\nconst OurProjects'
    $regexReplace = "        ]\n      })\n    ]\n  });\n}\n\n\n\nconst OurProjects"
    
    if ([regex]::IsMatch($content, $regexPattern)) {
        $content = [regex]::Replace($content, $regexPattern, $regexReplace)
        Write-Host "Replaced End with Regex"
    } else {
        Write-Host "Regex also failed"
    }
}

[System.IO.File]::WriteAllText($filePath, $content)
