---
permalink: /news
layout: page
title: News
---


<ul>
  {% for post in site.posts %}
    <li>
      <a href=".{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

<iframe id="mailing-list-archive"
    title="Mailing list archive"
    width="100%"
    height="1000"
	style="border-width:0;"
    src="https://lists.cuis.st/mailman/archives/cuis-dev/">
</iframe>

