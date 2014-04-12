class TagMarkRelationship < ActiveRecord::Base
  belongs_to :tag
  belongs_to :mark
end
