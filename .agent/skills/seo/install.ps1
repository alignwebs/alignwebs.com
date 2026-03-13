#!/usr/bin/env pwsh
$ErrorActionPreference = 'Stop'

$REPO_URL = if ($env:REPO_URL) { $env:REPO_URL } else { 'https://github.com/Bhanunamikaze/Agentic-SEO-Skill.git' }
$SKILL_NAME = 'seo'
$TARGET = 'antigravity'
$PROJECT_DIR = (Get-Location).Path
$FORCE = $false
$INSTALL_DEPS = $false
$INSTALL_PLAYWRIGHT = $false
$SOURCE_MODE = 'auto'
$REPO_PATH = ''
$TEMP_DIR = $null

function Show-Usage {
@'
SEO Skill Installer (Antigravity / Claude / Codex)

Usage:
  pwsh ./install.ps1 [options]

Options:
  --target <antigravity|claude|codex|global|all> Install target (default: antigravity)
  --project-dir <path>                            Project path for antigravity target (default: current directory)
  --skill-name <name>                             Installed folder name (default: seo)
  --repo-url <url>                                Source Git URL for remote mode
  --source <auto|local|remote>                    Source mode (default: auto)
  --repo-path <path>                              Use a specific local repository path as source
  --install-deps                                  Install Python deps (requests, beautifulsoup4)
  --install-playwright                            Also install Playwright + Chromium
  --force                                         Overwrite existing target directory
  -h, --help                                      Show help

Examples:
  # Antigravity (project-local)
  pwsh ./install.ps1 --target antigravity --project-dir /path/to/project

  # Claude
  pwsh ./install.ps1 --target claude

  # Codex only
  pwsh ./install.ps1 --target codex

  # Global install (Claude + Codex)
  pwsh ./install.ps1 --target global

  # Install from a local checkout path
  pwsh ./install.ps1 --target antigravity --project-dir /path/to/project --repo-path /path/to/Agentic-SEO-Skill

  # Install from a custom remote repository URL
  pwsh ./install.ps1 --target codex --source remote --repo-url https://github.com/you/Agentic-SEO-Skill.git

  # All targets
  pwsh ./install.ps1 --target all --project-dir /path/to/project
'@ | Write-Host
}

function Require-Cmd {
  param([Parameter(Mandatory = $true)][string]$Cmd)
  if (-not (Get-Command -Name $Cmd -ErrorAction SilentlyContinue)) {
    throw "Error: required command not found: $Cmd"
  }
}

function Resolve-Dir {
  param([Parameter(Mandatory = $true)][string]$Dir)
  if (-not (Test-Path -LiteralPath $Dir -PathType Container)) {
    throw "Error: directory not found: $Dir"
  }
  return (Resolve-Path -LiteralPath $Dir).Path
}

function Get-RelativePathCompat {
  param(
    [Parameter(Mandatory = $true)][string]$BasePath,
    [Parameter(Mandatory = $true)][string]$Path
  )

  $baseFull = [System.IO.Path]::GetFullPath($BasePath)
  $pathFull = [System.IO.Path]::GetFullPath($Path)

  $relativeMethod = [System.IO.Path].GetMethod(
    'GetRelativePath',
    [System.Reflection.BindingFlags]::Public -bor [System.Reflection.BindingFlags]::Static,
    $null,
    [Type[]]@([string], [string]),
    $null
  )

  if ($relativeMethod) {
    return [System.IO.Path]::GetRelativePath($baseFull, $pathFull)
  }

  if (-not $baseFull.EndsWith([System.IO.Path]::DirectorySeparatorChar) -and
      -not $baseFull.EndsWith([System.IO.Path]::AltDirectorySeparatorChar)) {
    $baseFull += [System.IO.Path]::DirectorySeparatorChar
  }

  $baseUri = [System.Uri]$baseFull
  $pathUri = [System.Uri]$pathFull
  $relativeUri = $baseUri.MakeRelativeUri($pathUri)
  $relative = [System.Uri]::UnescapeDataString($relativeUri.ToString())

  return $relative.Replace('/', [System.IO.Path]::DirectorySeparatorChar)
}

