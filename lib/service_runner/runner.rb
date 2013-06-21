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

    def start(service_name)
      puts "Starting #{service_name}"
      command Service.get(service_name).start(@options)
    end

    # Stop
    desc "stop SERVICE", "Stop a given service"
    method_option :env, :type => :string
    method_option :log, :type => :string
        
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