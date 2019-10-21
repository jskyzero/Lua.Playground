# please make you run with .\scripts\build.PS1

$SourcePath = Get-Location
$OutputPath = "D:\Desktop\Build\"
$OutputZipPath = $OutputPath + "run.love"
$OutputBinPath = $OutputPath + "run.exe"
$LoveLocation = "C:\App\love-11.2.0-win64\"
$LoveNeedDLLs = Get-ChildItem -Path $LoveLocation -Filter *.dll
$LoveBinPath = $LoveLocation + "love.exe"


Remove-Item -Recurse $OutputPath -ErrorAction Ignore
New-Item -ItemType directory $OutputPath | Out-Null


Add-Type -assembly "System.IO.Compression.FileSystem"
[IO.Compression.zipfile]::CreateFromDirectory($SourcePath, $OutputZipPath)

Copy-Item $LoveBinPath $OutputBinPath
cmd /c copy /b $OutputBinPath+$OutputZipPath ($OutputBinPath) | Out-Null
Remove-Item $OutputZipPath


ForEach ($item in $LoveNeedDLLs) {
  Copy-Item ($LoveLocation + $item) $OutputPath
}