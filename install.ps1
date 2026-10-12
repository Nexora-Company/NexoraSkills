<# 
.SYNOPSIS
    NexoraSkills installer — OpenCode + Claude Code in one step for Windows.

.DESCRIPTION
    Installs all Nexora skills for OpenCode and/or Claude Code.
    Creates symlinks (or copies) to the skill directories in the appropriate locations.

.PARAMETER Global
    Installs at user level (default). Covers OpenCode and Claude.

.PARAMETER Project
    Installs in the current project (./.opencode/skills and ./.claude/skills).

.PARAMETER OpencodeOnly
    Only installs OpenCode destinations.

.PARAMETER ClaudeOnly
    Only installs Claude destinations.

.PARAMETER Copy
    Copies files instead of creating symlinks.

.PARAMETER Uninstall
    Removes symlinks/copies installed by this script.

.PARAMETER Help
    Shows this help.

.EXAMPLE
    # One-liner (global, both tools)
    irm https://raw.githubusercontent.com/Nexora-Company/NexoraSkills/main/install.ps1 | iex

.EXAMPLE
    # From local clone
    git clone https://github.com/Nexora-Company/NexoraSkills.git
    .\NexoraSkills\install.ps1

.EXAMPLE
    # Project-level install
    .\install.ps1 -Project

.EXAMPLE
    # Copy instead of symlink
    .\install.ps1 -Copy

.EXAMPLE
    # Uninstall
    .\install.ps1 -Uninstall
#>

