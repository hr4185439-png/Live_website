$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# Correcting the nested structure closing
$searchBug = '          })
        ]
      })
    ]
  });
};'

$replaceFix = '          })
        })
      ]
    })
  ]
});
};'

if ($content.Contains($searchBug)) {
    $content = $content.Replace($searchBug, $replaceFix)
    Write-Host "Fixed syntax error in OurProjects"
} else {
    Write-Host "Could not find buggy pattern"
}

[System.IO.File]::WriteAllText($filePath, $content)
