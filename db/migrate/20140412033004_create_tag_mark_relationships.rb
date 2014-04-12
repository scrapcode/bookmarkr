class CreateTagMarkRelationships < ActiveRecord::Migration
  def change
    create_table :tag_mark_relationships do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :mark, index: true

      t.timestamps
    end
  end
end
