class Recipe < ActiveRecord::Base
  belongs_to :catagory
  has_many :comments
  attr_accessible :ingredients, :name, :procedure, :catagory_id
end
