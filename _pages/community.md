---
permalink: /community
layout: page
title: Community
---

Cuis is maintained on its [Github Organization](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev). 

The main meeting point for Cuis users and developers is the [mailing list](https://lists.cuis.st/mailman/listinfo/cuis-dev). You can browse the archives for a glimpse of our discussions. Pre-April-2019 archives are found [here](http://cuis-smalltalk.org/pipermail/cuis-dev_cuis-smalltalk.org/) and [here](http://jvuletich.org/mailman/listinfo/cuis_jvuletich.org).

## Contributing to Cuis

For the recommended way of handling your own projects based on Cuis, please read [Code Management in Cuis](Documentation/CodeManagementInCuis.md), about developing packages for Cuis, and [Using Git and GitHub to host and manage Cuis code](Documentation/CuisAndGitHub.md). While Cuis should work equally well with any file-based DVCS, we encourage the use of Git and GitHub.

To contribute code to the base image, use the tools includede in Cuis, such as the ChangeSorter and the ChangeList to prepare ChangeSets and save them to file. Send the files as attachments to a message describing them to our mail list, so we all can review and discuss. We prefer this over git pull requests for changes to the base image. For changes to existing packages, or contribution of new packages, pull requests are OK.

Please use an image with all relevant packages already loaded, using updated versions, especially, of any affected packages. This will ensure we don't break them while we evolve Cuis.

Any contribution must be under the MIT license.


## Monthly meetings

Every first Wednesday of each month, at 16:00 GMT ([convert here to
your local
time](https://www.timeanddate.com/worldclock/converter.html?iso=20220205T160000&p1=tz_gmt)), a
member of the Cuis community chairs a 30 min virtual meeting on a
selected topic. Browse the incoming meetings list below, save the date in
your agenda and join the meeting at
[http://meeting.cuis-smalltalk.org](http://meeting.cuis-smalltalk.org).

Jump directly to <a href="#meetings-archive">the meetings archive</a>.

<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>

{% assign meetings = site.data.meetings | sort: 'date' %} 

<div id="meeting-list">
  <ul class="package-list">
    {% for meeting in meetings %}
    <li>
      <h4 class="meeting">{{ meeting.title }}</h4>
	<p><em>{{ meeting.description }}</em><br>
	{{ meeting.chair }}<br>
	{{ meeting.date }} (1st Wednesday of the month. 16:00 GMT)</p>
    </li>
    {% endfor %}
  </ul>
</div>

<script>

var options = {
    valueNames: [ 'title', 'description', 'chair', 'date'],
	pagination: true,
	page: 30
};

var meetingList = new List('meeting-list', options);

</script>


## Meetings archive

<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>

{% assign pastMeetings = site.data.pastMeetings | sort: 'date' | reverse %} 

<div id="pastMeeting-list">
  <ul class="package-list">
    {% for pastMeeting in pastMeetings %}
    <li>
      <h4 class="meeting"><a href="{{ pastMeeting.video }}">{{ pastMeeting.title }}</a></h4>
	<p><em>{{ pastMeeting.description }}</em><br>
	{{ pastMeeting.chair }}<br>
	{{ pastMeeting.date }}</p>
    </li>
    {% endfor %}
  </ul>
</div>

<script>