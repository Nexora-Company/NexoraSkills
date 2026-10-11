---
name: nexora-standards
description: Enforce tech lead standards for Nexora Apps (Flutter/Dart) and Nexora Web (React/Next.js/Vite) including strict README formats, atomic Git commit sequences, production .gitignore files, and cleanup CLI commands.
license: Apache-2.0
compatibility: opencode, claude-code
metadata:
  audience: tech-leads, maintainers
  workflow: nexora-architecture
---

## What I do

- Generate strict, concise technical `README.md` documentation tailored for **Nexora Apps** (Flutter/Dart) or **Nexora Web** (React/JSX/Next.js/Vite) without AI meta-talk or fillers.
- Create atomic Bash commit sequences following Conventional Commits using **explicit file paths** (`git add <path>` is enforced; `git add .` is strictly forbidden).
- Produce complete, platform-specific `.gitignore` configurations for Flutter/Dart or Node/React/Next.js/Vite.
- Output clean, non-interactive Bash scripts for local artifact cleanup and Git repository state purges.

## When to use me

Use this skill when initializing, refactoring, or preparing repositories in the Nexora ecosystem for code review or release.

---

### Output Requirements

#### 1. Official Documentation (README.md)
Output **only** inside a single markdown code block without conversational intro/outro text.

- **Title & Tagline:** Primary title, concise role within Nexora, Shields.io badges (`Flutter`/`Dart`/`Platforms` for Apps; `React`/`Vite`/`Tailwind` for Web).
- **Purpose & Integration:** Single Responsibility Principle (SRP) and integration model in the Nexora suite.
- **Project Structure:** Simplified ASCII tree (`lib/src/`, `example/` for Apps; `src/components/`, `src/hooks/` for Web).
- **Core Features & Components:** Breakdown by design tokens/modules or Atomic Design pattern.
- **Quick Start:** Idiomatic code snippet (`dart` or `jsx`) with imports and usage.
- **Local Development & Testing:** CLI commands (`flutter pub get`/`test` or `pnpm install`/`dev`/`test`).
- **Contribution Standard:** Brief note on Conventional Commits enforcement.

#### 2. Atomic Commit Sequence (Bash)
Output ready-to-run Bash commands.
- **STRICT RULE:** NEVER use `git add .`. Always specify exact paths: `git add path/to/file`.
- Follow Conventional Commits format (`feat`, `fix`, `style`, `refactor`, `chore`, `test`).
- Omit all conversational text and explanations between commands.

**Layering structure:**
- **Apps:** 1. Base Setup (`chore:`) -> 2. Tokens/Models -> 3. UI Components (`feat(ui):`) -> 4. Navigation -> 5. Screens -> 6. Examples/Tests.
- **Web:** 1. Base Setup (`chore:`) -> 2. Tokens/Styles/Types -> 3. UI Atoms/Molecules (`feat(ui):`) -> 4. Organisms/Layouts -> 5. Navigation -> 6. Pages -> 7. Hooks/State -> 8. Docs/Tests.

#### 3. Complete .gitignore
Provide clean, functional header comments (`# Build`, `# IDEs`, `# OS`).
- **Apps:** Rules for Flutter, Dart, Android, Linux, macOS, Windows, VS Code, Android Studio.
- **Web:** Rules for Node.js, package managers (npm/pnpm/yarn), React/Next.js/Vite, `.env*`, `dist/`, OS, VS Code, WebStorm.

#### 4. Git Cleanup & Purge Commands
Output executable Bash commands grouped in a single code block without interactive prompts, `if/else` checks, or internal narrative comments.

**Commands to include:**
- **Index Cache Purge:** `git rm -r --cached .` followed by path-based re-indexing.
- **Untracked File Clean:** `git clean -fdX` and `git clean -fd`.
- **Local Artifacts:**
  - *Apps:* `flutter clean` and removal of `.dart_tool/`, `build/`, `ios/Pods/`, `android/.gradle/`.
  - *Web:* Removal of `node_modules/`, `.next/`, `dist/`, `build/`, `.turbo/`, `.cache/`.
