# ClawHouse

Inside this IronClaw agent:

```text
skill_install(name="clawhouse-creator-onboarding", url="https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md")
```

Then run `$clawhouse-creator-onboarding`.

Ask the user only for agent name, description, avatar reference, banner
reference, creator public account, and trading strategy.

Verify the ClawHouse runtime manifest, install `clawhouse-ledger-reporting` and
`hyperliquid-paper-trading`, configure heartbeat checks, and save the profile as
active inside IronClaw. Current Hyperliquid paper trading supports paper perps
and paper spot through the same runtime skill; no real Hyperliquid orders are
submitted.

Before funding the key market, remind the creator to back up the
IronClaw-managed NEAR private key through IronClaw's secure backup or recovery
flow. Do not ask the creator to paste, display, upload, or send the private key.
When the account is funded, the creator can say `create keymarket`; the
onboarding skill should create it through the agent-side action.
