# Backup exports (compress + encrypt)

## What we use

| Layer | Tool | Purpose |
|-------|------|---------|
| Integrity | `SHA256SUMS` / `sha256sum` | Detect corruption (already in `backup.sh`) |
| Compression | **tar.gz**, **tar.xz**, **zip** | Smaller offsite/USB/NAS copies |
| Simple password | **zip -e** or **age -p** on tar streams | Casual / passphrase protection |
| Strong crypto | **age** recipients (`--encrypt`) | AEAD: X25519 + ChaCha20-Poly1305 |

**SHA256 is not encryption.** Local snapshot trees stay plaintext on purpose.

## Design

- Local `DEST/snapshots/TS/` stays **uncompressed hardlink trees** so `--link-dest` incrementals and `./update.sh` rollbacks keep working.
- Optional **compressed export**: `DEST/exports/<stack>-<TS>.{tar.gz,tar.xz,zip}` (or `*.tar.gz.age` / `*.tar.xz.age` when password-protecting tar).
- Optional **age export**: `DEST/encrypted/<stack>-<TS>.tar.age` (streamed `tar | age`).
- Restore accepts a snapshot root **or** any of those archive types.

### Password notes

| Format | `--archive-password` behavior | Strength |
|--------|-------------------------------|----------|
| `zip` | `zip -e` (ZipCrypto) | Casual — fine for a locked USB stick; not bank-grade |
| `tar.gz` / `tar.xz` | compress, then `age -p` | Strong passphrase AEAD |
| `--encrypt` | age recipient key (or `--passphrase`) | Strongest for scripted DR |

Prefer **age** (tar + password, or `--encrypt`) when the backup leaves your house. Use plain zip password only when convenience matters more than crypto strength.

## Usage

```bash
# Local hardlink snapshot only
./backup.sh --dest ./backups

# Compressed offsite copy
./backup.sh --dest ./backups --archive tar.gz
./backup.sh --dest ./backups --archive tar.xz --archive-password
./backup.sh --dest ./backups --archive zip --archive-password

# Advanced: age recipient / passphrase export
./backup.sh --dest ./backups --encrypt
./backup.sh --dest ./backups --encrypt --export-dir /mnt/usb/encrypted --age-recipient age1...

# Restore
./backup.sh --restore --from ./backups/exports/heimdall-docker-20260815-120000.tar.gz
./backup.sh --restore --from ./backups/exports/heimdall-docker-20260815-120000.zip
./backup.sh --restore --from ./backups/encrypted/heimdall-docker-20260815-120000.tar.age
```

Env equivalents: `BACKUP_ARCHIVE`, `BACKUP_ARCHIVE_PASSWORD=1`, `BACKUP_ENCRYPT=1`,
`BACKUP_EXPORT_DIR`, `BACKUP_AGE_RECIPIENT`, `BACKUP_AGE_IDENTITY`.

## Snippet

Copy `snippets/backup-encrypt.sh` next to `backup.sh` and `source` it. Wire `--archive` /
`--encrypt` flags and call `maybe_encrypt_after_seal` (alias for `maybe_export_after_seal`)
after `seal_snapshot`.