function Invoke-ExternalCommand {
  param(
    [Parameter(Mandatory = $true)][string]$Command,
    [string[]]$Arguments = @()
  )

  $stdoutPath = [System.IO.Path]::GetTempFileName()
  $stderrPath = [System.IO.Path]::GetTempFileName()

  try {
    $proc = Start-Process -FilePath $Command -ArgumentList $Arguments -Wait -PassThru `
      -RedirectStandardOutput $stdoutPath -RedirectStandardError $stderrPath

    $stdout = Get-Content -LiteralPath $stdoutPath -Raw -ErrorAction SilentlyContinue
    $stderr = Get-Content -LiteralPath $stderrPath -Raw -ErrorAction SilentlyContinue

    if (-not [string]::IsNullOrEmpty($stdout)) {
      [Console]::Out.Write($stdout)
    }
    if (-not [string]::IsNullOrEmpty($stderr)) {
      [Console]::Out.Write($stderr)
    }

    return $proc.ExitCode
  }
  finally {
    Remove-Item -LiteralPath $stdoutPath, $stderrPath -Force -ErrorAction SilentlyContinue
  }
}

function Is-Excluded {
  param(
    [Parameter(Mandatory = $true)][string]$RelativePath,
    [Parameter(Mandatory = $true)][bool]$IsDirectory
  )

  $rel = $RelativePath.Replace('\', '/')
  if ($rel.StartsWith('./')) {
    $rel = $rel.Substring(2)
  }
  while ($rel.StartsWith('/')) {
    $rel = $rel.Substring(1)
  }
  $segments = $rel.Split('/', [System.StringSplitOptions]::RemoveEmptyEntries)
  if ([string]::IsNullOrWhiteSpace($rel) -or $rel -eq '.') {
    return $false
  }

  if ($segments.Count -gt 0 -and $segments[0] -eq '.git') { return $true }
  if ($segments.Count -gt 0 -and $segments[0] -eq '.github') { return $true }
  if ($segments.Count -gt 0 -and $segments[0] -eq 'docs') { return $true }
  if ($segments -contains '__pycache__') { return $true }
  if ($segments -contains 'smoke-screenshots-hackingdream') { return $true }

  if (-not $IsDirectory) {
    $name = [System.IO.Path]::GetFileName($rel)

    if ($rel -eq '.gitignore') { return $true }
    if ($rel -like 'README*') { return $true }
    if ($rel -like 'LICENSE*') { return $true }
    if ($segments.Count -eq 1 -and $rel -like 'install.*') { return $true }
    if ($name -like '*.pyc') { return $true }
    if ($name -like 'seo-report-*.html') { return $true }

  }

  return $false
}

function Copy-Skill {
  param(
    [Parameter(Mandatory = $true)][string]$Src,
    [Parameter(Mandatory = $true)][string]$Dest,
    [Parameter(Mandatory = $true)][string]$Label
  )

  if ((Test-Path -LiteralPath $Dest) -and (-not $FORCE)) {
    throw "Error: $Label target already exists: $Dest`nUse --force to overwrite."
  }

  $destParent = Split-Path -Path $Dest -Parent
  if (-not (Test-Path -LiteralPath $destParent)) {
    New-Item -ItemType Directory -Path $destParent -Force | Out-Null
  }

  if (Test-Path -LiteralPath $Dest) {
    Remove-Item -LiteralPath $Dest -Recurse -Force
  }

  New-Item -ItemType Directory -Path $Dest -Force | Out-Null

  Get-ChildItem -LiteralPath $Src -Force -Recurse | ForEach-Object {
    $item = $_
    $relative = Get-RelativePathCompat -BasePath $Src -Path $item.FullName
    $isDir = $item.PSIsContainer

    if (Is-Excluded -RelativePath $relative -IsDirectory $isDir) {
      return
    }

    $targetPath = Join-Path -Path $Dest -ChildPath $relative

    if ($isDir) {
      if (-not (Test-Path -LiteralPath $targetPath)) {
        New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
      }
    }
    else {
      $targetParent = Split-Path -Path $targetPath -Parent
      if (-not (Test-Path -LiteralPath $targetParent)) {
        New-Item -ItemType Directory -Path $targetParent -Force | Out-Null
      }
      Copy-Item -LiteralPath $item.FullName -Destination $targetPath -Force
    }
  }

  Write-Host "Installed for ${Label}: $Dest"
}

