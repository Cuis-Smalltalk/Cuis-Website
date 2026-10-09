---
permalink: /
layout: home
window: world
list_title: Latest news
screenshots:
  - image: ide.png
    alt: "The Cuis Smalltalk development environment"
    caption: "A typical work-in-progress scene in Cuis Smalltalk application development: An Inspector displays an object from the running application, a message is sent to this object to show its halo, and the auto-completion tool is active. Class browsers are open on the application’s relevant classes; a Transcript provides feedback on the application’s execution; under the application view, a Workspace contains code related to the application."
  - image: vector-graphics.webp
    alt: "Vector graphics in Cuis Smalltalk"
    caption: "A showcase of Cuis Smalltalk’s support for vector graphics, SVG, TrueType fonts and Unicode."
---

<div class="hero" markdown="1">

# {{ site.description }}

Cuis is a **free Smalltalk-80 environment** with a specific set of goals: being **simple and powerful**.<br>It is also **portable to any platform**, fast and efficient.
{: .lead}

[Get started]({{ "/documentation/#get-started" | relative_url }}){: .button}

</div>

{% include screenshots.html screenshots=page.screenshots %}

{% assign featured = site.data.quotes | where_exp: "quote", "quote.featured" | sort: "featured" %}
{% include quotes.html quotes=featured excerpts=true more=true band=true %}
