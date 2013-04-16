class AddCategoryIdToPage < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.references :category
    end
  end
end
