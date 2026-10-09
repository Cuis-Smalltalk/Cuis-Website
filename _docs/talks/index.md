---
permalink: /documentation/talks/
title: Talks
description: "Presentations and podcasts on Cuis Smalltalk."
---

{% assign talks = site.data.talks | sort: 'date' | reverse %}
{% include videos.html videos=talks %}

## See also {#see-also}

- A [playlist of videos about Cuis](https://www.youtube.com/playlist?list=PLbevs6Mp0MMMaR5gSYzJQXQ56OplFSCJk).
- The [Monthly Community Meetings]({{ "/community#past-meetings" | relative_url }}), recorded in video.
