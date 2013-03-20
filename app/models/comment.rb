class Comment < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :comment, :commenter, :recipe_id
  validates_presence_of :commenter, :message => "Please enter commenter name"
  validates_presence_of :comment, :message => "Please enter the comment"
end
