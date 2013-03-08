class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github,         default: ""
      t.string :twitter,        default: ""
      t.boolean :email_visible, default: true
      t.string :website,        default: ""
      t.string :username,       default: "", null: false
      t.string :street,         default: ""
      t.string :city,           default: ""
      t.string :postal_code,    default: ""

      t.timestamps
    end
  end
end
