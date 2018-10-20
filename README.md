# ritlug.github.io

[![CircleCI](https://circleci.com/gh/RITlug/ritlug.github.io.svg?style=svg&circle-token=b80b9ee3852aa0b52f578b434c6224971fc73d97)](https://circleci.com/gh/RITlug/ritlug.github.io)
[![Code Climate](https://codeclimate.com/github/RITlug/ritlug.github.io/badges/gpa.svg)](https://codeclimate.com/github/RITlug/ritlug.github.io)
[![Issue Count](https://codeclimate.com/github/RITlug/ritlug.github.io/badges/issue_count.svg)](https://codeclimate.com/github/RITlug/ritlug.github.io)

> RITlug's current website.

### Table of Contents
* [Updating meeting times / places](#updating-meeting-times--places)
* [Patches](#patches)
* [Development and Testing](#developing-and-testing)


## Updating meeting times / places

Edit `_config.yml` and update the settings "ritlug-time", "ritlug-place", and
"ritlug-day". These are used (and should be used) everywhere on the website
the meeting time and place are referenced so that they can be updated in
one place.


## Patches

### Header Height

The default header in Material Design Lite is too large on desktop so we've
shrunk it. If you want to change the header height, do the following:

1. Open `css/styles.css`
2. Search for `.mdl-demo .mdl-layout__header-row {`.
3. Find and change the height. Default is 64px. We're currently using 25px.


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

This command serves the site at http://localhost:4000.

```sh
bundle exec jekyll serve
```

### Run tests

This command runs [RSpec](http://rspec.info/) to test the site.

```sh
bundle exec rspec
```

See [the runbook](http://runbook.ritlug.com/infrastructure/website/)
for more details.
