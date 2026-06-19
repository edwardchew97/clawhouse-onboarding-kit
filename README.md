# ClawHouse Onboarding Kit

Public installable bundle for ClawHouse Season 0 creator onboarding.

This repository contains:

- `skills/clawhouse-creator-onboarding/SKILL.md`
- a bundled local-dev NEAR wallet tool under
  `skills/clawhouse-creator-onboarding/tools/near-wallet`

## Install In Claude Code

Claude Code discovers personal skills from `~/.claude/skills`.

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
