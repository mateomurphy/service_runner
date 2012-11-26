module ServiceRunner
  class Runner < Thor
    include Thor::Actions

    map '-e' => :env
    map '-p' => :pid
    map '-l' => :log
    map '-t' => :test

    class_option :pid, :type => :string
    class_option :test, :type => :boolean, :default => false

    # Start
    desc "start SERVICE", "Start a given service"
    method_option :env, :type => :string
    method_option :log, :type => :string

    def start(service)
      puts "Starting #{service}"
      command Sidekiq.new(options).start_command
    end

    # Stop
    desc "stop SERVICE", "Stop a given service"

    def stop(service)
      puts "Stopping #{service}"
      command Sidekiq.new(options).stop_command
    end

    # Helpers
    no_tasks do
      def command(string)
        if test?
          puts string
        else
          run string
        end
      end

      def test?
        @options[:test]
      end
    end

  end
end