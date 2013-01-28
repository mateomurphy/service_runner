# ServiceRunner

Easily run services for rails apps

## Installation

Add this line to your application's Gemfile:

    gem 'service_runner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install service_runner

## Usage

with Monit

    check process service_name
      with pidfile /path/to/app/tmp/pids/service_name.pid
      start program = "su - user -c 'cd /path/to/app/ && thor services:start service_name'"
      stop program = "su - user -c 'cd /path/to/app/ && thor services:stop service_name'"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
