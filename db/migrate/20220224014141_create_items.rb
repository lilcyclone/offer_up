class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.string :description
      t.string :location
      t.string :image
      t.integer :category_id
      t.integer :seller_id
      t.boolean :is_sold

      t.timestamps
    end
  end
end
