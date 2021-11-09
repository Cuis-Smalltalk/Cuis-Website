---
permalink: /packages
layout: page
title: Packages
---

<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>

{% assign packages = site.data.packages | concat: site.data.github | sort: 'name' %} 

<div id="package-list">
	<input class="search" placeholder="Search package" 
		style="margin-left: 30px; margin-bottom: 20px;"/>
	<ul class="list">
		{% for package in packages %}
		<li>
			<h4 class="name"><a href="{{package.url}}">{{ package.name }}</a></h4>
			<p class="description">{{ package.description }}</p><p>{{package.license}}</p>
			<div class="tags">{% for tag in package.tags %}<span class="tag">{{tag}}</span>{% endfor %}</div>
		</li>
		{% endfor %}
	</ul>
	<ul class="pagination"></ul>
</div>

<script>

var options = {
    valueNames: [ 'name', 'description', 'tags' ],
	pagination: true,
	page: 10
};

var packageList = new List('package-list', options);

</script>
