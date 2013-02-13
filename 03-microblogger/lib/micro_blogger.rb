require "jumpstart_auth"
require "bitly"
require "klout"

Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'

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

  attr_reader :bitly, :klout

  def initialize
    Bitly.use_api_version_3
    @bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
  end

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

  def shorten_urls msg
    # or use uri.extract()
    url_regex = /https?:\/\/[^\s]+/
    url_occurrences = msg.scan(url_regex)
    url_occurrences.each do |url|
      msg = msg.gsub(url, bitly.shorten(url).short_url)
    end
    msg
  end

  def tweet msg
    client.update(shorten_urls msg) if valid_tweet_length? msg
  end

  def dm username, msg
    client.update(shorten_urls "d #{username} #{msg}") if valid_tweet_length? msg
  end

  def actions 
    @actions ||= [TweetAction, DmAction, NoAction]
  end

  def followers
    client.followers.map {|follower| follower["screen_name"] }
  end

  def followers_rank
    followers.sort_by { |follower| score follower }.reverse
  end

  # extra: followers with scores beside
  def followers_with_scores_sorted
    followers_with_scores.sorty_by { |follower,score| score }.reverse
  end

  def followers_with_scores
    fws = followers.map do |follower|
      [follower, score(follower)]
    end
    Hash[fws]
  end

  def score screen_name
    begin
      identity = Klout::Identity.find_by_screen_name(screen_name)
      user = Klout::User.new(identity.id)
      user.score.score
    rescue Klout::NotFound
      puts "I failed to contact Klout"
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

    current_action = actions.find { |action| action.apply? command }
    current_action.execute(self, rest)
  end

end