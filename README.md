# PancakeSlicer on Railway

[PancakeSlicer](https://github.com/ZimengXiong/PancakeSlicer) (AGPL-3.0) — a self-hosted, browser-based non-planar 3D-printer slicer built on the OrcaSlicer engine: import STL/3MF, slice with curved non-planar top surfaces, preview G-code and download it. Deploy it on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/OZYDlK)

## What this template runs

- **pancakeslicer**: `ghcr.io/onepush-dev/pancakeslicer:0.5.0`, the official `ghcr.io/zimengxiong/pancakeslicer:0.5.0` image (unmodified) with Railway defaults baked in. Public HTTPS domain on port 8080, healthcheck `/api/healthz`, volume at `/data` (library, projects, profiles, preferences, jobs).

## Variables

| Variable | Value | Notes |
|---|---|---|
| `ORCA_WEB_BEARER_TOKEN` | generated secret | Access token required for every change (uploads, slicing, projects, settings). The web UI asks for it once. |

Baked into the image: `ORCA_WEB_LISTEN=0.0.0.0:8080`, `ORCA_WEB_PRINTER_NETWORK=off`, `ORCA_WEB_MAX_JOBS=2`, `PANCAKE_STAGE_CACHE_MAX_MB=1024`.

## How to use

1. Deploy and open the public domain.
2. When the UI asks for an access token, paste `ORCA_WEB_BEARER_TOKEN` (service → Variables).
3. Import a model, pick a printer/filament profile, slice, preview and download the G-code.

## Notes

- Slicing is CPU and RAM heavy (upstream suggests up to 8 GB); raise `ORCA_WEB_MAX_JOBS` only on a bigger plan.
- Sending prints to a LAN printer is off (`ORCA_WEB_PRINTER_NETWORK=off`) because a home printer is not reachable from Railway.
- Not affiliated with PancakeSlicer or OrcaSlicer.
