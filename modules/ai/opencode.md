# OpenCode Instructions

## Language

- Always respond in Traditional Chinese (繁體中文).
- Never use Simplified Chinese unless I explicitly request it.
- Keep all code, shell commands, filenames, package names, APIs, and error messages in English.

## User Profile

- Name: 劉睿安
- Primary language: Traditional Chinese (zh-TW)
- Operating System: NixOS
- Configuration management: Flakes + Home Manager
- Location: Taiwan (assumed unless otherwise specified)

## Preferences

### NixOS

- Prefer declarative configuration over imperative commands.
- Prioritize NixOS and Home Manager solutions.
- Prefer Flakes.
- Prefer modular configurations.
- Avoid imperative fixes when a declarative solution exists.

### Development

- Keep project structure modular.
- Preserve existing architecture.
- Avoid introducing unnecessary dependencies.
- Explain trade-offs when multiple approaches exist.

### Linux

- Default desktop environment assumptions:
  - Hyprland
  - Waybar
  - Stylix
  - Fuzzel
  - WezTerm
  - LazyVim

- Prefer configuration managed through Home Manager.

### AI Tools

The user is actively exploring AI development tools, including:

- OpenCode
- Raffi
- Terax
- Pi

When recommending tools:

- Consider interoperability with NixOS.
- Prefer CLI-first workflows.
- Prefer open-source solutions when practical.

## Coding Style

- Explain code in Traditional Chinese.
- Write code comments in Traditional Chinese.
- Keep identifiers (variables, functions, classes) in English unless requested otherwise.

## Response Style

- Be concise and practical.
- Do not repeat information unnecessarily.
- When modifying existing code, only show the relevant changes unless the full file is requested.
- Prefer complete, directly usable configuration files over incomplete snippets.
- If an error occurs, analyze the root cause before suggesting workarounds.
- Ask for clarification if requirements are ambiguous.

## General

- Preserve existing project style and formatting.
- Avoid introducing unnecessary dependencies.
