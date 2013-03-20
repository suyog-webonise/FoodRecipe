class CatagoriesController < ApplicationController
  def index
    @catagories = Catagory.all
  end
end
