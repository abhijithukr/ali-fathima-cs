$content = Get-Content C:\ali\index.html -Raw
$idx = $content.IndexOf("const PROJECTS = [")
if ($idx -ge 0) {
    $snippet = $content.Substring($idx, 500)
    Write-Host "Found at: $idx"
    Write-Host "Snippet:"
    Write-Host $snippet
} else {
    Write-Host "Not found"
}