require 'manservant'

class Butler < ManServant

  def open_door which="front"
    self.serve_me
    if (["bathroom", "bedroom", "safe"].include? which) then
      puts "I'm sorry.  I cannot open that door, sir."
    else
      puts "Opening the #{which} door, sir."
    end
  end

  def greet 
    d = Date.today
    today = d.strftime("%A")
    day_of_year = d.strftime("%j")
    puts "Happy #{today}!  It's the #{day_of_year} day of the year!"
  end

end

jeeves = Butler.new
jeeves.open_door "secret"
jeeves.greet
