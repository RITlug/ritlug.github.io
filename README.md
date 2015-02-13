RITlug Website
==============

The source code to the website for the RIT Linux Users Group.
Suggestions and pull requests are welcome!

The code for this website and the content for all static pages are
licensed under the
[CC0 1.0 Universal License](https://creativecommons.org/publicdomain/zero/1.0/).
All posts to the website, however, are still the copyright of the people
who wrote them unless otherwise stated.

Usage
-----

At minimum, you need to have developer versions of Ruby, Ruby bundler, Node.js,
and Python 3 installed before you can build the website. Then, run `make help`
for usage.

Depending on your operating system, you may have to install the development
version of Python 3 so that the C extensions for some of the Python
dependencies can compile. If a package for Ruby bundler doesn't exist, you'll
have to build yourself one or run `sudo gem install bundler` if you don't care.

Please ensure that you know what you're doing before running `make github`.
