require "spec_helper"
require "recipe_definition"

describe RecipeDefinition do

  
  describe "initialize" do

    let(:defn) do
      RecipeDefinition.new
    end

    it "should have a settable title" do
      title = "Choco cookie"
      defn.title title
      defn.title.should eq title
    end

    it "should have a settable ingredient" do
      defn.ingredient "1 cup", "butter", "softened"
      defn.ingredients[0].should eq "1 cup butter, softened"
    end

    it "should have a settable instruction" do
      defn.instruction "Preheat oven"
      defn.instructions[0].should eq "Preheat oven"
    end

    it "should have a settable servings" do
      defn.servings "4 dozen", "cookies"
      defn.servings.should eq "4 dozen cookies"
    end

    describe "measurement conversions" do

      it "ingredients should allow 1 cup" do
        defn.ingredient 1.cup, "butter"
        defn.ingredients[0].should eq "1 cup butter"
      end

      it "ingredients should allow multiple cups" do
        defn.ingredient 3.cup, "butter"
        defn.ingredients[0].should eq "3 cups butter"
      end

      it "servings should allow dozens" do
        defn.servings 53.dozen, "cookies"
        defn.servings.should eq "53 dozen cookies"
      end

    end

  end

  describe "#generate_recipe" do

    it "should contain all input (1st method)" do
      defn = RecipeDefinition.new
      defn.title "Choco cookies"
      defn.ingredient 1.dozen, "flowers", "stored"
      defn.instruction "Heat all day"
      defn.servings 2.dozen, "many"

      recipe = defn.generate_recipe

      recipe.title.should eq "Choco cookies"
      recipe.ingredients[0].should eq "1 dozen flowers, stored"
      recipe.instructions[0].should eq "Heat all day"
      recipe.servings.should eq "2 dozen many"
    end

    it "should contain all input (2nd block method)" do
      defn = RecipeDefinition.new do
        title "Choco cookies"
        ingredient 1.dozen, "flowers", "stored"
        instruction "Heat all day"
        servings 2.dozen, "many"
      end

      recipe = defn.generate_recipe

      recipe.title.should eq "Choco cookies"
      recipe.ingredients[0].should eq "1 dozen flowers, stored"
      recipe.instructions[0].should eq "Heat all day"
      recipe.servings.should eq "2 dozen many"
    end

    it "should parse a string block" do

    end

  end

end