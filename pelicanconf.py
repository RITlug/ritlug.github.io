#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

import os, sys
sys.path.append('htmlmin')
PLUGIN_PATHS = ['pelican-plugins', 'pelican-minify']
PLUGINS = ['assets', 'minify']
THEME = './theme'
PATH = 'content'
ASSET_SOURCE_PATHS = ['static']
SITEURL = 'http://localhost:8000'
FEED_DOMAIN = 'https://ritlug.github.io'

AUTHOR = 'Anonymous'
SITENAME = 'RIT Linux Users Group'

DISPLAY_PAGES_ON_MENU = True

DEFAULT_CATEGORY = 'announcements'

BIN = os.getcwd() + '/bin/'
ASSET_CONFIG = (
	('scss_bin',         BIN + 'scss'),
	('cleancss_bin',     BIN + 'cleancss'),
	('autoprefixer_bin', BIN + 'autoprefixer'),
	('cleancss_extra_args', ['--skip-rebase']),
)

SOCIAL = (
	('Mailing List', 'https://groups.google.com/d/forum/ritlug-announce'),
	('GitHub', 'https://github.com/RITlug'),
	('Reddit', 'https://www.reddit.com/r/RITlug'),
	('Twitter', 'https://twitter.com/RITlug'),
	('Facebook', 'https://www.facebook.com/groups/RITlug'),
	('IRC Channel', 'ircs://irc.freenode.net/ritlug'),
	('The Link @ RIT', 'https://thelink.rit.edu/organization/linux'),
)

DEFAULT_PAGINATION = 20
DEFAULT_ORPHANS = 5

PAGINATION_PATTERNS = (
	(1, '{base_name}/', '{base_name}/index.htm'),
	(2, '{base_name}/page/{number}/', '{base_name}/page/{number}/index.htm'),
)

RELATIVE_URLS = False

TIMEZONE = 'America/New_York'
LOCALE = 'en_US.utf8'
DEFAULT_LANG = 'en'
DEFAULT_DATE_FORMAT = '%d/%b/%Y (%a)'

YEAR_ARCHIVE_URL     = 'posts/{date:%Y}/'
YEAR_ARCHIVE_SAVE_AS = 'posts/{date:%Y}/index.htm'

MONTH_ARCHIVE_URL     = 'posts/{date:%Y}/{date:%b}/'
MONTH_ARCHIVE_SAVE_AS = 'posts/{date:%Y}/{date:%b}/index.htm'

ARTICLE_URL     = 'posts/{date:%Y}/{date:%b}/{slug}.htm'
ARTICLE_SAVE_AS = 'posts/{date:%Y}/{date:%b}/{slug}.htm'

DRAFT_URL     = 'drafts/{slug}.htm'
DRAFT_SAVE_AS = 'drafts/{slug}.htm'

PAGE_URL     = '{slug}.htm'
PAGE_SAVE_AS = '{slug}.htm'

CATEGORY_URL     = 'category/{slug}/'
CATEGORY_SAVE_AS = 'category/{slug}/index.htm'

TAG_URL     = 'tagged/{slug}/'
TAG_SAVE_AS = 'tagged/{slug}/index.htm'

AUTHOR_URL     = 'by/{slug}/'
AUTHOR_SAVE_AS = 'by/{slug}/index.htm'

ARCHIVES_SAVE_AS = 'archives.htm'
AUTHORS_SAVE_AS = 'authors.htm'
CATEGORIES_SAVE_AS = 'categories.htm'
TAGS_SAVE_AS = 'tags.htm'

# Feed generation is usually not desired when developing
FEED_ATOM = 'feeds/latest.xml'
FEED_ALL_ATOM = 'feeds/all.xml'
CATEGORY_FEED_ATOM = 'feeds/category/%s.xml'
TAG_FEED_ATOM = 'feeds/tagged/%s.xml'
AUTHOR_FEED_ATOM = 'feeds/by/%s.xml'
TRANSLATION_FEED_ATOM = None

FEED_RSS = None
FEED_ALL_RSS = None
CATEGORY_FEED_RSS = None
TAG_FEED_RSS = None
AUTHOR_FEED_RSS = None
TRANSLATION_FEED_RSS = None
