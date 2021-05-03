# Dependencies

* You will require a copy of the Freedesktop.org shared-mime-info database to be available. If you're on Linux, it's probably available via your package manager, and will probably be in the location it's being looked for when the gem is installed.
macOS users can install the database via Homebrew with `brew install shared-mime-info`.

* Ruby => 2.6

* ...or docker

# How to use
## Option one - local machine

1. `gem build gig.gemspec`
1. `gem install --local gig-0.0.1.gem`
1. `gig topic:ruby topic:rails`
1. `ls topic-ruby_topic-rails`

## Option two - docker

1. `docker build . -t gig`
1. `docker run -it gig`
1. `gig topic:ruby topic:rails`
1. `ls topic-ruby_topic-rails`
