class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string  :company_name
      t.string  :email
      t.string  :website
      t.string  :post_name
      t.string  :street
      t.string  :city
      t.string  :postal_code
      t.text    :description
      t.float   :latitude
      t.float   :longitude

      t.timestamps
    end
  end
end
