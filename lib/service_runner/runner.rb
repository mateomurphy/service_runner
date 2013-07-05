module ServiceRunner
  class Runner < Thor
    include Thor::Actions

    class_option :env, :type => :string, :aliases => '-e', :desc => "The Rails environment to use"
    class_option :log, :type => :string, :aliases => '-l', :desc => "The path to use for the log file"
    class_option :pid, :type => :string, :aliases => '-p', :desc => "The path to use for the pid file"
    class_option :test, :type => :boolean, :default => false, :aliases => '-t', :desc => "Operate in test mode"

    # Start
    desc "start SERVICE", "Start a given service"
    def start(service_name)
      puts "Starting #{service_name}"
      command Service.get(service_name).start(@options)
    end

    # Stop
    desc "stop SERVICE", "Stop a given service"
    def stop(service_name)
      puts "Stopping #{service_name}"
      command Service.get(service_name).stop(@options)
    end

    # Helpers
    no_tasks do
      def command(result)
        if test?
          puts result
        else
          run result
        end
      end

      def test?
        @options[:test]
      end
    end

  end
end