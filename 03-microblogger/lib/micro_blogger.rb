require "jumpstart_auth"

class MicroBlogger

  # authorize in irb
  # load "./lib/micro_blogger.rb"
  # MicroBlogger.new
  # enter pin
  def client
    @client ||= JumpstartAuth.twitter
  end

  def tweet msg
    if msg.length <= 140
      client.update(msg)
    end
  end

  def run
    puts "Welcome to your Twitter client"
    command = ""
    while command != "q"
      printf "Cmd> "
      command = gets.chomp
      process_command command
    end
  end

  def process_command input
    command, rest = input.split(" ", 2)
    case command
      when "tweet" then tweet rest
    end
  end

end