[CmdletBinding(DefaultParameterSetName='Global')]
param(
    [Parameter(ParameterSetName='Global')]
    [switch]$Global,

    [Parameter(ParameterSetName='Project')]
    [switch]$Project,

    [switch]$OpencodeOnly,
    [switch]$ClaudeOnly,
    [switch]$Copy,
    [switch]$Uninstall,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

$REPO_URL = "https://github.com/Nexora-Company/NexoraSkills.git"
$SOURCE_DIR = $env:NEXORA_SKILLS_DIR ?? "$env:USERPROFILE\.local\share\nexora-skills"

$MODE = "global"
$SCOPE = "all"
$LINK_MODE = "symlink"

if ($PSBoundParameters.ContainsKey('Project')) { $MODE = "project" }
if ($OpencodeOnly) { $SCOPE = "opencode" }
if ($ClaudeOnly) { $SCOPE = "claude" }
if ($Copy) { $LINK_MODE = "copy" }

function Print-Help {
    @"
NexoraSkills installer — instala todas las skills en OpenCode y Claude Code.

Uso:
  install.ps1 [opciones]

Opciones:
  -Global           Instala a nivel usuario (por defecto). Cubre OpenCode y Claude.
  -Project          Instala en el proyecto actual (./.opencode/skills y ./.claude/skills).
  -OpencodeOnly     Solo instala destinos de OpenCode.
  -ClaudeOnly       Solo instala destinos de Claude.
  -Copy             Copia archivos en vez de symlinks.
  -Uninstall        Elimina los symlinks/copias instalados por este script.
  -Help, -h         Muestra esta ayuda.

One-liner (global, ambas herramientas):
  irm https://raw.githubusercontent.com/Nexora-Company/NexoraSkills/main/install.ps1 | iex

Desde clon local:
  git clone https://github.com/Nexora-Company/NexoraSkills.git
  .\NexoraSkills\install.ps1

Variables:
  \$env:NEXORA_SKILLS_DIR   Dónde clonar/actualizar el repo (por defecto ~\.local\share\nexora-skills).
  \$env:NEXORA_SKILLS_SRC   Usa un clon local existente como fuente en vez de clonar.
"@
}

if ($Help) { Print-Help; exit 0 }

# Resuelve la fuente de las skills.
function Resolve-Source {
    if ($env:NEXORA_SKILLS_SRC) {
        return $env:NEXORA_SKILLS_SRC
    }
    # Si este script vive dentro del repo (./install.ps1 de un clon), usa ese clon.
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
    if (Test-Path "$scriptDir\README.md" -and (Test-Path "$scriptDir\git-release" -PathType Container)) {
        return $scriptDir
    }
    return $SOURCE_DIR
}

$SRC = Resolve-Source

function Sync-Repo {
    if ($env:NEXORA_SKILLS_SRC) { return }
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
    if ($SRC -eq $scriptDir) { return }

    if (Test-Path "$SRC\.git" -PathType Container) {
        git -C $SRC pull --ff-only
    } else {
        $parent = Split-Path -Parent $SRC
        if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
        git clone $REPO_URL $SRC
    }
}

function Get-Skills {
    $skills = @()
    if (Test-Path $SRC) {
        Get-ChildItem -Path $SRC -Directory | ForEach-Object {
            if (Test-Path "$($_.FullName)\SKILL.md") {
                $skills += $_.Name
            }
        }
    }
    return $skills
}

function Get-Targets {
    if ($MODE -eq "project") {
        if ($SCOPE -eq "claude") {
            return @("$PWD\.claude\skills")
        } elseif ($SCOPE -eq "opencode") {
            return @("$PWD\.opencode\skills")
        } else {
            return @("$PWD\.opencode\skills", "$PWD\.claude\skills")
        }
    }
    # Global
    if ($SCOPE -eq "claude") {
        return @("$env:USERPROFILE\.claude\skills")
    } elseif ($SCOPE -eq "opencode") {
        return @("$env:APPDATA\opencode\skills", "$env:USERPROFILE\.agents\skills")
    } else {
        return @("$env:APPDATA\opencode\skills", "$env:USERPROFILE\.claude\skills", "$env:USERPROFILE\.agents\skills")
    }
}

function Install-One {
    param(
        [string]$Skill,
        [string]$DestRoot
    )
    $dest = Join-Path $DestRoot $Skill
    $srcSkill = Join-Path $SRC $Skill

    if (-not (Test-Path $DestRoot)) { New-Item -ItemType Directory -Path $DestRoot -Force | Out-Null }

    if ($Uninstall) {
        if (Test-Path $dest) {
            Remove-Item -Path $dest -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "removed $dest"
        }
        return
    }

    if ($LINK_MODE -eq "symlink") {
        if (Test-Path $dest) {
            $target = (Get-Item $dest).Target
            if ($target -eq $srcSkill) {
                Write-Host "ok $dest (ya instalado)"
                return
            }
            Remove-Item -Path $dest -Recurse -Force -ErrorAction SilentlyContinue
        }
        # Create symlink (requires admin or Developer Mode on Windows)
        try {
            New-Item -ItemType SymbolicLink -Path $dest -Target $srcSkill -Force | Out-Null
            Write-Host "linked $dest -> $srcSkill"
        } catch {
            Write-Warning "No se pudo crear symlink (requiere modo desarrollador o admin). Usa -Copy como alternativa."
            throw $_
        }
    } else {
        if (Test-Path $dest) { Remove-Item -Path $dest -Recurse -Force -ErrorAction SilentlyContinue }
        Copy-Item -Path $srcSkill -Destination $dest -Recurse -Force
        Write-Host "copied $dest"
    }
}

# Main
if (-not $Uninstall) { Sync-Repo }
if (-not (Test-Path $SRC)) {
    Write-Error "Fuente no encontrada: $SRC"
    exit 1
}

$skills = Get-Skills
if ($skills.Count -eq 0) {
    Write-Error "No se encontraron skills (sin SKILL.md) en $SRC"
    exit 1
}

$targets = Get-Targets
foreach ($target in $targets) {
    foreach ($s in $skills) {
        Install-One -Skill $s -DestRoot $target
    }
}

if ($Uninstall) {
    Write-Host "Desinstalación completa."
} else {
    Write-Host "Instaladas: $($skills -join ', ')"
    Write-Host "OpenCode: usa @<skill> o la herramienta skill. Claude: usa /<skill>."
}