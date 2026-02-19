---
is-library: true
title: Shared snippet library
---

<snippet id="captcha-thresholds-snippet">

<note>
<p><b>Current decision thresholds</b></p>
<p>IP burst: more than %ip_request_limit% requests in %ip_time_window_minutes% minutes.</p>
<p>Repeated payload: more than %payload_repeat_limit% repeats in %payload_time_window_seconds% seconds.</p>
<p>Traffic anomaly: more than %traffic_spike_multiplier%x the average hourly traffic of the last %traffic_baseline_period_days% days.</p>
</note>

</snippet>

<snippet id="manual-override-warning">

<warning>
<p>Manual CAPTCHA override should be temporary. Record the reason, scope, and expected end time in the incident ticket.</p>
</warning>

</snippet>

<snippet id="placeholder-assets">

<tip>
<p>Placeholder assets to add later:</p>
<p>1) Admin panel screenshot for CAPTCHA toggle.</p>
<p>2) Dashboard screenshot for hourly traffic bucket.</p>
<p>3) Example customer-facing challenge screen.</p>
</tip>

</snippet>
