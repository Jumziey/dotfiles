$systemNvim = "$HOME\AppData\Local\nvim"
$repoNvim = "$PSScriptRoot\.config\nvim"

echo "Creating Symbolic Link:"
echo "$systemNvim -> $repoNvim"
New-Item -Path $systemNvim -ItemType SymbolicLink -Value $repoNvim