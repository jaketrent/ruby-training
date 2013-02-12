class Recipe

  def initialize title, ingredients, instructions
    @title = title
    @ingredients = ingredients
    @instructions = instructions
  end

  attr_reader :title, :ingredients, :instructions
  
end
