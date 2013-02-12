require "spec_helper"
require "recipe"

describe Recipe do 

  describe "#initialize" do

    before do
      @title = "Test title"
      @ingredients = ["Test ingredient 1"]
      @instructions = ["Test instruction 1"]
    end

    let(:recipe) do
      Recipe.new @title, @ingredients, @instructions
    end

    it "should take title, ingredients, and instructions" do
      recipe.should be_an_instance_of Recipe
    end

    it "should store the title" do
      recipe.title.should eq @title
    end

    it "should store the ingredients" do
      recipe.ingredients.should eq @ingredients
    end

    it "should store the instructions" do
      recipe.instructions.should eq @instructions
    end

    describe "input validation" do

      it "should require at least one ingredient" do
        # recipe.
      end

    end

  end

end