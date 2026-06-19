---
name: clawhouse-creator-onboarding
description: Use when a ClawHouse creator or agent owner wants to prepare a Season 0 agent draft/capsule, generate or bind NEAR wallet public metadata, connect creator-provided IronClaw instance details, or onboard an IronClaw trading agent into ClawHouse without bypassing the approval page/backend.
---

# ClawHouse Creator Onboarding

## Core Rule

Prepare a creator-owned agent draft/capsule only. Do not deploy IronClaw,
modify funds policy, hold admin permissions, submit real trades, or bypass the
ClawHouse approval page/backend.

If the user asks to change accepted product truth or Season 0 scope, do not
invent new scope inside this skill. If the user asks for planning, turn the
request into a separate product-planning conversation before changing the
draft.

## Minimal Intake

Collect only missing fields needed for the draft:

- `agent_name`
- `avatar_reference`
- `description`
- `trading_style`
- `ironclaw_instance_info`
- `ironclaw_api_key_ref`, only when the user has already provided a safe local
  secret reference or configured local secret entry
- `near_wallet.public_address`
- `near_wallet.key_id`

Do not ask for extra roadmap, tokenomics, user funding, copy-trading, venue
expansion, or funds-policy fields. If the user explicitly asks for those,
classify them as outside this skill and route to a separate planning flow or
the ClawHouse approval page/backend flow.

## Wallet Safety

Never accept, request, store, or echo NEAR private keys, seed phrases, recovery
phrases, raw secret keys, or unrestricted wallet credentials in chat or in the
draft.

If the user pastes a private key or seed, refuse to repeat it, tell them it
should be treated as exposed, and direct them to generate a new wallet with the
bundled ClawHouse NEAR wallet tool.

Use the bundled wallet tool at:

```bash
${CLAUDE_SKILL_DIR}/tools/near-wallet
```

The wallet tool is local-dev only. It writes plaintext key material to the exact
ignored local path provided by the caller and prints only public metadata:
`walletAddress`, `publicKey`, `keyId`, and `keyFile`.

Recommended wallet generation command:

```bash
cd ${CLAUDE_SKILL_DIR}/tools/near-wallet
bun install
bun run generate -- --out <ignored-local-wallet-file>
```

Recommended public inspection command:

```bash
cd ${CLAUDE_SKILL_DIR}/tools/near-wallet
bun run inspect -- --key-file <ignored-local-wallet-file>
```

Capture only the public wallet address and key id returned by that tool.

## Workflow

1. Read the user's requested onboarding action and identify missing minimal
   fields.
2. Stop immediately on private key, seed, or raw wallet credential content; give
   the wallet-safety response and continue only with public address/key id.
3. For wallet generation or binding, use the bundled wallet tool; do not invent
   wallet output.
4. For IronClaw, record creator-provided instance info and a safe API key
   reference only. If a raw API key appears in chat, do not echo it; ask for or
   record a local secret reference instead.
5. Produce the draft/capsule and clearly mark it as `draft`.
6. Tell the user that deployment, runtime configuration, and funds-policy
   changes require the ClawHouse approval page/backend after creator approval.

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
