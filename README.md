# ritlug.github.io

[![CircleCI](https://circleci.com/gh/RITlug/ritlug.github.io.svg?style=svg&circle-token=b80b9ee3852aa0b52f578b434c6224971fc73d97)](https://circleci.com/gh/RITlug/ritlug.github.io)
[![Code Climate](https://codeclimate.com/github/RITlug/ritlug.github.io/badges/gpa.svg)](https://codeclimate.com/github/RITlug/ritlug.github.io)
[![Issue Count](https://codeclimate.com/github/RITlug/ritlug.github.io/badges/issue_count.svg)](https://codeclimate.com/github/RITlug/ritlug.github.io)

> RITlug's current website.

## Table of Contents
* [About](#about)
* [Adding Content](#adding-content)
* [Updating meeting times / places](#updating-meeting-times--places)
* [Site Source](#site-source)
* [Patches](#patches)
* [Development and Testing](#developing-and-testing)

## About

The website's last major update was Summer 2018, but content dates back to 2015.

The site is built using [Jekyll](https://jekyllrb.com/), [Bootstrap](https://getbootstrap.com/) (via CDN), [Font Awesome](https://fontawesome.com/) (via CDN), & [GitHub Pages](https://help.github.com/categories/github-pages-basics/).
[PDF.js](https://mozilla.github.io/pdf.js/) is used for embedding PDFs in pages (via CDN).
"Pretty links" is turned on in the Jekyll configuration.
The `github-pages` Gem is used to simplify dependencies.
The live site is updated by committing changes to the `master` branch.
_The site uses an undocumented feature of Jekyll where categories are defined using `category/_posts/` instead of `_posts/category/`._

## Adding Content

Add a new `.md` file to one of the `_posts/` folders for a category.
Assets should be stored in a folder within that category, for example, `talks/slides/` or `projects/assets/`.
Asset file names should have enough info in the file name to know what references it (such as the associated talk date for slides) or be in a subfolder for things with a lot of assets (such as the TigerOS project).

Current categories:
* ~Announcements (`announcements/`)~ (deprecated)
* Events (`events/`)
* Meetings & Meetups (`meetings-meetups/`) (note that these pages aren't linked from anywhere other than feeds, they are more for the metadata)
* Projects (`projects/`)
* Talks (`talks/`)

Please see [this runbook page](http://runbook.ritlug.com/infrastructure/website/) for more info.

## Updating meeting times / places

Edit `_config.yml` and update the settings "ritlug-time", "ritlug-place", and
"ritlug-day".
These are used (and should be used) everywhere on the website
the meeting time and place are referenced so that they can be updated in
one place.
Please note that this does NOT update events in the iCal feed.

## Site Source

_(Basic Git & Ruby configs excluded)_

* `_data/` - `.yml` files containing links on navbar tabs & in the footer
* `_includes/`
  * `content-blocks/` - reusable content blocks that can be inserted into a page with `{% include ... %}`
  * `layout/` - common template chunks
* `_layouts/` - page layouts. Which is used is defined in a given page's YAML frontmatter
* `announcements/`, `events/`, `projects/`, `talks/` - See [Adding Content](#adding-content)
* `css/styles.css` - Custom CSS
* `feeds/` - iCal & Atom/RSS feeds
* `img/` - images used across the entire site
* `spec/` - code tests
* `CNAME` - custom domain for GitHub Pages
* `_config.yml` - Jekyll configuration
* `about.md` - About page
* `get-involved.md` - Getting Involved page
* `index.html` - Home page

## Patches

### CSS

Some changes can be found in `css/styles.css`.

This includes:
* Some margin/padding tweaks
* RIT Orange
* Use Roboto font for body & Overpass for headings (via Google Fonts CDN)
* Footer tweaks
  * Sticky footer (if page is less than the screen height, keep it at the bottom)
  * Style lists to appear without bullets


## Developing and testing

### Local Install

Please see the [Jekyll Installation Docs](https://jekyllrb.com/docs/installation/).

The server can be started with:

```sh
bundle exec jekyll serve
```

Which will serve the site at: http://localhost:4000

**IF YOU HAVE ERRORS, PLEASE CHECK THAT YOU INSTALLED ALL REQUIRED DEPENDENCIES.**

### Docker

Jekyll can be run using [these Docker containers](https://github.com/envygeeks/jekyll-docker/blob/master/README.md).

Some members' preferred command is:

```sh
JEKYLL_VERSION=3.8

docker run --rm \
    -p 4000:4000 \
    -v "$PWD:/srv/jekyll:Z" \
    -it jekyll/jekyll:$JEKYLL_VERSION \
sh -c "jekyll serve --watch"
```

### Run tests

This command runs [RSpec](http://rspec.info/) to test the site.

```sh
bundle exec rspec
```

See [the runbook](http://runbook.ritlug.com/infrastructure/website/)
for more details.
