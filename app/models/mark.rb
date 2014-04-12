class Mark < ActiveRecord::Base
  belongs_to :user
  
  has_many :tag_mark_relationships
  has_many :tags, through: :tag_mark_relationships

  def tag_list=(tag_list)
    self.tags.clear
    
    tags = tag_list.split(",").collect{|s| s.strip.downcase}
    
    tags.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      self.tags << tag
    end
  end
  
  def tag_list
    self.tags.map { |t| t.name }.join(", ")
  end
end
