---
permalink: /packages
layout: page
icon: package
window: package-installer
title: Packages
description: "Libraries and tools for Cuis, built by the community."
---

<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>

{% assign packages = site.data.packages | concat: site.data.github | sort: 'name' %}

<div id="package-list">
  <input class="search" placeholder="Search package">
  <ul class="list">
    {% for package in packages %}
    <li>
      <h4 class="name"><a href="{{package.url}}">{{ package.name }}</a></h4>
      <p class="description">{{ package.description }}</p>{% if package.license %}<p>{{ package.license }}</p>{% endif %}
      {% if package.tags.size > 0 %}<p class="tags">{% for tag in package.tags %}<span class="tag">{{tag}}</span>{% endfor %}</p>{% endif %}
    </li>
    {% endfor %}
  </ul>
  <ul class="pagination"></ul>
  <a href="all_packages">Browse all</a>
</div>

<script>

var options = {
  valueNames: [ 'name', 'description', 'tags' ],
  pagination: true,
  page: 30
};

var packageList = new List('package-list', options);

</script>
