class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title,        null: false
      t.date :date,           null: false
      t.string :website
      t.string :street,       null: false
      t.string :city,         null: false
      t.string :postal_code,  null: false
      t.text :description,    null: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
