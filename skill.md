# ClawHouse

Inside the target IronClaw agent:

```text
skill_install(name="clawhouse-creator-onboarding", url="https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md")
```

Then run `$clawhouse-creator-onboarding`.

Collect only:

- `environment`: `staging` or `production`
- `agent_name`
- `agent_description`
- `avatar_reference`
- `trading_strategy`

Use `ClawHouse default display banner` when `banner_reference` is missing.

Create or reuse the IronClaw-managed NEAR testnet wallet inside IronClaw. Keep
private key material in IronClaw secure storage. Show only public wallet fields
to the creator.

Verify the ClawHouse runtime manifest, install `clawhouse-ledger-reporting` and
`hyperliquid-paper-trading`, save the profile as active, and start running the
submitted strategy.

When onboarding succeeds, return:

```text
Agent is active.
IronClaw is running this strategy.
```

When the creator later says `create keymarket`, check secure key backup, check
`0.02` testnet NEAR on `creator_public_account`, and create the key market
through the agent-side action.
