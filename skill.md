---
name: clawhouse
version: 0.2.0
description: Public launcher for ClawHouse creator onboarding. Install the Claude Code skill, generate or bind public NEAR wallet metadata, and prepare a draft IronClaw trading-agent capsule.
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
| **install.sh** | `https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/install.sh` |
| **Claude skill** | `https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md` |
| **skill.json** | `https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skill.json` |
| **GitHub repo** | `https://github.com/edwardchew97/clawhouse-onboarding-kit` |

## Start Here

If the user asks to start ClawHouse creator onboarding from this URL, do this:

1. Install the Claude Code skill locally with the command below.
2. Continue the onboarding flow in the current session from this document.
3. Tell the user that future Claude Code sessions can invoke it with
   `/clawhouse-creator-onboarding`.

Install locally, without `git clone`:

```bash
curl -fsSL https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/install.sh | bash
```

To install a pinned release instead of `main`:

```bash
curl -fsSL https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/install.sh | CLAWHOUSE_ONBOARDING_REF=v0.2.0 bash
```

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
