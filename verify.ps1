$content = Get-Content C:\ali\index.html -Raw

# Check PROJECTS count
$projectsMatches = [regex]::Matches($content, "name:'Code Digest'")
Write-Host "Code Digest project: $($projectsMatches.Count) found"
$projectsMatches2 = [regex]::Matches($content, "name:'Initiative Athithi CET'")
Write-Host "Athithi CET project: $($projectsMatches2.Count) found"

# Check no Project three/four/five
$oldProjects = [regex]::Matches($content, "name:'Project (three|four|five)'")
Write-Host "Old projects (should be 0): $($oldProjects.Count) found"

# Check mics fix
$micsFix = $content -match "im\.ariaHidden='true'"
Write-Host "Mics ariaHidden fix: $micsFix"

# Check for duplicate comment
$dupComment = [regex]::Matches($content, "// \"What have we done\" pages\. Each has up to 4 points")
Write-Host "Duplicate comment check (should be 1): $($dupComment.Count) found"

Write-Host "Verification complete"