#!/usr/bin/env bash
# NexoraSkills installer — OpenCode + Claude Code in one step.
# Usage:
#   install.sh [--global] [--project] [--opencode-only] [--claude-only] [--copy] [--uninstall] [--help]
set -euo pipefail

REPO_URL="https://github.com/Nexora-Company/NexoraSkills.git"
SOURCE_DIR="${NEXORA_SKILLS_DIR:-$HOME/.local/share/nexora-skills}"

MODE="global"
SCOPE="all"
LINK_MODE="symlink"
UNINSTALL=0

print_help() {
  cat <<'EOF'
NexoraSkills installer — instala todas las skills en OpenCode y Claude Code.

Uso:
  install.sh [opciones]

Opciones:
  --global          Instala a nivel usuario (por defecto). Cubre OpenCode y Claude.
  --project         Instala en el proyecto actual (./.opencode/skills y ./.claude/skills).
  --opencode-only   Solo instala destinos de OpenCode.
  --claude-only     Solo instala destinos de Claude.
  --copy            Copia archivos en vez de symlinks.
  --uninstall       Elimina los symlinks/copias instalados por este script.
  --help, -h        Muestra esta ayuda.

One-liner (global, ambas herramientas):
  curl -fsSL https://raw.githubusercontent.com/Nexora-Company/NexoraSkills/main/install.sh | bash

Desde clon local:
  git clone https://github.com/Nexora-Company/NexoraSkills.git
  ./NexoraSkills/install.sh

Variables:
  NEXORA_SKILLS_DIR   Dónde clonar/actualizar el repo (por defecto ~/.local/share/nexora-skills).
  NEXORA_SKILLS_SRC   Usa un clon local existente como fuente en vez de clonar.
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    --global) MODE="global"; shift ;;
    --project) MODE="project"; shift ;;
    --opencode-only) SCOPE="opencode"; shift ;;
    --claude-only) SCOPE="claude"; shift ;;
    --copy) LINK_MODE="copy"; shift ;;
    --uninstall) UNINSTALL=1; shift ;;
    --help|-h) print_help; exit 0 ;;
    *) echo "Opción desconocida: $1" >&2; print_help >&2; exit 1 ;;
  esac
done

# Resuelve la fuente de las skills.
resolve_source() {
  if [ -n "${NEXORA_SKILLS_SRC:-}" ]; then
    echo "$NEXORA_SKILLS_SRC"
    return
  fi
  # Si este script vive dentro del repo (./install.sh de un clon), usa ese clon.
  script_dir="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
  if [ -f "$script_dir/README.md" ] && [ -d "$script_dir/git-release" ]; then
    echo "$script_dir"
    return
  fi
  echo "$SOURCE_DIR"
}

SRC="$(resolve_source)"

sync_repo() {
  if [ -n "${NEXORA_SKILLS_SRC:-}" ]; then
    return
  fi
  script_dir="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
  if [ "$SRC" = "$script_dir" ]; then
    return
  fi
  if [ -d "$SRC/.git" ]; then
    git -C "$SRC" pull --ff-only
  else
    mkdir -p "$(dirname "$SRC")"
    git clone "$REPO_URL" "$SRC"
  fi
}

list_skills() {
  for d in "$SRC"/*/; do
    [ -f "${d}SKILL.md" ] || continue
    basename "$d"
  done
}

targets_for() {
  if [ "$MODE" = "project" ]; then
    if [ "$SCOPE" = "claude" ]; then
      echo "$PWD/.claude/skills"
    elif [ "$SCOPE" = "opencode" ]; then
      echo "$PWD/.opencode/skills"
    else
      echo "$PWD/.opencode/skills"
      echo "$PWD/.claude/skills"
    fi
    return
  fi
  # Global. Nota: OpenCode también lee ~/.claude/skills y ~/.agents/skills
  # como fuentes de compatibilidad, pero instalamos en cada destino explícito
  # para que cada herramienta funcione incluso si cambia esa compatibilidad.
  if [ "$SCOPE" = "claude" ]; then
    echo "$HOME/.claude/skills"
  elif [ "$SCOPE" = "opencode" ]; then
    echo "$HOME/.config/opencode/skills"
    echo "$HOME/.agents/skills"
  else
    echo "$HOME/.config/opencode/skills"
    echo "$HOME/.claude/skills"
    echo "$HOME/.agents/skills"
  fi
}

install_one() {
  skill="$1"
  dest_root="$2"
  dest="$dest_root/$skill"
  src_skill="$SRC/$skill"

  mkdir -p "$dest_root"
  if [ "$UNINSTALL" = "1" ]; then
    if [ -L "$dest" ] || [ -d "$dest" ]; then
      rm -rf "$dest"
      echo "removed $dest"
    fi
    return
  fi

  if [ "$LINK_MODE" = "symlink" ]; then
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src_skill" ]; then
      echo "ok $dest (ya instalado)"
      return
    fi
    rm -rf "$dest"
    ln -s "$src_skill" "$dest"
    echo "linked $dest -> $src_skill"
  else
    rm -rf "$dest"
    cp -r "$src_skill" "$dest"
    echo "copied $dest"
  fi
}

main() {
  if [ "$UNINSTALL" = "0" ]; then
    sync_repo
  fi
  if [ ! -d "$SRC" ]; then
    echo "Fuente no encontrada: $SRC" >&2
    exit 1
  fi
  skills="$(list_skills)"
  if [ -z "$skills" ]; then
    echo "No se encontraron skills (sin SKILL.md) en $SRC" >&2
    exit 1
  fi
  # shellcheck disable=SC2162
  targets_for | while read target; do
    for s in $skills; do
      install_one "$s" "$target"
    done
  done
  if [ "$UNINSTALL" = "1" ]; then
    echo "Desinstalación completa."
  else
    echo "Instaladas: $skills"
    echo "OpenCode: usa @<skill> o la herramienta skill. Claude: usa /<skill>."
  fi
}

main
