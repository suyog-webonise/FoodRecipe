class RecipesController < ApplicationController
  def list
    @recipes = Recipe.find_all_by_catagory_id(params[:id])
  end

  def show
    @particular_recipe = Recipe.find(params[:id])
  end
end
