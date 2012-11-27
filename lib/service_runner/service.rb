module ServiceRunner
  class Service
    attr_accessor :name, :start_command, :stop_command

    def default_options
      {
        'bundle' => 'bundle exec',
        'env' => 'production',
        'log' => "#{root}/log/#{name}.log",
        'pid' => "#{root}/tmp/pids/#{name}.pid"
      }
    end

    def initialize(name)
      @name = name
    end

    def interpolate(command, options)
      interpolations = default_options.merge(options)

      interpolations.inject(command) do |command_string, (key, value)|
        command_string.gsub(/:\{?#{key}\}?/) { value }
      end
    end

    def start(options = {})
      interpolate(start_command, options)
    end

    def stop(options = {})
      interpolate(stop_command, options)
    end

    def root
      Dir.getwd
    end

    class << self
      def define(name)
        service = new(name)
        yield service

        @services ||= {}
        @services[name] = service
      end

      def get(name)
        @services[name]
      end
    end

  end
end