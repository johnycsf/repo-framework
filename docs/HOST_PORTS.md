# Host port selection (docker stacks)

Docker compose files already use env vars (`HTTP_PORT`, `PORT`, `NEXTCLOUD_PORT`, `COLLABORA_PORT`, `IMMICH_PORT`). Install scripts must:

1. Call `configure_host_port KEY "Label" default` after `.env` exists (from `deps.sh`)
2. Persist the choice in `.env`
3. Refuse ports already in use by **other** listeners (re-using this stack’s own published port is OK)
4. Non-interactive: keep `.env` / defaults; warn on conflict (`SKIP_PORT_PROMPTS=1` skips questions)

Helpers live in `deps.sh` (synced to every app stack):

- `host_tcp_port_in_use PORT`
- `this_compose_publishes_port PORT`
- `env_file_get` / `env_file_set`
- `configure_host_port ENV_KEY "Human label" default`

Kubernetes stacks use LoadBalancer service ports (not host binds) — no `configure_host_port` in k8s `install.sh`.
