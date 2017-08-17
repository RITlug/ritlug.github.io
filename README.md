# ritlug.github.io

[![CircleCI](https://circleci.com/gh/RITlug/ritlug.github.io.svg?style=svg&circle-token=b80b9ee3852aa0b52f578b434c6224971fc73d97)](https://circleci.com/gh/RITlug/ritlug.github.io)

> RITlug's current website.

### Table of Contents
* [Updating meeting times / places](#updating-meeting-times--places)
* [Javascript and CSS patches](#javascript-and-css-patches)
* [Development and Testing](#developing-and-testing)


## Updating meeting times / places

Edit `_config.yml` and update the settings "ritlug-time", "ritlug-place", and
"ritlug-day". These are used (and should be used) everywhere on the website
the meeting time and place are referenced so that they can be updated in
one place.


## Javascript and CSS patches

There's a couple of patches to the Javascript and CSS. They are:

### Header Height

The default header in Material Design Lite is too large on desktop so we've
shrank it. If you want to change the header height, do the following:

1. Open `css/styles.css`
2. Search for `.mdl-demo .mdl-layout__header-row {`.
3. Find and change the height. Default is 64px. We're currently using 25px.

### Make header links open pages

The default Javascript in MDL <1.0.6 expects the links at the top of the page
to open different tabs. This website is built with pages, not tabs. There&apos;s
a patch in the event handler that enables opening separate pages. Modern
versions of MDL do not require this as they already have the patch implemented.


## Developing and testing


### Setup

First, install Ruby:

```sh
sudo (apt-get install|pacman -S|...) ruby
```

Then, install bundler using gem.

```sh
sudo gem install bundler
```

Lastly, install dependencies with bundler.

```sh
bundle install
```

### Start the development server

This command serves the site at http://localhost:4000

```sh
jekyll serve
```

See [the runbook](https://github.com/RITlug/runbook/blob/master/the-website.md)
for more details.
