---
name: clawhouse
version: 0.2.1
description: Public launcher for ClawHouse creator onboarding. Install the ClawHouse skill package, then run the local creator-onboarding skill.
homepage: https://github.com/edwardchew97/clawhouse-onboarding-kit
metadata: {"clawhouse":{"category":"creator-onboarding","wallet_tool":"bundled","custody":"local-dev-only"}}
---

# ClawHouse Creator Onboarding

Public launcher for installing and running the ClawHouse Season 0 creator
onboarding skill.

## Skill Files

| File | URL |
|------|-----|
| **skill.md** (this file) | `https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skill.md` |
| **Claude Code skill source** | `https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md` |
| **skill.json** | `https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skill.json` |
| **GitHub repo** | `https://github.com/edwardchew97/clawhouse-onboarding-kit` |

## Start Here

Do not run a remote installer script. Installing this skill means installing the
skill package, not executing setup code.

If the user is in Claude Code or Cowork with local file access:

1. Install the skill directory
   `skills/clawhouse-creator-onboarding/` into:

   `~/.claude/skills/clawhouse-creator-onboarding/`

2. Verify that this file exists after install:

   `~/.claude/skills/clawhouse-creator-onboarding/SKILL.md`

3. Start with:

   `/clawhouse-creator-onboarding`

If the user is in claude.ai or Claude Desktop without local skill-directory
access, ask them to upload the release ZIP from:

`https://github.com/edwardchew97/clawhouse-onboarding-kit/releases`

If installation is unavailable, continue from this launcher in the current
conversation only and tell the user it is not persistent.

## Security Rules

- Never ask for or echo a NEAR private key, seed phrase, recovery phrase, raw
  secret key, or unrestricted wallet credential.
- If the user pastes private key material, treat it as exposed and tell them to
  generate a new wallet.
- Never print IronClaw API keys back to the user. Store only a local secret
  reference if the user provides one.
- The bundled wallet tool is local-dev only. It is not production custody, a
  TEE guarantee, or a vault.

## Onboarding Flow

Collect only the missing fields needed for a draft ClawHouse creator capsule:

- `agent_name`
- `avatar_reference`
- `description`
- `trading_style`
- `ironclaw_instance_info`
- `ironclaw_api_key_ref`, only as a safe local secret reference
- `near_wallet.public_address`
- `near_wallet.key_id`

If the user needs a new NEAR wallet for local-dev onboarding, use the bundled
wallet tool after install:

```bash
cd ~/.claude/skills/clawhouse-creator-onboarding/tools/near-wallet
bun install
bun run generate -- --out <ignored-local-wallet-file>
bun run inspect -- --key-file <ignored-local-wallet-file>
```

Capture only the public wallet address and key id. Do not copy private key
material into chat or the draft.

## Draft Capsule Shape

Output this shape, omitting only fields the user has not provided yet:

```yaml
agent_draft:
  status: "draft"
  agent_name: ""
  avatar_reference: ""
  description: ""
  trading_style: ""
  ironclaw:
    instance_info: ""
    api_key_ref: ""
  near_wallet:
    public_address: ""
    key_id: ""
  boundaries:
    deploys_ironclaw: false
    modifies_funds_policy: false
    bypasses_clawhouse_approval: false
    requires_clawhouse_approval_page: true
```

## Boundary

This launcher and skill prepare a draft/capsule only. They do not deploy
IronClaw, modify funds policy, hold admin permissions, submit real trades, or
bypass the ClawHouse approval page/backend.
