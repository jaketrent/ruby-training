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
    let(:ingred1) { "Test ingred 1" }
    let(:ingred2) { "Drastically different second ingredient" }
    let(:instructions) { ["Test instruction 1"] }
    let(:servings) { "Test num servings" }
    
    describe "single ingredient checks" do

      let(:recipe) do
        recipe = Recipe.new title, [ingred1], instructions
      end

      it "wont match for obviously wrong single value" do
        expect(recipe.include? "asdfasdfasdf").to be_false
      end

      it "matches single, exact ingredient" do
        expect(recipe.include? ingred1).to be_true
      end

      it "matches single, substring ingredients" do
        expect(recipe.include? ingred1[3..-3]).to be_true
      end

    end

    describe "multiple OR ingredient checks" do
      
      let(:recipe) do
        recipe = Recipe.new title, [ingred1, ingred2], instructions
      end

      it "wont match if all ingredients are not included" do
        expect(recipe.include? "crazy", "unincluded", "stuff").to be_false
      end

      it "will match if one exact ingredient is included" do
        expect(recipe.include? "crazy", ingred1, "stuff").to be_true
      end

      it "will match if multiple exact ingredients are included" do
        expect(recipe.include? "crazy", ingred1, ingred2).to be_true
      end

      it "will match if all exact ingredients are included" do
        expect(recipe.include? ingred1, ingred2).to be_true
      end

      it "will match if multiple substring ingredients are included" do
        expect(recipe.include? ingred1[0..-5], ingred2[2..-2]).to be_true
      end

    end

  end

end