$idx = 0
while ($idx -lt $args.Count) {
  $arg = $args[$idx]
  switch ($arg) {
    '--target' {
      if (($idx + 1) -ge $args.Count) { throw 'Error: missing value for --target' }
      $TARGET = $args[$idx + 1]
      $idx += 2
      continue
    }
    '--project-dir' {
      if (($idx + 1) -ge $args.Count) { throw 'Error: missing value for --project-dir' }
      $PROJECT_DIR = $args[$idx + 1]
      $idx += 2
      continue
    }
    '--skill-name' {
      if (($idx + 1) -ge $args.Count) { throw 'Error: missing value for --skill-name' }
      $SKILL_NAME = $args[$idx + 1]
      $idx += 2
      continue
    }
    '--repo-url' {
      if (($idx + 1) -ge $args.Count) { throw 'Error: missing value for --repo-url' }
      $REPO_URL = $args[$idx + 1]
      $idx += 2
      continue
    }
    '--source' {
      if (($idx + 1) -ge $args.Count) { throw 'Error: missing value for --source' }
      $SOURCE_MODE = $args[$idx + 1]
      $idx += 2
      continue
    }
    '--repo-path' {
      if (($idx + 1) -ge $args.Count) { throw 'Error: missing value for --repo-path' }
      $REPO_PATH = $args[$idx + 1]
      $idx += 2
      continue
    }
    '--install-deps' {
      $INSTALL_DEPS = $true
      $idx += 1
      continue
    }
    '--install-playwright' {
      $INSTALL_PLAYWRIGHT = $true
      $INSTALL_DEPS = $true
      $idx += 1
      continue
    }
    '--force' {
      $FORCE = $true
      $idx += 1
      continue
    }
    '-h' {
      Show-Usage
      exit 0
    }
    '--help' {
      Show-Usage
      exit 0
    }
    default {
      Show-Usage
      throw "Unknown option: $arg"
    }
  }
}

if ($TARGET -notin @('antigravity', 'claude', 'codex', 'global', 'all')) {
  throw "Error: invalid --target: $TARGET"
}
if ($SOURCE_MODE -notin @('auto', 'local', 'remote')) {
  throw "Error: invalid --source: $SOURCE_MODE"
}

Require-Cmd -Cmd 'python3'

$SCRIPT_DIR = if ($PSScriptRoot) { $PSScriptRoot } else { (Get-Location).Path }
$SRC_DIR = ''
$SHOULD_CLONE = $false

if (-not [string]::IsNullOrWhiteSpace($REPO_PATH)) {
  $SRC_DIR = Resolve-Dir -Dir $REPO_PATH
  Write-Host "Using repo path source: $SRC_DIR"
}
elseif ($SOURCE_MODE -eq 'local') {
  $SRC_DIR = $SCRIPT_DIR
  Write-Host "Using local source: $SRC_DIR"
}
elseif ($SOURCE_MODE -eq 'remote') {
  $SHOULD_CLONE = $true
}
elseif (Test-Path -LiteralPath (Join-Path $SCRIPT_DIR 'SKILL.md') -PathType Leaf) {
  $SRC_DIR = $SCRIPT_DIR
  Write-Host "Using local source: $SRC_DIR"
}
else {
  $SHOULD_CLONE = $true
}

