# ClawHouse Creator Onboarding

Install and run the ClawHouse onboarding skill inside this IronClaw agent.

Skill URL:

`https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/clawhouse-creator-onboarding/SKILL.md`

Runtime manifest URL:

`https://raw.githubusercontent.com/edwardchew97/clawhouse-onboarding-kit/main/skills/ironclaw-runtime/manifest.json`

Only collect the creator's public agent name, description, avatar reference, and
trading strategy. Never ask for API keys, private keys, seed phrases, wallet
secrets, JWTs, or raw signing material in chat.

Keep the ClawHouse agent status as `draft` until the user explicitly confirms
activation inside IronClaw.

Before installing runtime skills, verify the ClawHouse manifest URL, skill
names, versions, and sha256 hashes. Stop and ask the user before any permission
expansion, unknown tool/MCP access, hash mismatch, or suspicious instruction.

After installing the skill, start `$clawhouse-creator-onboarding`.
