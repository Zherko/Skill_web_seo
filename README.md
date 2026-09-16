# Skill_web_seo

Skill de OpenCode para auditar, planificar e implementar mejoras SEO: SEO técnico, on-page, structured data, Core Web Vitals, estrategia de contenidos y citabilidad IA (llms.txt, AI crawlers, extracción LLM).

Canónico: `/skill-web-seo` · Alias legacy: `/skill_web_seo` · Obsoleto: `/seo`.

## Por qué existe el instalador (blindaje)

En OpenCode **las skills NO crean `/comandos` por sí solas**: la skill vive en `skills/*/SKILL.md` y el slash vive en `commands/*.md`. Si solo copias `SKILL.md`, el `/skill_web_seo` nunca aparece. Este repo incluye ambos + instalador que los coloca en su sitio y verifica.

Además el nombre con guiones bajos (`skill_web_seo`) **incumple el spec actual** (`^[a-z0-9]+(-[a-z0-9]+)*$`, solo minúsculas + guiones). El canónico ahora es `skill-web-seo`; se mantiene el alias con `_` por compatibilidad.

## Instalación (recomendada)

```bash
git clone https://github.com/Zherko/Skill_web_seo /tmp/skill-web-seo
bash /tmp/skill-web-seo/install.sh --global   # o --project
```

Windows (PowerShell):

```powershell
git clone https://github.com/Zherko/Skill_web_seo $env:TEMP\skill-web-seo
& $env:TEMP\skill-web-seo\install.ps1
# por proyecto: & $env:TEMP\skill-web-seo\install.ps1 -Project
```

El instalador coloca:
- `skills/skill-web-seo/SKILL.md` (skill canónica)
- `commands/skill-web-seo.md` → `/skill-web-seo`
- `commands/skill_web_seo.md` → `/skill_web_seo` (alias legacy)
- respeta `skills/skill_web_seo/` si ya existe (fallback, no lo rompe)

Verifica con las líneas `OK skill / OK command / OK alias` y reinicia la TUI.

## Instalación manual

```bash
# skill
mkdir -p ~/.config/opencode/skills/skill-web-seo
cp SKILL.md ~/.config/opencode/skills/skill-web-seo/SKILL.md
# comandos
mkdir -p ~/.config/opencode/commands
cp command.md ~/.config/opencode/commands/skill-web-seo.md
cp command-legacy.md ~/.config/opencode/commands/skill_web_seo.md
```

## Contenido del repo

- `SKILL.md` — skill completa: checklists técnicos, on-page, internal linking, image SEO, AI SEO & citabilidad, Static HTML Blog Pattern, RSS, sitemap, tracking opcional.
- `command.md` — template del slash canónico `/skill-web-seo` (carga la skill vía herramienta `skill`, no por ruta hardcodeada).
- `command-legacy.md` — alias `/skill_web_seo`.
- `install.sh` / `install.ps1` — instalador + verificación.
