# ClawHouse

Inside this IronClaw agent:

```text
skill_install(name="clawhouse-creator-onboarding", url="https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md")
```

Then run `$clawhouse-creator-onboarding`.

Ask the user only for agent name, description, avatar reference, and trading
strategy. After setup, return only:

```text
Fund agent.
min: <minimum amount>
pay: <funding URL or payment address>
status: waiting_for_funds
```
