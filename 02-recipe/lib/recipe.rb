class Recipe

  def initialize params, ingredients=nil, instructions=nil, servings=nil
    if params.is_a? Hash then
      @title = params[:title]
      @ingredients = params[:ingredients]
      @instructions = params[:instructions]
      @servings = params[:servings]
    else
      @title = params
      @ingredients = ingredients
      @instructions = instructions
      @servings = servings
    end
  end

  attr_reader :title, :ingredients, :instructions, :servings
  #attr_accessor
  
end
