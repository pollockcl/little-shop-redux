class CreateItemTable < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :title
      t.text :description
      t.integer :price
      t.integer :merchant_id
      t.text :image_url

      t.timestamps null: false
    end
  end
end
