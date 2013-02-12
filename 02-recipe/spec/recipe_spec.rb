require "spec_helper"
require "recipe"

describe Recipe do 

  describe "#initialize" do
    
    let(:title) { "Test title" }
    let(:ingredients) { ["Test ingredient 1"] }
    let(:instructions) { ["Test instruction 1"] }
    let(:recipe) do
      Recipe.new title, ingredients, instructions
    end

    it "should take title, ingredients, and instructions, no optional params" do
      recipe.should be_an_instance_of Recipe
    end

    it "should store the title" do
      recipe.title.should eq title
    end

    it "should store the ingredients" do
      recipe.ingredients.should eq ingredients
    end

    it "should store the instructions" do
      recipe.instructions.should eq instructions
    end

    describe "optionaly allows servings" do

      let(:servings) { "Test num servings" }
      let(:recipe) do
        recipe = Recipe.new title, ingredients, instructions, servings
      end
      
      it "should store a serving" do
        recipe.servings.should eq servings
      end

    end

  end

end