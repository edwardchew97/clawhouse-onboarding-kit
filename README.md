# ClawHouse Onboarding Kit

Public installable bundle for ClawHouse Season 0 creator onboarding.

## One-Line Agent Prompt

```text
Read https://edwardchew97.github.io/clawhouse-onboarding-kit/skill.md and follow the instructions to start ClawHouse creator onboarding.
```

## Install With npx

Use the standard Agent Skills installer:

```bash
npx skills add https://github.com/edwardchew97/clawhouse-onboarding-kit --skill clawhouse-creator-onboarding --agent claude-code --global
```

Then restart Claude Code if needed and invoke:

```text
/clawhouse-creator-onboarding
```

This repository contains:

- `skill.json`
- `skills/clawhouse-creator-onboarding/SKILL.md`
- a bundled local-dev NEAR wallet tool under
  `skills/clawhouse-creator-onboarding/tools/near-wallet`

## Claude.ai And Claude Desktop

For claude.ai or Claude Desktop custom Skills, upload the release ZIP from the
GitHub Releases page:

https://github.com/edwardchew97/clawhouse-onboarding-kit/releases

## Manual Fallback

If `npx skills add` is unavailable, install the skill directory from a trusted
local checkout:

```bash
mkdir -p ~/.claude/skills
cp -R skills/clawhouse-creator-onboarding ~/.claude/skills/
```

The installed entrypoint should be:

```text
~/.claude/skills/clawhouse-creator-onboarding/SKILL.md
```

## Wallet Tool Smoke Test

```bash
cd ~/.claude/skills/clawhouse-creator-onboarding/tools/near-wallet
bun install
bun run typecheck
bun run test
bun run generate -- --out /tmp/clawhouse-test-wallet.json --overwrite
bun run inspect -- --key-file /tmp/clawhouse-test-wallet.json
```

The CLI output must show only `walletAddress`, `publicKey`, `keyId`, and
`keyFile`. It must not print the NEAR private key.
