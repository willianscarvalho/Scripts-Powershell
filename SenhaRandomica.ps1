[console]::BackgroundColor = "Black"
[console]::ForegroundColor = "Green"

$pshost = Get-Host
$pswindow = $pshost.ui.rawui
$newsize = $pswindow.buffersize
$newsize.height = 100
$newsize.width = 120
$pswindow.buffersize = $newsize
$newsize = $pswindow.windowsize
$newsize.height = 40
$newsize.width = 60
$pswindow.windowsize = $newsize

#$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.WindowTitle = " Gerador de Senhas "

Write-Host "`t"-NoNewline;Write-Host " "
Write-Host "`t","`t"-NoNewline;Write-Host " Gerador de Senhas "-BackgroundColor DarkGray -ForegroundColor Yellow
Write-Host "`t"-NoNewline;Write-Host " "

do {

Write-Host "`t"-NoNewline;Write-Host " "
Write-Host "`t","`t"-NoNewline;Write-Host " Gerador de Senhas " -BackgroundColor DarkGray -ForegroundColor Yellow
Write-Host "`t"-NoNewline;Write-Host " "

function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
}
 
function Scramble-String([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}
 
$password = Get-RandomCharacters -length 2 -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length 2 -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length 3 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
$password += Get-RandomCharacters -length 3 -characters '1234567890'
$password += Get-RandomCharacters -length 2 -characters '$@#'



$qtd = 0 
Write-Host "`t"-NoNewline;write-host "Informe a quantidade de Senhas"-NoNewline -ForegroundColor Blue;$QTSenhas = Read-Host " "
Write-Host " "

for($i=0;$i -lt $QTSenhas;$i++) {    
 
    $password = Scramble-String $password
    Write-Host $password

}

Write-Host " ";
Write-Host "`t"-NoNewline;Write-Host " S Para SAIR ou Enter para novas senhas " -NoNewline -ForegroundColor Yellow;$SAIR=Read-Host " "

Clear-Host " "

} while ($SAIR -ne "s")