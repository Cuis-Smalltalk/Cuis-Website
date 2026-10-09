---
permalink: /packages
layout: page
icon: package
window: installed-packages
title: Packages
description: "Libraries and tools for Cuis, built by the community."
---

<div id="package-list">
  <div class="package-filters">
    <input class="search" placeholder="Search package">
    <label class="filter"><input type="checkbox" class="featured-filter"><svg class="icon"><use href="{{ "/assets/icons.svg#sparkles" | relative_url }}"></use></svg>Featured</label>
    <label class="filter"><input type="checkbox" class="official-filter"><svg class="icon"><use href="{{ "/assets/icons.svg#badge-check" | relative_url }}"></use></svg>Official</label>
    <label class="filter"><input type="checkbox" class="name-sort"><svg class="icon"><use href="{{ "/assets/icons.svg#arrow-down-a-z" | relative_url }}"></use></svg>Name</label>
  </div>
  <ul class="list">
    {% for package in site.data.packages %}
    <li{% if package.featured %} class="world" data-featured{% endif %}{% if package.official %} data-official{% endif %}>
      {% assign source = package.sources.first %}
      <h4 class="name"><a href="{{ source.url }}">{{ package.name }}</a>{% if package.official %}<svg class="icon" role="img" aria-label="Official"><title>Official</title><use href="{{ "/assets/icons.svg#badge-check" | relative_url }}"></use></svg>{% endif %}</h4>
      {% if source.description %}<p class="description">{{ source.description }}</p>{% else %}<p class="no-description">No description provided</p>{% endif %}
      {% assign more = package.sources.size | minus: 1 %}
      {% assign dialog = "sources-" | append: forloop.index %}
      <div class="package-footer">
        <b><a class="owner" href="https://github.com/{{ source.owner }}">@{{ source.owner }}</a></b>
        {% if more > 0 %}<button class="more-sources" commandfor="{{ dialog }}" command="show-modal">{{ more }} more</button>{% endif %}
      </div>
      <p class="pushed"><svg class="icon"><use href="{{ "/assets/icons.svg#calendar" | relative_url }}"></use></svg>Last updated <time datetime="{{ package.pushed_at }}">{{ package.pushed_at | date: site.date_format }}</time></p>
      {% if more > 0 %}
      <dialog id="{{ dialog }}" class="sources" closedby="any" aria-labelledby="{{ dialog }}-title">
        <h4 id="{{ dialog }}-title" tabindex="-1" autofocus>{{ package.name }}<button commandfor="{{ dialog }}" command="close" aria-label="Close"><svg class="icon"><use href="{{ "/assets/icons.svg#x" | relative_url }}"></use></svg></button></h4>
        {% for source in package.sources %}
        <div class="source">
          <div class="repository"><b><a class="owner" href="https://github.com/{{ source.owner }}">@{{ source.owner }}</a>{% if source.official %}<svg class="icon official" role="img" aria-label="Official"><title>Official</title><use href="{{ "/assets/icons.svg#badge-check" | relative_url }}"></use></svg>{% endif %}</b><a href="{{ source.url }}">repo</a></div>
          {% if source.description %}<p class="description">{{ source.description }}</p>{% else %}<p class="no-description">No description provided</p>{% endif %}
          <p class="pushed"><svg class="icon"><use href="{{ "/assets/icons.svg#calendar" | relative_url }}"></use></svg>Last updated <time datetime="{{ source.pushed_at }}">{{ source.pushed_at | date: site.date_format }}</time></p>
        </div>
        {% endfor %}
      </dialog>
      {% endif %}
    </li>
    {% endfor %}
  </ul>
</div>

<script type="module" src="{{ "/assets/packages.js" | relative_url }}"></script>
