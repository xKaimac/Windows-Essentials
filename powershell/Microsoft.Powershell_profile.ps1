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

function prompt {
    $branch = git rev-parse --abbrev-ref HEAD 2>$null
    if ($branch) {
        "PS $($executionContext.SessionState.Path.CurrentLocation) [$branch]> "
    } else {
        "PS $($executionContext.SessionState.Path.CurrentLocation)> "
    }
}
