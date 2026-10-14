$content = Get-Content C:\ali\index.html -Raw

# Find the PROJECTS block and replace it
$startIdx = $content.IndexOf("const PROJECTS = [")
if ($startIdx -lt 0) {
    Write-Host "PROJECTS block not found"
    exit 1
}

# Find the end of the PROJECTS array (the closing ];)
$searchStart = $startIdx
$bracketCount = 0
$endIdx = -1
for ($i = $startIdx; $i -lt $content.Length; $i++) {
    if ($content[$i] -eq '[') { $bracketCount++ }
    elseif ($content[$i] -eq ']') { 
        $bracketCount--
        if ($bracketCount -eq 0) {
            $endIdx = $i + 1
            break
        }
    }
}

if ($endIdx -lt 0) {
    Write-Host "Could not find end of PROJECTS array"
    exit 1
}

# Include the semicolon after ]
if ($content[$endIdx] -eq ';') { $endIdx++ }

Write-Host "Replacing from $startIdx to $endIdx"

$newBlock = @"
// "What have we done" pages. Each has up to 4 points (heading + one or two lines).
const PROJECTS = [
  {name:'Code Digest', kick:'PROJECT ONE', tag:'A student-led tech newsletter bringing the latest in technology, opportunities, and innovation to the CSE community.', note:'keep scrolling',
    points:[
     ['WHAT IT IS','A regular tech digest sharing emerging technologies, AI updates, industry news, internships, and hackathons with CSE students.'],
     ['WHO IT REACHED','CSE students looking to stay informed about the latest tech trends, internship opportunities, hackathons, and upcoming events.'],
     ['OUR PART','Ali was the driving force behind Code Digest, constantly following up with everyone, coordinating contributions, and pushing the team to complete their work. Her dedication and persistence kept every edition moving forward.'],
     ['WHAT CAME OF IT','Behind every successful edition was Ali\'s determination and commitment. Her constant encouragement and follow-ups helped turn the team\'s individual efforts into a shared success, keeping the CSE community informed and engaged.']]},
  {name:'Initiative Athithi CET', kick:'PROJECT TWO', tag:'A student-driven initiative built to make support, guidance, and opportunities more accessible to the CET community.', note:'there is more',
    points:[
     ['WHAT IT IS','Athithi CET is an initiative created with the aim of making useful resources and support more accessible to students, bringing people and opportunities together through a shared vision.'],
     ['WHO IT HELPED','Students who needed guidance, access to resources, and support to make the most of the opportunities available to them.'],
     ['OUR PART','Ali was there for us throughout the project, guiding us at every step and helping us find a way forward when things seemed impossible. She constantly encouraged us, believed in our abilities when we struggled to believe in ourselves, and reminded us that we were capable of making it happen. Her guidance and faith in the team helped us keep moving forward.'],
     ['WHAT CAME OF IT','There were moments when we doubted ourselves and wondered whether we could pull it off. Ali never stopped believing in us. Her support, patience, and guidance helped us push through the difficult parts and turn an idea that once seemed impossible into something real. This achievement wasn\'t just about building a project; it was also about having someone believe in us until we learned to believe in ourselves.']]}
];
"@

$newContent = $content.Substring(0, $startIdx) + $newBlock + $content.Substring($endIdx)
Set-Content C:\ali\index.html -Value $newContent -NoNewline
Write-Host "Done"