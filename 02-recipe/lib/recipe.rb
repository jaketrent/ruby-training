class Recipe

  def initialize params, ingredients=nil, instructions=nil, servings=nil
    parse_params params, ingredients, instructions, servings
  end

  def parse_params params, ingredients, instructions, servings
    if params.is_a? Hash then
      params.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
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
