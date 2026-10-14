$content = Get-Content C:\ali\index.html -Raw
$idx = $content.IndexOf("const yRel=[.10,.22,.34,.46,.58,.70,.80];")
if ($idx -ge 0) {
    $snippet = $content.Substring($idx, 500)
    $snippet = $snippet -replace "`r", ""
    $snippet = $snippet -replace "`n", "`n"
    Write-Host $snippet
}