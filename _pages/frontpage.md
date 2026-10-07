---
permalink: /
layout: home
window: world
list_title: Latest news
---

<div class="hero" markdown="1">

# {{ site.description }}

Cuis is a **free Smalltalk-80 environment** with a specific set of goals: being **simple and powerful**.<br>It is also **portable to any platform**, fast and efficient.
{: .lead}

[Get started](/documentation/#get-started){: .button}

</div>

<figure>
<img src="./assets/imgs/home/ide.png" alt="The Cuis Smalltalk development environment">
<figcaption>A typical work-in-progress scene in Cuis Smalltalk
application development: An Inspector displays an object from the
running application, a message is sent to this object to show its
halo, and the auto-completion tool is active. Class browsers are open
on the application’s relevant classes; a Transcript provides feedback
on the application’s execution; under the application view, a
Workspace contains code related to the application.</figcaption>
</figure>

{% assign featured = site.data.quotes | where_exp: "quote", "quote.featured" | sort: "featured" %}
{% include quotes.html quotes=featured excerpts=true more=true band=true %}
