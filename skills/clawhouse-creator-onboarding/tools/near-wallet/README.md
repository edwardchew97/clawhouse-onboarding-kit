# ClawHouse NEAR Wallet Tool

Local-dev NEAR implicit wallet generator for ClawHouse creator onboarding.

This tool:

- generates an ed25519 NEAR key pair with `@near-js/crypto`;
- derives the NEAR implicit account address from the public key;
- writes private key material only to the local file path you provide;
- prints only public metadata: `walletAddress`, `publicKey`, `keyId`, `keyFile`;
- refuses to overwrite an existing key file unless `--overwrite` is passed.

This is not a production custody system and does not claim TEE/vault signing.
Use it only for local development and onboarding tests until the production
signer/vault path is separately implemented.

## Install

```bash
git clone https://github.com/edwardchew97/clawhouse-near-wallet-tool.git
cd clawhouse-near-wallet-tool
bun install
```

## Test

```bash
bun run typecheck
bun run test
```

## Generate A Wallet

```bash
bun run generate -- --out /tmp/clawhouse-test-wallet.json
```

Expected output shape:

```json
{
  "walletAddress": "64-char-implicit-account-address",
  "publicKey": "ed25519:...",
  "keyId": "near-ed25519:64-char-implicit-account-address",
  "keyFile": "/tmp/clawhouse-test-wallet.json"
}
```

The output must not include `private_key`, `privateKey`, seed phrase, mnemonic,
or raw secret key material.

## Inspect Public Metadata

```bash
bun run inspect -- --key-file /tmp/clawhouse-test-wallet.json
```

## Overwrite Guard

Running generate again against the same file fails:

```bash
bun run generate -- --out /tmp/clawhouse-test-wallet.json
```

Use `--overwrite` only when you intentionally want a new key:

```bash
bun run generate -- --out /tmp/clawhouse-test-wallet.json --overwrite
```
