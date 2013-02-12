class Recipe

  def initialize params, ingredients=nil, instructions=nil, servings=nil
    params = parse_params params, ingredients, instructions, servings

    params.each do |k,v|
      if respond_to? k and !v.nil? then
        instance_variable_set "@#{k}", v
      end
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
  
  def include? *ingreds_to_check
    found = Array.new
    ingreds_to_check.each do |check_ingred|
      found = found + @ingredients.find_all do |ingred|
        ingred.include? check_ingred
      end
    end
    found.count > 0
  end

end
