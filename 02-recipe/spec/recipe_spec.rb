require "spec_helper"
require "recipe"

describe Recipe do 

  describe "#initialize" do

    let(:title) { "Test title" }
    let(:ingredients) { ["Test ingredient 1"] }
    let(:instructions) { ["Test instruction 1"] }
    let(:servings) { "Test num servings" }
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

      let(:recipe) do
        recipe = Recipe.new title, ingredients, instructions, servings
      end
      
      it "should store a serving" do
        recipe.servings.should eq servings
      end

    end

    describe "named parameters" do

      let(:recipe) do
        Recipe.new title: title, 
          ingredients: ingredients, 
          instructions: instructions,
          servings: servings
      end

      it "should store the named param title" do
        recipe.title.should eq title
      end

      it "should store the named param ingredients" do
        recipe.ingredients.should eq ingredients
      end

      it "should store the named param instructions" do
        recipe.instructions.should eq instructions
      end

      it "should store the named param servings" do
        recipe.servings.should eq servings
      end

    end

  end

  describe "#include?" do

    let(:title) { "Test title" }
    let(:instructions) { ["Test instruction 1"] }
    let(:servings) { "Test num servings" }
    
    describe "single ingredient checks" do

      let(:ingred1) { "Test ingred 1" }
      let(:recipe) do
        recipe = Recipe.new title, [ingred1], instructions
      end

      it "wont match for obviously wrong single value" do
        expect(recipe.include? "asdfasdfasdf").to eq false
      end

      it "matches single, exact ingredient" do
        expect(recipe.include? ingred1).to eq true
      end

      it "matches single, substring ingredients" do
        expect(recipe.include? ingred1[3..-3]).to eq true
      end

    end

  end

end