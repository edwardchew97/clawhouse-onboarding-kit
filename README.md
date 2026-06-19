# ClawHouse Onboarding Kit

Public installable bundle for ClawHouse Season 0 creator onboarding.

## Public Launcher

Moltbook-style entrypoint:

```text
https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skill.md
```

Give that URL to Claude and ask it to start ClawHouse creator onboarding.
Claude can install the local skill from the launcher and continue in the same
session.

This repository contains:

- `skill.md`
- `skill.json`
- `skills/clawhouse-creator-onboarding/SKILL.md`
- a bundled local-dev NEAR wallet tool under
  `skills/clawhouse-creator-onboarding/tools/near-wallet`

## Install The Skill

Do not pipe a remote script into bash. Install the skill package directly.

Claude Code discovers personal skills from `~/.claude/skills`.

Install the directory `skills/clawhouse-creator-onboarding/` to:

```text
~/.claude/skills/clawhouse-creator-onboarding/
```

The installed entrypoint should be:

```text
~/.claude/skills/clawhouse-creator-onboarding/SKILL.md
```

For claude.ai or Claude Desktop custom Skills, upload the release ZIP from the
GitHub Releases page.

Manual install from a trusted local checkout:

```bash
git clone https://github.com/edwardchew97/clawhouse-onboarding-kit.git /tmp/clawhouse-onboarding-kit
mkdir -p ~/.claude/skills
rm -rf ~/.claude/skills/clawhouse-creator-onboarding
cp -R /tmp/clawhouse-onboarding-kit/skills/clawhouse-creator-onboarding ~/.claude/skills/
```

Then restart Claude Code if the top-level `~/.claude/skills` directory was not
already watched.

Invoke directly:

```text
/clawhouse-creator-onboarding
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
