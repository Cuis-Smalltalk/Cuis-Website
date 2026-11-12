---
permalink: /community/contributors
layout: doc
window: browser
title: Contributors
description: "Thank you to everyone who keeps Cuis growing."
---

<div id="contributors">
  <div class="period-filters">
    {% for period in site.data.contributors %}
    <label class="filter"><input type="radio" name="period" value="{{ period.months }}"{% if forloop.last %} checked{% endif %}>Last {{ period.months }} months</label>
    {% endfor %}
  </div>
  {% for period in site.data.contributors %}
  {% assign top = period.contributors.first.methods %}
  <table class="contributors" data-months="{{ period.months }}" aria-label="Last {{ period.months }} months">
    <thead>
      <tr>
        <th class="rank">#</th>
        <th class="name">Contributor</th>
        <th class="methods" colspan="2">Contributions</th>
      </tr>
    </thead>
    {% for contributor in period.contributors %}
    <tr>
      <td class="rank">{{ forloop.index }}</td>
      <td class="name">{{ contributor.name }}</td>
      <td class="share"><span style="--share: {{ contributor.methods | times: 100.0 | divided_by: top }}%"></span></td>
      <td class="methods">{{ contributor.methods }}</td>
    </tr>
    {% endfor %}
  </table>
  {% endfor %}
</div>

<p class="fine-print">Every method someone modifies in the Cuis base image counts as one contribution. The list is updated every day.</p>
