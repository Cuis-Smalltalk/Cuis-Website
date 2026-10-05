---
permalink: /community
layout: page
icon: users
window: transcript
title: Community
description: "Mailing list, monthly meetings and how to contribute."
---

Cuis has an active community of developers and users. Our main meeting point is the [mailing list](https://lists.cuis.st/mailman/listinfo/cuis-dev). You are welcome in our community! If you use Cuis or are curious about our work, subscribe to the mailing list to ask questions and tell us about your own projects and ideas. Please take a look at [Getting help with Cuis]({{ "/documentation/getting-help" | relative_url }}).

You can browse the [archives](https://lists.cuis.st/mailman/archives/cuis-dev/) for a glimpse of previous discussions. Before April 2019, we used cuis-dev@cuis-smalltalk.org: [zip with messages](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/blob/master/Documentation/MailList/cuis-dev_cuis-smalltalk.org.txt.zip). Before April 2016, we used cuis@jvuletich.org: [archives](http://jvuletich.org/mailman/listinfo/cuis_jvuletich.org).

Cuis is maintained on its [main GitHub repo](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev). All source code, the issue tracker and documentation are held there. The latest changes to Cuis Smalltalk can be browsed in the [Core updates commits](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/commits/master/CoreUpdates).

## Share your ideas

We especially value public discussion of ideas. Do you think we should be doing something in a different way? Git integration? Automatic discovery of remote git repositories? Source code format? Modularization? Any others?

Public discussion of ideas and public sharing of your experiments and sketches is the way to move forward. Your ideas will be enriched by others, and you'll find helping hands.

Keeping them to yourself for too long may mean they never mature. Sharing them privately only with project maintainers may not give the result you expect. We will pay more attention and give deeper consideration to public discussion than to private discussion. Why? Because public discussion will benefit the whole community and project, while private discussion will most likely only benefit you. So, please, don't be shy and help others by engaging in public discussion of ideas.

## Contributing to Cuis

For the recommended way of handling your own projects based on Cuis, please read [Code Management in Cuis]({{ "/documentation/managing-your-code" | relative_url }}), about developing packages for Cuis, and [Using Git and GitHub to host and manage Cuis code]({{ "/documentation/managing-your-code#using-git-and-github" | relative_url }}). While Cuis should work equally well with any file-based DVCS, we encourage the use of Git and GitHub.

To contribute code to the base image, use the tools included in Cuis, such as the ChangeSorter and the ChangeList to prepare ChangeSets and save them to file. Send the files as attachments to a message describing them to our mailing list, so we all can review and discuss. We prefer this over git pull requests for changes to the base image. For changes to existing packages, or contribution of new packages, pull requests are OK.

Please use an image with all relevant packages already loaded, using updated versions, especially of any affected packages. This will ensure we don't break them while we evolve Cuis.

For some ideas on how you can help Cuis, see [Helping Cuis](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/wiki/Helping-Cuis). You can contribute your own too.

Any contribution must be under the [MIT License](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/blob/master/LICENSE). By contributing, you agree to the [Developer Certificate of Origin](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/blob/master/DCO), a simple statement that you have the legal right to make the contribution.

## Monthly meetings

On the first Wednesday of each month, at 16:00 GMT ([convert here to your local time](https://timee.io/20240403T1600?tl=Cuis-Meeting&rf=m)), a member of the Cuis community chairs a 30 min virtual meeting on a selected topic. Join the meeting at [meeting.cuis.st](https://meeting.cuis.st).

## Past meetings

{% assign pastMeetings = site.data.past-meetings | sort: 'date' | reverse %}
{% include videos.html videos=pastMeetings %}
