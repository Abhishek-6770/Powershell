# $path = "/Users/abhishekjd/Downloads/"


# $Test = Get-ChildItem -Path $path -Filter *.zip | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } 
# Write-Host $Test


# $repo = "octocat/Hello-World"
# $response = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo"
# Write-Output "Repo Name: $($response.name)"
# Write-Output "Stars: $($response.owner.login)"
$count = 0


$response = Invoke-RestMethod -Uri "https://discovery.googleapis.com/discovery/v1/apis"
Write-Output "Response : $($response)"
$trueCount = $response.items.count

foreach ($item in $response.items){
    if ($item.preferred -eq $false){
        Write-Host $($item.name) $($item.title)
        $count++
        $trueCount--
    }
}

Write-Output "count : $($response.items.count)"

Write-Host "Total count of items with 'preferred' = false: $count"
Write-Host "Total count of items with 'preferred' = true: $trueCount"
# $url = "https://google.com/health"
# $delay = 5 # seconds

# # Start the while loop
# while ($true) {
#     try {
#         $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 10
#         if ($response.StatusCode -eq 200) {
#             Write-Host "Success: $url is reachable (200 OK)"
#             break
#         } else {
#             Write-Warning "Received HTTP $($response.StatusCode). Retrying in $delay sec..."
#         }
#     } catch {
#         Write-Warning "Error: $($_.Exception.Message). Retrying in $delay sec..."
#     }

#     Start-Sleep -Seconds $delay
# }
