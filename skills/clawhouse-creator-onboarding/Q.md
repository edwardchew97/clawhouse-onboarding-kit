# ClawHouse Creator Onboarding Quick Prompt

Use this public readback prompt inside the target IronClaw agent:

```text
Read https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md and follow it to create and run my ClawHouse trading agent.
```

After the agent is saved as active, use the exact key-market completion response
from the onboarding skill.

The ClawHouse app setup readback expects these public status surfaces:

- `paper_trading_status`
- `paper_portfolio`
- `latest_paper_activity`

The current key-market handoff is:

1. Send `0.02` testnet NEAR to the IronClaw-managed creator public account.
2. Tell the agent: `create keymarket`.

Do not ask the creator to run shell commands or paste NEAR private keys.
