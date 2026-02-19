# CAPTCHA Operations Runbook

<link-summary>Operational playbook for analyzing, enabling, and rolling back CAPTCHA controls.</link-summary>
<card-summary>Runbook for support and operations teams during abuse spikes or false-positive reports.</card-summary>
<web-summary>Use this runbook to triage incidents tied to adaptive CAPTCHA decision rules.</web-summary>

<primary-label ref="audience-ops"/>
<secondary-label ref="security"/>
<secondary-label ref="stable"/>

## When to use this runbook
<secondary-label ref="impact"/>

Use this runbook when one of the following happens:

- Customer reports sudden increase in CAPTCHA prompts.
- Monitoring detects unusual request spikes.
- Security flags abuse from a specific source.
- Manual CAPTCHA override is requested.

## Quick triage checklist

1. Confirm which rule triggered the challenge.
2. Estimate customer impact (scope, duration, region).
3. Decide whether rule behavior is expected or a false positive.
4. Communicate status and next update time in the incident channel.

Use <shortcut key="$OpenSearch"/> to locate IP- or payload-related entries quickly and <shortcut key="$OpenFilters"/> to narrow time windows.

## Trigger-to-action matrix

| Trigger source | First action | Escalate when |
|---|---|---|
| IP burst threshold | Validate request pattern from the IP and check if traffic is automated | Affected traffic includes verified high-value customers |
| Blacklist match | Confirm blacklist source and recency | IP appears to be a known trusted partner |
| Hourly spike | Compare the current hour against same-hour historical baseline | Spike continues for more than 2 hourly buckets |
| Repeated payload | Check whether payload is legitimate automation or abuse | Payload belongs to a known integration use case |
| Manual override | Verify scope and expiry timestamp | Scope is broad and no end time is set |

## Investigation procedure
<secondary-label ref="security"/>

<procedure title="Handle a CAPTCHA spike" id="handle-captcha-spike">
    <step>
        <p>Open the last 30 minutes of rule-evaluation logs.</p>
        <code-block lang="json" src="../codeSnippets/logs/rule-evaluation-event.json"/>
    </step>
    <step>
        <p>Identify the top trigger reason and quantify affected requests.</p>
    </step>
    <step>
        <p>Confirm whether the behavior maps to expected abuse prevention.</p>
    </step>
    <step>
        <p>If needed, apply temporary manual override with a documented expiration.</p>
    </step>
    <step>
        <p>Copy the incident ID for status communication using <shortcut key="$CopyCaseId"/>.</p>
    </step>
</procedure>

<include from="lib.md" element-id="manual-override-warning"/>

## Cross-platform validation (macOS, Windows, Linux)
<secondary-label ref="internal"/>

Use the same Docker workflow on all platforms to validate documentation output before publishing.

<tabs>
    <tab title="macOS / Linux">
        <code-block lang="bash">docker compose up --build docs-preview</code-block>
    </tab>
    <tab title="Windows (PowerShell)">
        <code-block lang="powershell">docker compose up --build docs-preview</code-block>
    </tab>
</tabs>

Browser checks before release:

| Browser | Version policy | Required checks |
|---|---|---|
| Chrome | Latest stable | Mermaid rendering, search behavior, table layout |
| Edge | Latest stable | Navigation, redirects, keyboard shortcuts |
| Firefox | Latest stable | Code snippet formatting, labels, collapsible sections |
| Safari | Latest stable | Card layout, summary blocks, cross-page anchors |

## Communication template

```text
CAPTCHA status update
- Trigger: <rule>
- Scope: <traffic segment>
- User impact: <low/medium/high>
- Action taken: <action>
- Next update: <timestamp>
- Owner: <team/member>
```

<seealso>
    <category ref="security">
        <a href="CAPTCHA-Decisioning-Overview.md" summary="Rule definitions and intent."/>
    </category>
    <category ref="references">
        <a href="CAPTCHA-Glossary.md" summary="Term definitions used in incidents and reports."/>
    </category>
</seealso>
