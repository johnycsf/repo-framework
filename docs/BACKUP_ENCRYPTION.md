# Backup encryption (age)

## What we use

| Layer | Tool | Purpose |
|-------|------|---------|
| Integrity | `SHA256SUMS` / `sha256sum` | Detect corruption (already in `backup.sh`) |
| Confidentiality | **age** | Encrypt offsite/DR exports (AEAD: X25519 + ChaCha20-Poly1305) |

**SHA256 is not encryption.** PGP/GPG works but is heavier for scripts; OpenSSL `enc` is avoided. **age** is the johnycsf standard for backup exports.

## Design

- Local `DEST/snapshots/TS/` stays **plaintext hardlink trees** so `--link-dest` incrementals and `./update.sh` rollbacks keep working.
- Optional **encrypted export**: `DEST/encrypted/<stack>-<TS>.tar.age` (streamed `tar | age`, no plaintext tar left behind).
- Restore accepts a normal snapshot root **or** a `.tar.age` / `.age` file.

## Usage

```bash
# Create snapshot + encrypted export (default: encrypt to ~/.config/johnycsf/backup.age.key)
./backup.sh --dest ./backups --encrypt

# Custom export location + explicit recipient
./backup.sh --dest ./backups --encrypt --export-dir /mnt/usb/encrypted --age-recipient age1...

# Restore from encrypted export
./backup.sh --restore --from /mnt/usb/encrypted/immich-docker-20260815-120000.tar.age
# optional: --age-identity ~/.config/johnycsf/backup.age.key
```

Env equivalents: `BACKUP_ENCRYPT=1`, `BACKUP_EXPORT_DIR`, `BACKUP_AGE_RECIPIENT`, `BACKUP_AGE_IDENTITY`, `BACKUP_AGE_PASSPHRASE_FILE` (0600 file).

## Snippet

Copy `snippets/backup-encrypt.sh` next to `backup.sh` and `source` it. Wire `--encrypt` flags and call `maybe_encrypt_after_seal` after `seal_snapshot`.
