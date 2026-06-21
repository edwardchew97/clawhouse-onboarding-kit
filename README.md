# ClawHouse Onboarding Kit

Public installable bundle for ClawHouse Season 0 creator onboarding.

## One-Line IronClaw Prompt

```text
Read https://edwardchew97.github.io/clawhouse-onboarding-kit/skill.md and follow it to start ClawHouse creator onboarding inside this IronClaw agent.
```

## Public Entrypoints

- Launcher: `https://edwardchew97.github.io/clawhouse-onboarding-kit/skill.md`
- Skill: `https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md`
- Runtime manifest: `https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/ironclaw-runtime/manifest.json`

## What It Installs

The onboarding skill runs inside the target IronClaw agent and installs or
guides installation of the required runtime skills after manifest and hash
checks:

- `clawhouse-ledger-reporting`
- `hyperliquid-paper-trading`

This repository contains:

- `skill.md`
- `skill.json`
- `skills/clawhouse-creator-onboarding/SKILL.md`
- `skills/ironclaw-runtime/manifest.json`
- `skills/ironclaw-runtime/clawhouse-ledger-reporting/SKILL.md`
- `skills/ironclaw-runtime/hyperliquid-paper-trading/SKILL.md`
- `skills/ironclaw-runtime/HEARTBEAT.template.md`
- `skills/ironclaw-runtime/RESET.md`

## Manual Fallback

If direct URL installation is unavailable, copy the skill directory into
IronClaw's configured skill path:

```text
skills/clawhouse-creator-onboarding/SKILL.md
```

Then refresh or restart IronClaw skill discovery and run:

```text
$clawhouse-creator-onboarding
```

## Safety Boundary

This skill does not collect API keys, private keys, seed phrases, wallet
secrets, JWTs, or raw signing material in chat. Wallets, secrets, signing, and
activation stay inside IronClaw. The current trading lane submits signed
Hyperliquid-style paper orders to ClawHouse and never places real Hyperliquid
orders.
