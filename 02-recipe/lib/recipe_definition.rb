require "recipe"

class Fixnum
  def cup
    self > 1 ? "#{self} cups" : "#{self} cup"
  end
  def dozen
    "#{self} dozen"
  end
end

class RecipeDefinition
  
  def title val=nil
    val ? @title = val : @title
  end

  def initialize &block
    instance_eval(&block) if block
  end

  def ingredients
    @ingredients
  end

  def ingredient amt, item, state=nil
    @ingredients ||= []
    @ingredients.push(state ? "#{amt} #{item}, #{state}" : "#{amt} #{item}")
  end

  def instructions
    @instructions
  end

  def instruction instruct
    @instructions ||= []
    @instructions.push instruct
  end

  def servings amt=nil, item=nil
    amt ? @servings = "#{amt} #{item}" : @servings
  end

  def generate_recipe
    Recipe.new title: title, 
          ingredients: ingredients, 
          instructions: instructions,
          servings: servings
  end

end