try {
  if ($SHOULD_CLONE) {
    Require-Cmd -Cmd 'git'
    $TEMP_DIR = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $TEMP_DIR -Force | Out-Null

    $cloneDir = Join-Path $TEMP_DIR 'repo'
    Write-Host "Cloning source repo: $REPO_URL"

    $cloneExitCode = Invoke-ExternalCommand -Command 'git' -Arguments @('clone', '--depth', '1', $REPO_URL, $cloneDir)
    if ($cloneExitCode -ne 0) {
      throw "Error: failed to clone source repo: $REPO_URL`nTip: pass --repo-url <git-url> or set REPO_URL for remote installs."
    }

    $SRC_DIR = $cloneDir
    Write-Host "Using remote source: $SRC_DIR"
  }

  if (-not (Test-Path -LiteralPath (Join-Path $SRC_DIR 'SKILL.md') -PathType Leaf)) {
    throw "Error: SKILL.md not found in source directory: $SRC_DIR"
  }

  Write-Host ''
  Write-Host 'Installing SEO Skill'
  Write-Host "Target: $TARGET"
  Write-Host "Skill name: $SKILL_NAME"
  Write-Host ''

  if ($TARGET -in @('antigravity', 'all')) {
    $AG_DIR = Join-Path (Join-Path $PROJECT_DIR '.agent/skills') $SKILL_NAME
    Copy-Skill -Src $SRC_DIR -Dest $AG_DIR -Label 'antigravity'
  }

  if ($TARGET -in @('claude', 'global', 'all')) {
    $CLAUDE_DIR = Join-Path (Join-Path $HOME '.claude/skills') $SKILL_NAME
    Copy-Skill -Src $SRC_DIR -Dest $CLAUDE_DIR -Label 'claude'
  }

  if ($TARGET -in @('codex', 'global', 'all')) {
    $CODEX_ROOT = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
    $CODEX_DIR = Join-Path (Join-Path $CODEX_ROOT 'skills') $SKILL_NAME
    Copy-Skill -Src $SRC_DIR -Dest $CODEX_DIR -Label 'codex'
  }

  if ($INSTALL_DEPS) {
    Write-Host ''
    Write-Host 'Installing Python dependencies...'

    $depsExitCode = Invoke-ExternalCommand -Command 'python3' -Arguments @('-m', 'pip', 'install', '--user', 'requests', 'beautifulsoup4')
    if ($depsExitCode -eq 0) {
      Write-Host 'Installed requests + beautifulsoup4'
    }
    else {
      Write-Warning 'Could not auto-install Python dependencies. Install manually:'
      Write-Host '  python3 -m pip install --user requests beautifulsoup4'
    }

    if ($INSTALL_PLAYWRIGHT) {
      $pipExitCode = Invoke-ExternalCommand -Command 'python3' -Arguments @('-m', 'pip', 'install', '--user', 'playwright')
      $pipOk = ($pipExitCode -eq 0)
      $playwrightOk = $false

      if ($pipOk) {
        $playwrightExitCode = Invoke-ExternalCommand -Command 'python3' -Arguments @('-m', 'playwright', 'install', 'chromium')
        $playwrightOk = ($playwrightExitCode -eq 0)
      }

      if ($pipOk -and $playwrightOk) {
        Write-Host 'Installed Playwright + Chromium'
      }
      else {
        Write-Warning 'Could not auto-install Playwright. Install manually:'
        Write-Host '  python3 -m pip install --user playwright && python3 -m playwright install chromium'
      }
    }
  }

  Write-Host ''
  Write-Host 'Install complete.'
  Write-Host 'Next: restart your tool session to pick up the installed skill.'
}
finally {
  if ($TEMP_DIR -and (Test-Path -LiteralPath $TEMP_DIR)) {
    Remove-Item -LiteralPath $TEMP_DIR -Recurse -Force
  }
}
