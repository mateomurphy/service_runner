# ServiceRunner

Easily run services for rails apps

## Installation

Install it systemwide:

    $ gem install service_runner

## Usage

Not quite working properly in all cases, but in theory:

with Monit
 
    check process service_name
      with pidfile /path/to/app/tmp/pids/service_name.pid
      start program = "su - user -c 'cd /path/to/app/ && /path/to/service_runner start service_name'"
      stop program = "su - user -c 'cd /path/to/app/ && /path/to/service_runner stop service_name'"

Services currently supported are `delayed_job` and `sidekiq`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
