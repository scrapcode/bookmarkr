class Tag < ActiveRecord::Base
  has_many :tag_mark_relationships
  has_many :marks, through: :tag_mark_relationships
  
  before_save { self.name = name.downcase }

  # Validations

  validates :name, presence: true,
                   length: 3..50,
                   format: { with: /\A[\w\s]+\z/ }
end
