module Pigeon
  class Process
    def self.start
      Pigeon::PubSub.instance.configure!

      loop do
        puts "Working..."
        sleep 1
      end
    rescue SystemExit, Interrupt => e
      puts "Recieved exit command"
      raise e
    ensure
      puts "Pigeon cleaning up..."
      puts "\n"
      Pigeon::PubSub.instance.destroy!
    end
  end
end
