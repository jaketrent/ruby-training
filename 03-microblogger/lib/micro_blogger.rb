require "jumpstart_auth"

class TweetAction
  def self.apply?(criteria)
    criteria == "tweet"
  end
  def self.execute(blogger, msg)
    blogger.tweet(msg)
  end
end

class DmAction
  def self.apply?(criteria)
    criteria == "dm"
  end
  def self.execute(blogger, username_msg)
    username, msg = username_msg.split(" ", 2)
    blogger.dm(username, msg)
  end
end

class NoAction
  def self.apply?(criteria)
    true
  end
  def self.execute(blogger, msg) ; end
end

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

  def actions 
    [TweetAction, DmAction, NoAction]
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

    current_action = actions.find { |action| action.apply? command }
    current_action.execute(self, rest)
  end

end