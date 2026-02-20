# CAPTCHA Documentation (Writerside)

This repository contains a small Writerside documentation set that explains **when and why CAPTCHA is shown** in our service.  
Target audience: **non-developer tech specialists** (Support, Ops, Product).

## What’s inside
- **CAPTCHA Decisioning Overview** — rules that trigger CAPTCHA, priority, customer impact, and investigation checklist.
- **Operations & Troubleshooting** — quick triage flow, “reason → action” guidance, manual override guardrails, escalation checklist.
- **Glossary** — key terms used across the docs.

## Run locally (preview)
Requirements: **Docker** + **Docker Compose**.

```bash
docker compose up --build docs-preview
