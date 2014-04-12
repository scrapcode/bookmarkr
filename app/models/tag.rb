class Tag < ActiveRecord::Base
  has_many :tag_mark_relationships
  has_many :marks, through: :tag_mark_relationships
  
end
