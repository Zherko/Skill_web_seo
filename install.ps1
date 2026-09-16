# Installer for skill-web-seo (OpenCode, Windows PowerShell)
# Installs: skill (canonical hyphen name) + slash commands (canonical + legacy alias)
# Usage: .\install.ps1 [-Project]
#   default -> $HOME\.config\opencode (global)
#   -Project -> .\.opencode (current project)
param([switch]$Project)

$ErrorActionPreference = "Stop"
$SrcDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if ($Project) { $Base = Join-Path (Get-Location) ".opencode" }
else { $Base = Join-Path $HOME ".config\opencode" }

$SkillDir = Join-Path $Base "skills\skill-web-seo"
$CmdDir = Join-Path $Base "commands"
$LegacySkillDir = Join-Path $Base "skills\skill_web_seo"

New-Item -ItemType Directory -Path $SkillDir, $CmdDir -Force | Out-Null

# 1. Skill (canonical, spec-compliant hyphen name)
Copy-Item -LiteralPath (Join-Path $SrcDir "SKILL.md") -Destination (Join-Path $SkillDir "SKILL.md") -Force

# 2. Slash commands: canonical + legacy alias
Copy-Item -LiteralPath (Join-Path $SrcDir "command.md") -Destination (Join-Path $CmdDir "skill-web-seo.md") -Force
Copy-Item -LiteralPath (Join-Path $SrcDir "command-legacy.md") -Destination (Join-Path $CmdDir "skill_web_seo.md") -Force

# 3. Legacy skill dir: keep as fallback if present
if (Test-Path -LiteralPath $LegacySkillDir) {
  Write-Output "Legacy skill dir found at $LegacySkillDir — kept as fallback."
} else {
  Write-Output "No legacy skill dir — canonical install is enough."
}

Write-Output "--- verify ---"
if (Test-Path (Join-Path $SkillDir "SKILL.md")) { Write-Output "OK skill: $SkillDir\SKILL.md" }
if (Test-Path (Join-Path $CmdDir "skill-web-seo.md")) { Write-Output "OK command: $CmdDir\skill-web-seo.md (/skill-web-seo)" }
if (Test-Path (Join-Path $CmdDir "skill_web_seo.md")) { Write-Output "OK alias:   $CmdDir\skill_web_seo.md (/skill_web_seo)" }
Get-Content -LiteralPath (Join-Path $SkillDir "SKILL.md") -TotalCount 3
Write-Output "Done. Restart opencode TUI and type /skill-web-seo"
