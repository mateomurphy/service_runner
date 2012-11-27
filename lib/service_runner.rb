require 'service_runner/version'
require 'service_runner/runner'
require 'service_runner/service'

module ServiceRunner
  Service.define('delayed_job') do |s|
    s.start_command = "RAILS_ENV=:env script/delayed_job start >> :log 2>&1"
    s.stop_command  = "RAILS_ENV=:env script/delayed_job stop >> :log 2>&1"
  end

  Service.define('sidekiq') do |s|
    s.start_command = "nohup :bundle sidekiq -e ':env' -P ':pid' >> :log 2>&1 &"
    s.stop_command  = ":bundle sidekiqctl stop ':pid' 30 >> :log 2>&1"
  end
end
