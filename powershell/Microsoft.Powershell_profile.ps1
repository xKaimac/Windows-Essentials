Import-Module PSReadLine

function fzf-cd {
    $result = fzf
    if ($result) {
        if (Test-Path $result -PathType Container) {
            Set-Location $result
        } else {
            Set-Location (Split-Path $result)
        }
    }
    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}

Set-PSReadLineKeyHandler -Chord Ctrl+f -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    fzf-cd
}
