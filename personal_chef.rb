class ManServant

	def serve_me
		puts "Serving you now..."
	end

end

class Butler < ManServant

  def open_door which="front"
  	self.serve_me
    puts "Opening the #{which} door"
  end

end

class PersonalChef < ManServant

  def make_toast style=default_toast_style
    puts "Making your #{style} toast!"
    self
  end

  def make_milkshake consistency=default_milkshake_consistency
  	puts "Making your #{consistency} milkshake"
    self
  end

  def default_toast_style
    "sourdough"
  end

  def default_milkshake_consistency
    "thick"
  end

end

frank = PersonalChef.new
frank.make_toast.make_milkshake

jeeves = Butler.new
jeeves.open_door "secret"


