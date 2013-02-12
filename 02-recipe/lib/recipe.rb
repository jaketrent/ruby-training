class Recipe

  def initialize params, ingredients=nil, instructions=nil, servings=nil
    params = parse_params params, ingredients, instructions, servings
    
    params.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def parse_params name_or_params, ingredients, instructions, servings
    return name_or_params if name_or_params.is_a? Hash

    { title: name_or_params,
      ingredients: ingredients,
      instructions: instructions,
      servings: servings }
  end

  attr_reader :title, :ingredients, :instructions, :servings
  #attr_accessor
  
end
