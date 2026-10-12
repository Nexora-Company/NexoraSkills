# NexoraSkills

Colección oficial de skills de Nexora para OpenCode y Claude Code. Una sola fuente de verdad, instalación única para ambas herramientas.

[![License: Apache-2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Skills: 5](https://img.shields.io/badge/skills-5-red.svg)](#skills)
[![OpenCode](https://img.shields.io/badge/OpenCode-compatible-black.svg)](https://opencode.ai/v2/docs/skills)
[![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-orange.svg)](https://code.claude.com/docs/en/skills.md)
[![Windows](https://img.shields.io/badge/Windows-compatible-0078D6.svg)](install.ps1)
[![Linux/macOS](https://img.shields.io/badge/Linux%2FmacOS-compatible-1A1A1A.svg)](install.sh)

## Propósito e integración

Este repositorio es la **única fuente de verdad** para las skills de Nexora. Cada skill es un directorio con un `SKILL.md` que sigue el estándar [Agent Skills](https://agentskills.io), por lo que el mismo contenido funciona en OpenCode y en Claude Code sin duplicar archivos.

- **OpenCode** descubre skills en `~/.config/opencode/skills` (global) y `.opencode/skills` (proyecto). También lee `~/.claude/skills` y `~/.agents/skills` como fuentes de compatibilidad.
- **Claude Code** descubre skills en `~/.claude/skills` (personal) y `.claude/skills` (proyecto).
- El instalador `install.sh` crea symlinks a los tres destinos globales a la vez, así **un solo comando cubre ambas herramientas**.

Nomenclatura: se respeta la escritura oficial `Nexora` y el catálogo definido en `product-catalog`. No se crean variantes de producto fuera de esa skill.

## Estructura del proyecto

```text
NexoraSkills/
├── README.md
├── LICENSE                  # Apache-2.0
├── install.sh               # instalador único OpenCode + Claude (Linux/macOS)
├── install.ps1              # instalador único OpenCode + Claude (Windows PowerShell)
├── .gitignore
├── git-release/
│   └── SKILL.md
├── nexora-standards/
│   └── SKILL.md
├── product-catalog/
│   └── SKILL.md
├── production-readiness/
│   └── SKILL.md
└── visual-identity/
    └── SKILL.md
```

Cada skill nueva es un directorio nuevo con su `SKILL.md`. El instalador detecta automáticamente cualquier directorio que contenga `SKILL.md`, no hay lista fija que mantener.

## Skills

| Skill | Descripción | Workflow |
|---|---|---|
| `git-release` | Releases, tags y changelogs consistentes para repos Nexora. | `github` |
| `nexora-standards` | Estándares de tech lead: README estrictos, commits atómicos, `.gitignore` y limpieza Git para Apps (Flutter/Dart) y Web (React/Next.js/Vite). | `nexora-architecture` |
| `product-catalog` | Fuente única de verdad del catálogo Nexora (Nexo, Slate, One, Buds, Sight, Pulse, Home, Dot). | `nexora-catalog` |
| `production-readiness` | Auditoría y validación del sitio Nexora para producción. | — |
| `visual-identity` | Identidad visual oficial de Nexora (color, tipografía, marca, accesibilidad). | `nexora-visual-identity` |

Todas declaran `license: Apache-2.0` y `compatibility: opencode, claude-code` en su frontmatter.

## Quick Start

### Instalación única (OpenCode + Claude, global)

**Linux / macOS (bash):**
```bash
curl -fsSL https://raw.githubusercontent.com/Nexora-Company/NexoraSkills/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/Nexora-Company/NexoraSkills/main/install.ps1 | iex
```

Esto clona a `~/.local/share/nexora-skills` (Linux/macOS) o `~\.local\share\nexora-skills` (Windows) y enlaza las 5 skills en:

- `~/.config/opencode/skills/` / `%APPDATA%\opencode\skills\` (OpenCode global)
- `~/.claude/skills/` / `~\.claude\skills\` (Claude personal + compatibilidad OpenCode)
- `~/.agents/skills/` / `~\.agents\skills\` (compatibilidad OpenCode)

Actualizar después:

```bash
git -C ~/.local/share/nexora-skills pull --ff-only
```

```powershell
git -C ~\.local\share\nexora-skills pull --ff-only
```

Los symlinks apuntan al clon, así que no hay que reinstalar.

### Desde clon local

**Linux / macOS:**
```bash
git clone https://github.com/Nexora-Company/NexoraSkills.git
./NexoraSkills/install.sh
```

**Windows:**
```powershell
git clone https://github.com/Nexora-Company/NexoraSkills.git
.\NexoraSkills\install.ps1
```

### Solo una herramienta

**Linux / macOS:**
```bash
./install.sh --opencode-only
./install.sh --claude-only
```

**Windows:**
```powershell
.\install.ps1 -OpencodeOnly
.\install.ps1 -ClaudeOnly
```

### Proyecto actual (commit compartido con el equipo)

**Linux / macOS:**
```bash
./install.sh --project
```

**Windows:**
```powershell
.\install.ps1 -Project
```

Instala en `./.opencode/skills/` y `./.claude/skills/`. Commit esos directorios si el equipo debe compartirlas.

### Copia en vez de symlink / desinstalar

**Linux / macOS:**
```bash
./install.sh --copy
./install.sh --uninstall
./install.sh --help
```

**Windows:**
```powershell
.\install.ps1 -Copy
.\install.ps1 -Uninstall
.\install.ps1 -Help
```

### Uso

OpenCode:

```text
@git-release prepara la release 1.2.0
@nexora-standards genera el README del repo
```

O carga explícita con la herramienta `skill` y el ID exacto (`git-release`, `nexora-standards`, `product-catalog`, `production-readiness`, `visual-identity`).

Claude Code:

```text
/git-release
/nexora-standards
/product-catalog
```

## Desarrollo local y validación

Requisitos: `bash`, `git`, `ln`, `cp` (Linux/macOS) / `PowerShell 5.1+`, `git` (Windows).

**Linux / macOS:**
```bash
# Validar que toda skill tenga frontmatter mínimo
grep -H "^name:\|^description:\|^license:\|^compatibility:" */SKILL.md

# Probar el instalador sin tocar tu config real
HOME=/tmp/opencode/nexora-check NEXORA_SKILLS_SRC=$PWD ./install.sh --global
find /tmp/opencode/nexora-check -maxdepth 4 | sort

# Probar instalación de proyecto
mkdir -p /tmp/opencode/proj-check && cd /tmp/opencode/proj-check
NEXORA_SKILLS_SRC=/home/saaarmyx/Desktop/Nexora/NexoraSkills bash /home/saaarmyx/Desktop/Nexora/NexoraSkills/install.sh --project
```

**Windows (PowerShell):**
```powershell
# Validar que toda skill tenga frontmatter mínimo
Get-ChildItem */SKILL.md | ForEach-Object { Select-String -Pattern "^name:|^description:|^license:|^compatibility:" $_ }

# Probar el instalador sin tocar tu config real
$env:HOME = "C:\tmp\opencode\nexora-check"; $env:NEXORA_SKILLS_SRC = $PWD; .\install.ps1 -Global
Get-ChildItem C:\tmp\opencode\nexora-check -Recurse -Depth 4 | Sort-Object FullName

# Probar instalación de proyecto
New-Item -ItemType Directory -Path C:\tmp\opencode\proj-check -Force | Out-Null
Set-Location C:\tmp\opencode\proj-check
$env:NEXORA_SKILLS_SRC = "C:\Users\Saaarmyx\Desktop\NexoraSkills"; . "C:\Users\Saaarmyx\Desktop\NexoraSkills\install.ps1" -Project
```

Reglas para agregar una skill:

1. Directorio en kebab-case (`^[a-z0-9]+(-[a-z0-9]+)*$`) con `SKILL.md` dentro.
2. Frontmatter con `name` (= nombre del directorio), `description` (cuándo usarla), `license: Apache-2.0`, `compatibility: opencode, claude-code`.
3. Solo los 6 campos del spec Agent Skills si debe subir a claude.ai (`name`, `description`, `license`, `compatibility`, `metadata`, `allowed-tools`).

## Licencia

Verificado: este repositorio usa **Apache License 2.0** (`LICENSE`). Es la licencia correcta para este caso porque:

1. Es un proyecto corporativo abierto de Nexora que necesita concesión expresa de patentes (sección 3), algo que MIT no otorga.
2. Permite uso comercial, modificación y distribución con solo conservar avisos de copyright y la licencia.
3. Ya era la licencia del archivo `LICENSE` del repo; las 5 skills declaraban `MIT` en su frontmatter por inconsistencia, corregido a `Apache-2.0` para alinear repo y skills.

```text
Copyright 2026 Nexora
Licensed under the Apache License, Version 2.0.
```

Ver `LICENSE` para el texto completo.

## Contribución

- Commits atómicos siguiendo [Conventional Commits](https://www.conventionalcommits.org/) (`feat`, `fix`, `docs`, `chore`).
- Prohibido `git add .`. Usa rutas explícitas: `git add README.md install.sh <skill>/SKILL.md`.
- Una skill nueva = un commit. Cambios de installer/README = commits separados.
- No inventar nombres de producto fuera de `product-catalog` ni recursos visuales fuera de `visual-identity`.
