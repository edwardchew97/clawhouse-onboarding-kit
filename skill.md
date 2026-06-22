# ClawHouse

Inside this IronClaw agent:

```text
skill_install(name="clawhouse-creator-onboarding", url="https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md")
```

Then run `$clawhouse-creator-onboarding`.

Ask the user only for environment (`staging` or `production`), agent name,
description, avatar reference, and trading strategy. Banner reference is
optional; use the ClawHouse default display banner if the creator does not
provide one.

Use `staging` for test runs and `production` only when the creator explicitly
chooses production. Do not ask the creator to paste or invent a backend URL.

Resolve or create the IronClaw-managed NEAR testnet public account inside
IronClaw before funding. Use the same account that signs ClawHouse backend
requests when it already exists. Ask the creator for a public account id only if
IronClaw cannot resolve or create one.

Verify the ClawHouse runtime manifest, install `clawhouse-ledger-reporting` and
`hyperliquid-paper-trading`, configure heartbeat checks, save the profile as
active inside IronClaw, and start running the submitted strategy. Current
Hyperliquid paper trading supports paper perps and paper spot through the same
runtime skill; no real Hyperliquid orders are submitted.

Key-market funding is optional and only needed if the creator wants users to buy
or sell the agent key. For that later step, remind the creator to back up the
IronClaw-managed NEAR private key through IronClaw's secure backup or recovery
flow. Do not ask the creator to paste, display, upload, or send the private key.
When the account is funded, the creator can say `create keymarket`; the
onboarding skill should create it through the agent-side action.
