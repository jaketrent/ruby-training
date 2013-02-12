class Recipe

  def initialize title, ingredients, instructions, servings=nil
    @title = title
    @ingredients = ingredients
    @instructions = instructions
    @servings = servings
  end

  attr_reader :title, :ingredients, :instructions, :servings
  #attr_accessor
  
end
