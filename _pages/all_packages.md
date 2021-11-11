---
permalink: /all_packages
layout: page
title: Packages
---

{% assign packages = site.data.packages | concat: site.data.github | sort: 'name' %} 

<div id="package-list">
	<ul class="list">
		{% for package in packages %}
		<li>
			<h4 class="name"><a href="{{package.url}}">{{ package.name }}</a></h4>
			<p class="description">{{ package.description }}</p><p>{{package.license}}</p>
			<div class="tags">{% for tag in package.tags %}<span class="tag">{{tag}}</span>{% endfor %}</div>
		</li>
		{% endfor %}
	</ul>
</div>
