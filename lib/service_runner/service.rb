module ServiceRunner
  class Service
    include Thor::Actions

    def root
      Dir.getwd
    end

    def initialize(options = {})
      @options = options
    end

    def bundle
      'bundle exec'
    end

    def env
      @options[:env] || 'production'
    end

    def log
      @options[:log] || "#{root}/log/#{name}.log"
    end

    def pid
      @options[:pid] || "#{root}/tmp/pids/#{name}.pid"
    end
  end

  class DelayedJob < Service
    def name
      'delayed_job'
    end

    def start_command
      "RAILS_ENV=#{env} script/delayed_job start >> #{log} 2>&1"
    end

    def stop_command
      "RAILS_ENV=#{env} script/delayed_job stop >> #{log} 2>&1"
    end

  end

  class Sidekiq < Service
    def name
      'sidekiq'
    end

    def start_command
      "nohup #{bundle} sidekiq -e #{env} -P #{pid} >> #{log} 2>&1 &"
    end

    def stop_command
      "#{bundle} sidekiqctl stop #{pid} 30 >> #{log} 2>&1"
    end
  end
end