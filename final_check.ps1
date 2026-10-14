$content = Get-Content C:\ali\index.html -Raw

# Check ROLES
$roles = [regex]::Matches($content, "t:'[^']+'")
Write-Host ("ROLES entries: " + $roles.Count)
for ($i=0; $i -lt $roles.Count; $i++) {
    $val = $roles[$i].Value
    Write-Host ("  " + $i + ": " + $val)
}

# Check Portfolio heading
if ($content -match 'Portfolio.*Ali Fathima') { Write-Host 'Portfolio heading: OK' } else { Write-Host 'Portfolio heading: MISSING' }

# Check Code Digest link
if ($content -match 'file:///E:/code-digest.html') { Write-Host 'Code Digest link: OK' } else { Write-Host 'Code Digest link: MISSING' }

# Check removed elements
if ($content -match 'tScript|tPre') { Write-Host 'tScript/tPre refs: STILL PRESENT' } else { Write-Host 'tScript/tPre refs: REMOVED' }

# Check t-script/t-pre CSS
if ($content -match '\.t-script|\.t-pre') { Write-Host 't-script/t-pre CSS: STILL PRESENT' } else { Write-Host 't-script/t-pre CSS: REMOVED' }