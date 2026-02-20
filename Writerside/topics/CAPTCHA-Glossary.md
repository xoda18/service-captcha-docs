# CAPTCHA Glossary

<link-summary>Definitions of terms used in the CAPTCHA article and runbook.</link-summary>
<card-summary>Quick-reference glossary for non-developer specialists.</card-summary>
<web-summary>Shared vocabulary for incident handling, reporting, and stakeholder communication.</web-summary>

<primary-label ref="audience-nondev"/>
<secondary-label ref="stable"/>

## Core terms
<secondary-label ref="impact"/>

| Term | Definition |
|---|---|
| CAPTCHA challenge | A user verification step shown when request risk is above policy threshold. |
| Rule trigger | The condition that causes a CAPTCHA challenge to be required. |
| Hour bucket | Aggregated request volume for the current one-hour period. |
| Baseline | Historical average used for anomaly comparison. In this doc set, the baseline period is `%traffic_baseline_period_days%` days. |
| Repeated payload | Identical request body sent many times within a short time window. |
| Blacklist | A maintained list of IP addresses with known abuse history. |
| Manual override | Admin action that forces CAPTCHA for selected traffic regardless of automatic rule outcomes. |
| False positive | Legitimate traffic incorrectly challenged as suspicious. |
| Retention impact | Negative effect on users completing their intended flow after seeing a challenge. |

## Rule constants

| Variable | Value |
|---|---|
| `%ip_request_limit%` | Maximum requests per IP within `%ip_time_window_minutes%` minutes before rule triggers |
| `%payload_repeat_limit%` | Maximum same-payload repeats in `%payload_time_window_seconds%` seconds before rule triggers |
| `%traffic_spike_multiplier%` | Multiplier over historical baseline that triggers hourly spike protection |

<seealso>
    <category ref="operations">
        <a href="CAPTCHA-Operations-Runbook.md" summary="Operational workflows that use these terms."/>
    </category>
    <category ref="security">
        <a href="CAPTCHA-Decisioning-Overview.md" summary="Rule logic referenced by glossary entries."/>
    </category>
</seealso>
