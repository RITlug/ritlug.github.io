# Contributing

## Site Source

_(Basic Git & Ruby configs excluded)_

* `_data/` - `.yml` files containing links on navbar tabs & in the footer
* `_includes/`
  * `content-blocks/` - reusable content blocks that can be inserted into a page with `{% include ... %}`
  * `layout/` - common template chunks
* `_layouts/` - page layouts. Which is used is defined in a given page's YAML frontmatter
* `announcements/`, `events/`, `projects/`, `talks/` - See "Adding Content" in `README.md`
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
