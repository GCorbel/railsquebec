# This migration comes from minimalist (originally 20130324132057)
class CreatePageParts < ActiveRecord::Migration
  def up
    create_table :page_parts do |t|
      t.string :title
      t.timestamps
      t.references :page
    end
    PagePart.create_translation_table! body: :text
  end

  def down
    drop_table :page_parts
    PagePart.drop_translation_table!
  end
end
