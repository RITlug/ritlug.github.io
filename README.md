# ritlug.github.io

> RITlug's current website.

## Table of Contents
* [About](#about)
* [Adding Content & Contributing](#adding-content--contributing)
  * [Git Workflow](#git-workflow)
  * [Jekyll & Frontmatter](#jekyll--frontmatter)
  * [Announcements](#announcements)
  * [Talks](#talks)
  * [Events](#events)
  * [Projects](#projects)
  * [Calendar & Placeholders](#calendar--placeholders)
* [Updating meeting times / places](#updating-meeting-times--places)

## About

The website's last major update was Summer 2018, but content dates back to 2015.

* The site is built using [Jekyll](https://jekyllrb.com/), [Bootstrap](https://getbootstrap.com/) (via CDN), [Font Awesome](https://fontawesome.com/) (via CDN), & [GitHub Pages](https://help.github.com/categories/github-pages-basics/)
* [PDF.js](https://mozilla.github.io/pdf.js/) is used for embedding PDFs in pages (via CDN)
* "Pretty links" is turned on in the Jekyll configuration
* The `github-pages` Gem is used to simplify dependencies
* The live site is updated by committing changes to the `master` branch
_The site uses an undocumented feature of Jekyll where categories are defined using `category/_posts/` instead of `_posts/category/`._

Please see [CONTRIBUTING.md](https://github.com/RITlug/ritlug.github.io/tree/master/CONTRIBUTING.md) for more info on the technical specifics of the site.

## Adding Content & Contributing

Add a new `.md` file to one of the `_posts/` folders for a category.
Assets should be stored in a folder within that category, for example, `talks/slides/` or `projects/assets/`.
Asset file names should have enough info in the file name to know what references it (such as the associated talk date for slides) or be in a subfolder for things with a lot of assets (such as the TigerOS project).

Current categories:
* Announcements (`announcements/`)
* Events (`events/`)
* Meetings & Meetups (`meetings-meetups/`; see [Calendar & Placeholders](#calendar--placeholders))
* Projects (`projects/`)
* Talks (`talks/`)

### Git Workflow

(This is the short version; if you need help using git please ask us, we'll be glad to help)

* Fork the repository to your own Github account (go to the RITlug repository and click "fork")
* Clone the repository locally (if desired - you can also create it online)
* Create and/or add files
* Git commit
* Git push to your repository
* Open a pull request against the master branch (which is default) of the RITlug copy of the repository
* When your pull is merged, the site will update within a couple minutes

### Jekyll & Frontmatter

Jekyll is what builds the site.
It handles rendering of Markdown and templating.
_Jekyll requires that all post pages start with a valid date in the syntax `YYYY-MM-DD-(title).md`_.

Jekyll uses something called Frontmatter to know more information about the page.
Frontmatter defines what the page looks like and metadata such as the title, author, and event details (where applicable).

Frontmatter should be at the top of a post and should be encased in triple-dashes (`---`).
_All times are of the timezone `America_New_York`._

Additionally, Jekyll uses the string `<!--more-->` to define where the summary of pages end.
This is used when showing post previews on the site.
Optionally, the `excerpt` frontmatter can be defined instead to override this (if using an HTML page instead of Markdown in special cases, the `except` frontmatter _should be used_ instead of `<!--more-->`).
Please use this functionality to keep lists of posts readable.

For example,
```
---
title: Example thing
layout: post
---
Hello RITlug!

This week...

<!--more-->

Other things happening.

- Signature
```

If defined, the `date-start` and `date-end` frontmatter will replace the date specified in the file name in the iCal feed (where applicable).

More detail on frontmatter below...

### Announcements

Announcements are used to spread the word about what's happening.
Posts in this category are added to an RSS Feed (at https://ritlug.com/feeds/latest.xml), which get forwarded to the IRC/Slack and Google Group.
Additionally, if the page `layout` is `post-event`, the Calendar iCal feed with get the post added to it.

* Create a new Markdown file in `announcements/\_posts/` named with the convention `YYYY-MM-DD-wNN-your-title.md` (such as `2019-12-06-w13-final-meeting.md`)

Announcing an event (such as the weekly meeting):
```
---
author: Jeffery Russell (@jrtechs)
title: "Final Meeting"
layout: post-event
date-start: "2019-12-06 16:30"
date-end: "2019-12-06 18:00"
location: "GOL-2620 (Med. DB Lab)"
---
```

General Announcement:
```
---
title: title of your announcement
author: your name
layout: post
---
```

### Talks

Talks is for slides and notes about what was presented at a meeting.
Posts in this category work similarly to announcements, including that they get added to an RSS Feed (at https://ritlug.com/feeds/talks.xml), forwarded to IRC/Slack, and get added to the Calendar iCal (they do not get forwarded to the Google Group though).

* Create a Markdown file in `talks/\_posts/` named with the convention `YYYY-MM-DD-wNN-your-title.md` (such as `2019-03-07-w8-zfs.md`)
* There is an extra line in the frontmatter called `slides` which automatically provides an embed & link for slides
  * This property is the filename of the talk slides
  * Slides should be placed in `talks/slides/`
  * File names should be prefixed with year and semester (such as `2015-fall-contributing-to-github-projects.pdf`)
  * Slides should be exported as PDF and added committed to git

Example frontmatter:
```
---
title: ZFS
author: Josh Bicking (@jibby0)
layout: post
slides: 2019-spring-w08-zfs.pdf
---
```

### Events

Events are written after the event (to highlight what happened at the event).
Events _are_ added to the Calendar iCal, but are not added to an RSS Feed, auto-posted in IRC/Slack, nor forwarded to the Google Group.

* Create a Markdown file in `events/\_posts/` named with the convention `YYYY-MM-DD-wNN-your-title.md` (such as `2018-08-08-tim-flock.md`)

Events & Projects pages tend to use image gallery functionality.
This can be done using the `images` frontmatter with an array of photos and including the `gallery`.
The `images` parameter takes relative links to the RITlug site or absolute links for images hosted on other sites.

Example event page:
```
---
layout: event
title: President Tim Zabel at Fedora Flock 2018
authors:
- Tim Zabel (@Tjzabel)
excerpt: RITlug President Tim Zabel presents on TigerOS & Remixes at Fedora Flock 2018 in Dresden.
images:
- /events/assets/2018/08/tjzabel-flock.jpg
---
RITlug President Tim Zabel presents on TigerOS & Remixes at Fedora Flock 2018 in Dresden.

{% include content-blocks/gallery.html %}

> (talk abstract)

(link to talk page on conference site)
```

### Projects

Projects are about the things the club works on.
They are not added to an RSS Feed, auto-posted in IRC/Slack, added to the Calendar iCal, nor forwarded to the Google Group.

* Create a Markdown file in `events/\_posts/` named with the convention `YYYY-MM-DD-wNN-your-title.md` (such as `2018-08-08-tim-flock.md`)
  * The date is because of a Jekyll requirement we need to list projects; it should be updated at least once a semester or notable update

Like events, projects tend to use the image gallery.

Many projects pages tend to use custom HTML (incline or entirely) to have a better show-off effect.
If using custom HTML, the `excerpt` frontmatter should be set.
If doing the page entirely in custom HTML, the `layout` should be set to `default`, which will include the RITlug navbar & footer, but not add the white page background.

The `author`/`authors` frontmatter should be defined.
Additionally, the `permalink` property is commonly used to give a more special URL.

```
---
layout: project
title: Name
authors:
- ...
permalink: /projects/name
excerpt: Cool thing we do
images:
- /...
---
(Content)

{% include content-blocks/gallery.html %}
```

### Calendar & Placeholders

Jekyll generates an iCal calendar feed of event announcements, talks, and events (see also relevant sections above).
This feed is generated at https://ritlug.com/feeds/calendar.ics

Here's the logic for common, notable event properties:
* Titles come from the `title` frontmatter
* Descriptions come from the page body; uses summaries if defined with `<!--more-->` (or `excerpt` frontmatter)
* Dates:
  * If specified, `date-start` and `date-end` will allow manual specification of event date and time
    * This is useful when the announcement of an event is not the same day as the event itself
    * Also, this allows specifying times in addition to the date
  * Otherwise, the date given in the file name will be used
* Locations can be (optionally) specified with the `location` frontmatter
* URLs:
  * If redirect, gives link directly
  * If for post, gives post link
  * Otherwise, gives the "Get Involved" page

Note: Titles get automatically prepended with "RITlug: " because an opinionated developer of the site found it was easier to read in their calendar.
This is stripped on the "Calendar" page of the site.

#### Placeholder Events

Sometimes you want to add an event to the calendar but the details haven't been decided yet.
For example, all the weekly meetings of the semester have a set time and date but the topics and presenters may not be worked out yet.
Well, there's a solution for this!

* Create a Markdown in the `meetings-meetups/_posts/` folder named with the convention `YYYY-MM-DD-your-title.md` (such as `2020-04-25-imaginerit.md`)

Additionally, calendar placeholders are highly encouraged to use the `redirect` layout & frontmatter to specify a link for the event.

For example:
```
---
layout: redirect
redirect: https://ritlug.com/get-involved
date-start: "2020-04-25 16:30"
date-end: "2020-04-25 18:00"
location: "TBD"
title: "ImagineRIT"
---
Help or visit RITlug at ImagineRIT!

Stay tuned for more info closer to the event.
```

Placeholders can also take an `rrule` frontmatter for recurring events, written to the iCal spec.

For example:
```
---
layout: redirect
redirect: https://fossrit.github.io/
date-start: "2020-01-16 17:00"
date-end: "2020-01-16 19:00"
location: "MSS-3190"
title: "FOSS Hours"
rrule: "FREQ=WEEKLY;UNTIL=20200423T190000"
---
Not a RITlug event, but one we think is worthwhile to share and you'll likely see some of us there
```

## Updating meeting times / places

Edit `_config.yml` and update the settings "ritlug-time", "ritlug-place", and
"ritlug-day".
These are used (and should be used) everywhere on the website
the meeting time and place are referenced so that they can be updated in
one place.
Please note that this does NOT update events in the iCal feed.