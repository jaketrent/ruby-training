require "jumpstart_auth"

class MicroBlogger

  # authorize in irb
  # load "./lib/micro_blogger.rb"
  # MicroBlogger.new
  # enter pin
  def client
    @client ||= JumpstartAuth.twitter
  end

  def valid_tweet_length? msg
    msg.length <= 140
  end

  def tweet msg
    client.update(msg) if valid_tweet_length? msg
  end

  def dm username, msg
    client.update("d #{username} #{msg}") if valid_tweet_length? msg
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
      when "dm" then 
        username, msg = rest.split(" ", 2)
        dm username, msg
    end
  end

end